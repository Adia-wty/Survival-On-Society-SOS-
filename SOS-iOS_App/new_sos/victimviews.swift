//
//  victimviews.swift
//  new_sos
//
//  Created by Adia. on 2019/7/13.
//  Copyright © 2019 Adia. All rights reserved.
//

import Foundation
import MapKit

class VictimMarkerView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let victim = newValue as? victim else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            markerTintColor = victim.markerTintColor
            if let imageName = victim.imageName {
                glyphImage = UIImage(named: imageName)
            } else {
                glyphImage = nil
            }
        }
    }
    
}

class VictimView: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let victim = newValue as? victim else {return}
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                    size: CGSize(width: 15, height: 15)))
            mapsButton.setBackgroundImage(UIImage(named: "Maps-icon"), for: UIControl.State())
            rightCalloutAccessoryView = mapsButton
            //      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            if let imageName = victim.imageName {
                image = UIImage(named: imageName)
            } else {
                image = nil
            }
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 1
            detailLabel.font = detailLabel.font.withSize(16)
            detailLabel.text = victim.location
            detailCalloutAccessoryView = detailLabel
        }
    }
    
}
