//
//  SafeViewController.swift
//  new_sos
//
//  Created by Adia. on 2019/7/13.
//  Copyright © 2019 Adia. All rights reserved.
//

import UIKit
import AVKit

class SafeViewController: UIViewController {
    
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var medicineLabel: UILabel!
    @IBOutlet weak var CPRLabel: UILabel!
    
    @IBOutlet weak var waterSwitch: UISwitch!
    @IBOutlet weak var foodSwitch: UISwitch!
    @IBOutlet weak var medicineSwitch: UISwitch!
    @IBOutlet weak var CPRSwitch: UISwitch!
    
    @IBAction func waterSwitch(_ sender: UISwitch) {
        waterLabel.text = sender.isOn ? "I have water." : "I don't have water."
    }
    @IBAction func foodSwitch(_ sender: UISwitch) {
        foodLabel.text = sender.isOn ? "I have food." : "I don't have food."
    }
    @IBAction func medicineSwitch(_ sender: UISwitch) {
        medicineLabel.text = sender.isOn ? "I have medicine." : "I don't have medicine."
    }
    @IBAction func CPRSwitch(_ sender: UISwitch) {
        CPRLabel.text = sender.isOn ? "I am capable of CPR." : "I am not capable of CPR."
    }
    
    @IBAction func watchVideo(_ sender: UIButton) {
        if let path = Bundle.main.path(forResource: "CPR", ofType: "mp4"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer, animated: true, completion: {video.play()})
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let water = UserDefaults.standard.object(forKey: "waterLabel") as? String{
            waterSwitch.isOn = (water == "I have water.")
            waterLabel.text = waterSwitch.isOn ? "I have water." : "I don't have water."
        }
        if let medicine = UserDefaults.standard.object(forKey: "medicineLabel") as? String{
            medicineSwitch.isOn = (medicine == "I have medicine.")
            medicineLabel.text = medicineSwitch.isOn ? "I have medicine." : "I don't have medicine."
        }
        if let needFood = UserDefaults.standard.object(forKey: "foodLabel") as? String{
            foodSwitch.isOn = (needFood == "I have food.")
            foodLabel.text = foodSwitch.isOn ? "I have food." : "I don't have food."
        }
        if let needCPR = UserDefaults.standard.object(forKey: "CPRLabel") as? String{
            CPRSwitch.isOn = (needCPR == "I am capable of CPR.")
            CPRLabel.text = CPRSwitch.isOn ? "I am capable of CPR." : "I am not capable of CPR."
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(true, forKey: "returnFromSafe")
        UserDefaults.standard.set(waterLabel.text, forKey: "waterLabel")
        UserDefaults.standard.set(foodLabel.text, forKey: "foodLabel")
        UserDefaults.standard.set(medicineLabel.text, forKey: "medicineLabel")
        UserDefaults.standard.set(CPRLabel.text, forKey: "CPRLabel")
    }

}
