//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Godwin Pang on 12/18/17.
//  Copyright © 2017 godwinpang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let tipSettings = UserDefaults.standard
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!

    @IBOutlet weak var tip1Control: UIStepper!
    @IBOutlet weak var tip2Control: UIStepper!
    @IBOutlet weak var tip3Control: UIStepper!
    
    var tip1 = 0
    var tip2 = 0
    var tip3 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        defaultTipControl.selectedSegmentIndex = tipSettings.integer(forKey: "defaultTipIndex")
        
        if (tipSettings.object(forKey: "customTip1") != nil){
            tip1 = tipSettings.integer(forKey: "customTip1")
        }
        else{
            tip1 = 18
        }
        
        if (tipSettings.object(forKey: "customTip2") != nil){
            tip2 = tipSettings.integer(forKey: "customTip2")
        }
        else{
            tip2 = 20
        }
        
        if (tipSettings.object(forKey: "customTip3") != nil){
            tip3 = tipSettings.integer(forKey: "customTip3")
        }
        else{
            tip3 = 25
        }
        
        tip1Control.value = Double(tip1)
        tip2Control.value = Double(tip2)
        tip3Control.value = Double(tip3)
        
        tip1Label.text = (tip1.description+"%")
        tip2Label.text = (tip2.description+"%")
        tip3Label.text = (tip3.description+"%")

        defaultTipControl.setTitle(String(tip1)+"%", forSegmentAt: 0)
        defaultTipControl.setTitle(String(tip2)+"%", forSegmentAt: 1)
        defaultTipControl.setTitle(String(tip3)+"%", forSegmentAt: 2)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getDefaultTip(_ sender: AnyObject) {
        tipSettings.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipIndex")
        tipSettings.synchronize()
    }
    
    @IBAction func editTip1(_ sender: UIStepper) {
        tip1Label.text = (Int(sender.value).description+"%")
        tipSettings.set(Int(sender.value), forKey: "customTip1")
        tipSettings.synchronize()
        defaultTipControl.setTitle(Int(sender.value).description+"%", forSegmentAt: 0)
    }
    
    @IBAction func editTip2(_ sender: UIStepper) {
        tip2Label.text = (Int(sender.value).description+"%")
        tipSettings.set(Int(sender.value), forKey: "customTip2")
        tipSettings.synchronize()
        defaultTipControl.setTitle(Int(sender.value).description+"%", forSegmentAt: 1)
    }
    
    @IBAction func editTip3(_ sender: UIStepper) {
        tip3Label.text = (Int(sender.value).description+"%")
        tipSettings.set(Int(sender.value), forKey: "customTip3")
        tipSettings.synchronize()
        defaultTipControl.setTitle(Int(sender.value).description+"%", forSegmentAt: 2)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
