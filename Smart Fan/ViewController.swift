//
//  ViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 29/07/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DeviceCollectionViewCellDelegate {
    
    enum CardState {
        case collapsed
        case expanded
    }

    @IBOutlet weak var deviceCollectionView: UICollectionView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userButton: UIButton!
    var gradientLayer: CAGradientLayer!
    let transition = SlideInTransition()
    var allDevices : Array<Device>!
    var deviceCategory:[DeviceType : [Device]]!
    
    
    var cardViewController:RemoteViewController!
    var visualEffectView:UIVisualEffectView!
    
    var cardHeight:CGFloat!
    var cardHandleAreaHeight:CGFloat!
    var cardMiniHeight:CGFloat!
    
    var cardVisible = false
    var nextState: CardState {
        return cardVisible ? .collapsed : .expanded
    }
    var runningAnimation = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceCollectionView.delegate = self
        deviceCollectionView.dataSource = self
        deviceCollectionView.register(UINib(nibName: "DeviceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "deviceCell")
        allDevices = Device.allDevices()
        deviceCategory = Dictionary(grouping: allDevices, by: { $0.deviceType})
        
    }
    
    func setUpRemoteController(name: String) {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        
        cardViewController = RemoteViewController(nibName:"RemoteViewController", bundle:nil)
        self.addChild(self.cardViewController)
        self.view.addSubview(self.cardViewController.view)
        self.cardViewController.view.frame = CGRect(x: 0, y: cardHeight, width: self.view.bounds.width, height: self.cardHeight)
        UIView.animate(withDuration: 0.4, animations: {
            self.cardViewController.view.frame = CGRect(x: 0, y: self.cardMiniHeight, width: self.view.bounds.width, height: self.cardHeight)
        }, completion: nil)
        
        
        
        self.cardViewController.view.clipsToBounds = true
        self.cardViewController.view.backgroundColor = UIColor.init(red: 87.0/255.0, green: 180.0/255.0, blue: 206.0/255.0, alpha: 1.0)
        self.cardViewController.view.layer.cornerRadius = 12
        cardViewController.constraintHoursView1Top.constant = -136
        cardViewController.lblFanName.text = name
        self.cardViewController.hoursView1.isHidden = true
        self.cardViewController.hoursView2.isHidden = true
        self.cardViewController.typeView.isHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handleCardPan(recognizer:)))
        
        cardViewController.handleView.addGestureRecognizer(tapGestureRecognizer)
        cardViewController.handleView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc
    func handleCardTap(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    @objc
    func handleCardPan (recognizer:UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let translation = recognizer.translation(in: self.cardViewController.handleView)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
        
    }
    
    func animateTransitionIfNeeded (state:CardState, duration:TimeInterval) {
        if runningAnimation.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    UIView.animate(withDuration: 0.3, animations: {
                        self.cardViewController.hoursView1.isHidden = false
                        self.cardViewController.hoursView2.isHidden = false
                         self.cardViewController.typeView.isHidden = false
                        self.cardViewController.constraintHoursView1Top.constant = 0
                        self.cardViewController.gestureImageView.image = UIImage(named: "swipedown")
                        self.cardViewController.lblFanName.textColor = .white
                        
                    })
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                     self.cardViewController.view.backgroundColor = UIColor.init(red: 87.0/255.0, green: 180.0/255.0, blue: 206.0/255.0, alpha: 0.2)
                    self.cardViewController.constraintHoursView1Top.constant = 0
                case .collapsed:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                    //self.cardViewController.removeFromParent()
                     self.cardViewController.view.backgroundColor = UIColor.init(red: 87.0/255.0, green: 180.0/255.0, blue: 206.0/255.0, alpha: 1.0)
                    UIView.animate(withDuration: 0.3, animations: {
                        self.cardViewController.constraintHoursView1Top.constant = -136
                        self.cardViewController.hoursView1.isHidden = true
                        self.cardViewController.hoursView2.isHidden = true
                         self.cardViewController.typeView.isHidden = true
                         self.cardViewController.gestureImageView.image = UIImage(named: "swipeup")
                         self.cardViewController.lblFanName.textColor = UIColor.init(red: 68.0/255.0, green: 75.0/255.0, blue: 84.0/255.0, alpha: 1.0)
                        
                        
                    })
                   self.visualEffectView.removeFromSuperview()
                    
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimation.removeAll()
               
            }
            
            frameAnimator.startAnimation()
          
            runningAnimation.append(frameAnimator)
            
            
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.cardViewController.view.layer.cornerRadius = 12
                case .collapsed:
                    self.cardViewController.view.layer.cornerRadius = 0
                }
            }
            
            cornerRadiusAnimator.startAnimation()
            runningAnimation.append(cornerRadiusAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .dark)
                case .collapsed:
                    self.visualEffectView.effect = nil
                }
            }
            
            blurAnimator.startAnimation()
            runningAnimation.append(blurAnimator)
            
        }
    }
    
    func startInteractiveTransition(state:CardState, duration:TimeInterval) {
        if runningAnimation.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimation {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimation {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition (){
        for animator in runningAnimation {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
    
    @objc func viewTapped() {
        if transition.isPresenting {
            print(transition.isPresenting)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func openMenuController(_ sender: UIButton) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "menuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToOtherControllers(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true, completion: nil)
    }
    
    func transitionToOtherControllers(_ menuType: MenuTypes){
        
        switch menuType {
        case .Settings:
            performSegue(withIdentifier: "settingsSegue", sender: self)
        case .Sign:
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
        case .Add:
            performSegue(withIdentifier: "addDeviceSegue", sender: self)
        case .Home:
            return
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return deviceCategory.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let devicesForCategory = Array(deviceCategory.keys)[section]
        return deviceCategory[devicesForCategory]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "deviceCell", for: indexPath) as! DeviceCollectionViewCell
        cell.delegate = self
        let devicesForCategory = Array(deviceCategory.keys)[indexPath.section]
        let device = deviceCategory[devicesForCategory]?[indexPath.row]
        var status = ""
        var imageType = ""
        let deviceStatus = device?.status
        let deviceName = device?.deviceType
        if deviceStatus == 0{
            status = "OFF"
            switch deviceName.map({$0.rawValue}) {
            case "Fan":
                imageType = "fanoff"
            case "Light":
                imageType = "lightoff"
            case "Camera":
                imageType = "camera"
            default:
                imageType = ""
            }
        }
        if deviceStatus == 1 {
            status = "ON"
            switch deviceName.map({$0.rawValue}) {
            case "Fan":
                imageType = "fanon"
            case "Light":
                imageType = "lighton"
            case "Camera":
                imageType = "camera"
            default:
                imageType = ""
            }
        }
        
        cell.deviceIcon.image = UIImage(named: imageType)
        cell.lblStatus.text = status
        cell.lblRoomName.text = device?.roomName
        return cell
        
    }

     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
        String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableView:UICollectionReusableView!
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                "headerCell", for: indexPath) as! TestCollectionReusableView
            let sectionName = Array(deviceCategory.keys)[indexPath.section]
            let cat = deviceCategory[sectionName]?[indexPath.row]
            header.lblName?.text = (cat?.deviceType).map { $0.rawValue }
            reusableView = header
        }

        return reusableView
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize(width: collectionView.frame.size.width, height: 40)
    }
    
    func didSelectDevice(deviceID: String) {
       
        cardHeight = self.view.bounds.height
        cardHandleAreaHeight = 0
        if self.view.bounds.height < 600 {
             cardMiniHeight = cardHeight - (cardHeight/2) - 50
        } else {
            cardMiniHeight = cardHeight / 2
        }

        setUpRemoteController(name: deviceID)
    }

}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

