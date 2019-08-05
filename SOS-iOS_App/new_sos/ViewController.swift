//
//  ViewController.swift
//  Survival-On-Society SOS
//
//  Created by Adia. on 2019/7/13.
//  Copyright © 2019 Adia. All rights reserved.
//

import UIKit
import MapKit

func needString(_ need : [Bool])-> String {
    var out = "Need: "
    if need[0] {out.append("medicine")}
    if need[1] {out.append(" water")}
    if need[2] {out.append(" food")}
    if need[3] {out.append(" PCR")}
    return out
}

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!

    var firstInAppear = false

    
    // I was lazy to check how to generate random numbers in swift. But laziness brings tediousness.
    var victimMe = victim(name: "Jack",
                   location: needString([true, false, false, false]),
                   need: [true, false, false, false],
                   condition: 100,
                   coordinate: CLLocationCoordinate2DMake(31, 121))
    let victim1 = victim(name: "Adia",
                   location: needString([true, true, true, false]),
                   need: [true, true, true, false],
                   condition: 90,
                   coordinate: CLLocationCoordinate2DMake(30.97, 121.1)
    let victim2 = victim(name: "Wilson",
                   location: needString([true, true, false, true]),
                   need: [true, true, false, true],
                   condition: 30,
                   coordinate: CLLocationCoordinate2DMake(30.90, 121.15))
    let victim3 = victim(name: "Maxwell",
                         location: needString([true, false, true, true]),
                         need: [true, false, true, true],
                         condition: 40,
                         coordinate: CLLocationCoordinate2DMake(31.04, 120.88))
    let victim4 = victim(name: "Spensor",
                         location: needString([false, true, true, true]),
                         need: [false, true, true, true],
                         condition: 70,
                         coordinate: CLLocationCoordinate2DMake(31.04, 121.04))
    let victim5 = victim(name: "Ophelia",
                         location: needString([false, false, true, true]),
                         need: [false, false, true, true],
                         condition: 40,
                         coordinate: CLLocationCoordinate2DMake(30.94, 120.91))
    let victim6 = victim(name: "Ed Sheeran",
                         location: needString([true, false, false, true]),
                         need: [true, false, false, true],
                         condition: 40,
                         coordinate: CLLocationCoordinate2DMake(30.8, 120.92))
    let victim7 = victim(name: "TayTay",
                         location: needString([true, true, false, false]),
                         need: [true, true, false, false],
                         condition: 70,
                         coordinate: CLLocationCoordinate2DMake(30.85, 120.93))
    let victim8 = victim(name: "Dwayne Johnson",
                         location: needString([true, false, true, false]),
                         need: [true, false, true, false],
                         condition: 40,
                         coordinate: CLLocationCoordinate2DMake(31.12, 120.99))
    let victim9 = victim(name: "Lilith",
                         location: needString([false, true, false, true]),
                         need: [false, true, false, true],
                         condition: 90,
                         coordinate: CLLocationCoordinate2DMake(31.09, 120.85))
    let victim10 = victim(name: "No more name",
                         location: needString([true, false, false, true]),
                         need: [true, false, false, true],
                         condition: 40,
                         coordinate: CLLocationCoordinate2DMake(31.17, 120.89))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2DMake(31, 121)
        let span = MKCoordinateSpan(latitudeDelta: 0.4,longitudeDelta: 0.4)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        map.delegate = self
        map.register(VictimView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        UserDefaults.standard.set(true, forKey: "isHurt")
        UserDefaults.standard.set(false, forKey: "needWater")
        UserDefaults.standard.set(false, forKey: "needFood")
        UserDefaults.standard.set(false, forKey: "needCPR")
        
        UserDefaults.standard.set("I have water.", forKey: "waterLabel")
        UserDefaults.standard.set("I have food.", forKey: "foodLabel")
        UserDefaults.standard.set("I have medicine.", forKey: "medicineLabel")
        UserDefaults.standard.set("I am not capable of CPR.", forKey: "CPRLabel")
        
        map.addAnnotation(victim1)
        map.addAnnotation(victim2)
        map.addAnnotation(victim3)
        map.addAnnotation(victim4)
        map.addAnnotation(victim5)
        map.addAnnotation(victim6)
        map.addAnnotation(victim7)
        map.addAnnotation(victim8)
        map.addAnnotation(victim9)
        map.addAnnotation(victim10)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationAuthorizationStatus()
        if firstInAppear == false {
            firstInAppear = true
        }
        else if let returnFromSafe = UserDefaults.standard.object(forKey: "returnFromSafe") as? Bool{
            if !returnFromSafe {
                map.removeAnnotation(victimMe)
                if let mycondition = UserDefaults.standard.object(forKey: "condition") as? Int{
                    if let isHurt = UserDefaults.standard.object(forKey: "isHurt") as? Bool{
                        if let needWater = UserDefaults.standard.object(forKey: "needWater") as? Bool{
                            if let needFood = UserDefaults.standard.object(forKey: "needFood") as? Bool {
                                if let needCPR = UserDefaults.standard.object(forKey: "needCPR") as? Bool{
                                    print(mycondition)
                                    victimMe = victim(name: "Jack",
                                                      location: needString([isHurt, needWater, needFood, needCPR]),
                                                      need: [isHurt, needWater, needFood, needCPR],
                                                      condition: mycondition,
                                                      coordinate: CLLocationCoordinate2DMake(31, 121))
                                }
                            }
                        }
                    }
                }
            }
        }
        
        map.addAnnotation(victimMe)
        
        if let filterIsOn = UserDefaults.standard.object(forKey: "returnFromSafe") as? Bool  {
            
            if filterIsOn {
                print("yes")
                map.removeAnnotation(victim1)
                map.removeAnnotation(victim2)
                map.removeAnnotation(victim3)
                map.removeAnnotation(victim4)
                map.removeAnnotation(victim5)
                map.removeAnnotation(victim6)
                map.removeAnnotation(victim7)
                map.removeAnnotation(victim8)
                map.removeAnnotation(victim9)
                map.removeAnnotation(victim10)
                
                if let water = UserDefaults.standard.object(forKey: "waterLabel") as? String{
                    if water == "I have water." {
                        map.addAnnotation(victim1)
                        map.addAnnotation(victim2)
                        map.addAnnotation(victim4)
                        map.addAnnotation(victim7)
                        map.addAnnotation(victim9)
                    }
                }
                if let food = UserDefaults.standard.object(forKey: "foodLabel") as? String{
                    if food == "I have food." {
                        map.addAnnotation(victim1)
                        map.addAnnotation(victim3)
                        map.addAnnotation(victim4)
                        map.addAnnotation(victim5)
                        map.addAnnotation(victim8)
                    }
                }
                if let medicine = UserDefaults.standard.object(forKey: "medicineLabel") as? String{
                    if medicine == "I have medicine." {
                        map.addAnnotation(victim1)
                        map.addAnnotation(victim2)
                        map.addAnnotation(victim3)
                        map.addAnnotation(victim6)
                        map.addAnnotation(victim7)
                        map.addAnnotation(victim8)
                        map.addAnnotation(victim10)
                    }
                }
                if let CPR = UserDefaults.standard.object(forKey: "waterLabel") as? String{
                    if CPR == "I am capable of CPR." {
                        map.addAnnotation(victim1)
                        map.addAnnotation(victim3)
                        map.addAnnotation(victim4)
                        map.addAnnotation(victim5)
                        map.addAnnotation(victim6)
                        map.addAnnotation(victim9)
                        map.addAnnotation(victim10)
                    }
                }
            }
        }
    }
    
    // MARK: - CLLocationManager
    
    let locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            map.showsUserLocation = true
        } else {
            locationManager.requestAlwaysAuthorization()
        }
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
              map.showsUserLocation = true
            } else {
              locationManager.requestWhenInUseAuthorization()
            }
    }
    
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! victim
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:
            MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
}

