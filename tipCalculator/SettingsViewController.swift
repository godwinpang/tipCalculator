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
    
    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeControl: UISegmentedControl!

    @IBOutlet weak var customTipLabel: UILabel!
    @IBOutlet weak var tip1Name: UILabel!
    @IBOutlet weak var tip2Name: UILabel!
    @IBOutlet weak var tip3Name: UILabel!
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
        
        if ((tipSettings.string(forKey: "themeSetting")) == "light"){
            themeControl.selectedSegmentIndex = 0
        } else {
            themeControl.selectedSegmentIndex = 1
        }
        
        self.editThemeSetting(self)
        
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
    
    @IBAction func editThemeSetting(_ sender: Any) {
        if (themeControl.selectedSegmentIndex == 0){
            tipSettings.set("light", forKey: "themeSetting")
            view.backgroundColor = .white
            defaultTipLabel.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            defaultTipControl.tintColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            themeLabel.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            themeControl.tintColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            customTipLabel.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            tip1Name.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            tip2Name.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            tip3Name.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            tip1Label.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            tip2Label.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            tip3Label.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            tip1Control.tintColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            tip2Control.tintColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            tip3Control.tintColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
        } else {
            tipSettings.set("dark", forKey: "themeSetting")
            view.backgroundColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            defaultTipLabel.textColor = .white
            defaultTipControl.tintColor = .white
            themeLabel.textColor = .white
            themeControl.tintColor = .white
            customTipLabel.textColor = .white
            tip1Name.textColor = .white
            tip2Name.textColor = .white
            tip3Name.textColor = .white
            tip1Label.textColor = .white
            tip2Label.textColor = .white
            tip3Label.textColor = .white
            tip1Control.tintColor = .white
            tip2Control.tintColor = .white
            tip3Control.tintColor = .white
        }
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
