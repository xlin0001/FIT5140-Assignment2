//
//  Raspio.swift
//  FIT5140-Assignment2
//
//  Created by 沈宇帆 on 2018/9/16.
//  Copyright © 2018年 Monash University. All rights reserved.
//

import UIKit

internal class Raspio: NSObject {
    internal let id : String
    internal let name : String
    internal let red : String
    internal let blue : String
    internal let green : String
    internal let temp : String
    internal let pressure : String
    internal let altimeter : String
    init(id: String, name: String,red: String,blue: String, green: String, temp: String,pressure : String,altimeter : String) {
        self.id = id
        self.name = name
        self.red = red
        self.blue = blue
        self.green = green
        self.temp = temp
        self.altimeter = altimeter
        self.pressure = pressure
    }
}
