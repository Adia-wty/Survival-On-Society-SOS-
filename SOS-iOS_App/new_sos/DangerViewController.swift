//
//  DangerViewController.swift
//  new_sos
//
//  Created by Adia. on 2019/7/13.
//  Copyright © 2019 Adia. All rights reserved.
//

import UIKit

class DangerViewController: UIViewController {
    
    @IBOutlet weak var hurtLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var CPRLabel: UILabel!
    
    @IBOutlet weak var hurtSwitch: UISwitch!
    @IBOutlet weak var waterSwitch: UISwitch!
    @IBOutlet weak var foodSwitch: UISwitch!
    @IBOutlet weak var CPRSwitch: UISwitch!
    
    var condition = 100
    @IBAction func hurtSwitch(_ sender: UISwitch) {
        hurtLabel.text = sender.isOn ? "I am hurt." : "I am not hurt."
        UserDefaults.standard.set(sender.isOn, forKey: "isHurt")
    }
    
    @IBAction func waterSwitch(_ sender: UISwitch) {
        waterLabel.text = sender.isOn ? "I need water." : "I don't need water."
        UserDefaults.standard.set(sender.isOn, forKey: "needWater")
    }
    @IBAction func foodSwitch(_ sender: UISwitch) {
        foodLabel.text = sender.isOn ? "I need food." : "I don't need food."
        UserDefaults.standard.set(sender.isOn, forKey: "needFood")
    }
    @IBAction func CPRSwitch(_ sender: UISwitch) {
        CPRLabel.text = sender.isOn ? "Someone need CPR." : "No one needs CPR."
        UserDefaults.standard.set(sender.isOn, forKey: "needCPR")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let needwater = UserDefaults.standard.object(forKey: "needWater") as? Bool{
            waterSwitch.isOn = needwater
            waterLabel.text = needwater ? "I need water." : "I don't need water."
        }
        if let isHurt = UserDefaults.standard.object(forKey: "isHurt") as? Bool{
            hurtSwitch.isOn = isHurt
            hurtLabel.text = isHurt ? "I am hurt." : "I am not hurt."
        }
        if let needFood = UserDefaults.standard.object(forKey: "needFood") as? Bool{
            foodSwitch.isOn = needFood
            foodLabel.text = needFood ? "I need food." : "I don't need food."
        }
        if let needCPR = UserDefaults.standard.object(forKey: "needCPR") as? Bool{
            CPRSwitch.isOn = needCPR
            CPRLabel.text = needCPR ? "Someone need CPR." : "No one needs CPR."
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if waterLabel.text == "I need water." { condition -= 10}
        if hurtLabel.text == "I am hurt." { condition -= 30}
        if foodLabel.text == "I need water." { condition -= 10}
        UserDefaults.standard.set(condition, forKey: "condition")
        UserDefaults.standard.set(false, forKey: "returnFromSafe")
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
