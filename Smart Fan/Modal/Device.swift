//
//  Device.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 04/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import Foundation

enum DeviceType: String, Codable {
    case Fan, Light, Camera, AC
    
}

class Device: Codable {

    var roomName:String
    var deviceType: DeviceType
    var status: Int?
    var deviceImage: String
    
    init(roomName: String, deviceType:DeviceType, status: Int, deviceImage: String ) {
        self.roomName = roomName
        self.deviceType = deviceType
        self.status = status
        self.deviceImage = deviceImage
    }
    
    
    static func allDevices() -> [Device] {
        return [Device(roomName: "Lobby", deviceType: .Fan, status: 0, deviceImage: "fanoff"),
        Device(roomName: "Bedroom G Floor", deviceType: .Fan, status: 1, deviceImage: "fanon"),
        Device(roomName: "Bedroom 1st Floor", deviceType: .Fan, status: 0, deviceImage: "fanoff"),
        Device(roomName: "Front Gate", deviceType: .Fan, status: 1, deviceImage: "fanon"),
        Device(roomName: "Back Gate", deviceType: .Fan, status: 1, deviceImage: "fanon"),
        Device(roomName: "Corridor", deviceType: .Fan, status: 1, deviceImage: "fanon"),
        Device(roomName: "Terrace", deviceType: .Fan, status: 0, deviceImage: "fanoff"),
        Device(roomName: "Bedroom G Floor", deviceType: .Fan, status: 1, deviceImage: "fanon"),
        Device(roomName: "Bedroom 1st Floor", deviceType: .Fan, status: 0, deviceImage: "fanoff"),

        Device(roomName: "Bedroom G Floor", deviceType: .Light, status: 1, deviceImage: "fanon"),
        Device(roomName: "Bedroom 1st Floor", deviceType: .Light, status: 0, deviceImage: "fanoff"),
        Device(roomName: "Front Gate", deviceType: .Light, status: 1, deviceImage: "fanon"),
        Device(roomName: "Back Gate", deviceType: .Light, status: 1, deviceImage: "fanon"),
        Device(roomName: "Corridor", deviceType: .Light, status: 1, deviceImage: "fanon"),
        Device(roomName: "Terrace", deviceType: .Light, status: 0, deviceImage: "fanoff"),
        Device(roomName: "Bedroom G Floor", deviceType: .Light, status: 1, deviceImage: "fanon"),
        Device(roomName: "Bedroom 1st Floor", deviceType: .Light, status: 0, deviceImage: "fanoff"),
        
        
        ]
    }
    
    
    
}
