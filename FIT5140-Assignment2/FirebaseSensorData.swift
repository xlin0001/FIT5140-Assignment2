//
//  FirebaseSensorData.swift
//  FIT5140-Assignment2
//
//  Created by Oliver Lin on 18/9/18.
//  Copyright © 2018 Monash University. All rights reserved.
//

import Foundation

class FirebaseSensorData{
    var altimeter: Double?
    var blue: Double?
    var id: Int?
    var green: Double?
    var name: String?
    var pressure: Double?
    var red: Double?
    var temp: Double?
    
    init(altimeter: Double?, blue: Double?, id: Int?, green: Double?, name: String?, pressure: Double?, red: Double?, temp: Double?){
        self.altimeter = altimeter
        self.blue = blue
        self.id = id
        self.green = green
        self.name = name
        self.pressure = pressure
        self.red = red
        self.temp = temp
        
    }
    
}
