//
//  victim.swift
//  new_sos
//
//  Created by Adia. on 2019/7/13.
//  Copyright © 2019 Adia. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class victim: NSObject, MKAnnotation {
    let name: String?
    let location: String
    let condition: Int
    let coordinate: CLLocationCoordinate2D
    var need = [Bool](repeating: false, count: 4)
//    var needWater : Bool!
//    var needFood : Bool!
//    var needMedicine : Bool!
//    var needCPR : Bool!
    
    init(name: String, location: String, need : [Bool], condition: Int, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.location = location
        for i in 0...3 {
            self.need[i] = need[i]
        }
//        self.need = need
        self.condition = condition
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return location
    }
    
    var markerTintColor: UIColor  {
        if condition > 85 { return .green }
        else if condition > 55 { return .orange }
        else { return .red }
    }
    
    var imageName: String? {
        if condition > 85 { return "good" }
        else if condition > 65 { return "bad" }
        else { return "dying" }
    }
    
    // Annotation right callout accessory opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        return mapItem
    }
    
}

