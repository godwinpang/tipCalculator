//
//  ViewController.swift
//  tipCalculator
//
//  Created by Godwin Pang on 12/18/17.
//  Copyright © 2017 godwinpang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tipSettings = UserDefaults.standard
    let locale = Locale.current
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var total2Label: UILabel!
    @IBOutlet weak var total3Label: UILabel!
    @IBOutlet weak var total4Label: UILabel!
    
    var tip1 = 0
    var tip2 = 0
    var tip3 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billField.becomeFirstResponder()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        let currencySymbol1 = locale.currencySymbol!
        billField.placeholder = currencySymbol1
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (tipSettings.object(forKey: "defaultTipIndex") != nil){
            tipControl.selectedSegmentIndex = tipSettings.integer(forKey: "defaultTipIndex")
        }
        else{
            tipControl.selectedSegmentIndex = 0
        }
        
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
        
        tipControl.setTitle(String(tip1)+"%", forSegmentAt: 0)
        tipControl.setTitle(String(tip2)+"%", forSegmentAt: 1)
        tipControl.setTitle(String(tip3)+"%", forSegmentAt: 2)
        
        let tipPercentages = [Double(tip1)/100, Double(tip2)/100, Double(tip3)/100]
        let bill = Double(billField.text!) ?? 0
        let tip =  bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let currencySymbol = locale.currencySymbol!
        print("currencySymbol = \(currencySymbol)")
        
        tipLabel.text = String (format: "\(currencySymbol)%.2f", tip)
        totalLabel.text = String (format: "\(currencySymbol)%.2f", total)
        total2Label.text = String (format: "\(currencySymbol)%.2f", total/2.0)
        total3Label.text = String (format: "\(currencySymbol)%.2f", total/3.0)
        total4Label.text = String (format: "\(currencySymbol)%.2f", total/4.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let currencySymbol = locale.currencySymbol!
        let tipPercentages = [Double(tip1)/100, Double(tip2)/100, Double(tip3)/100]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String (format: "\(currencySymbol)%.2f", tip)
        totalLabel.text = String (format: "\(currencySymbol)%.2f", total)
        total2Label.text = String (format: "\(currencySymbol)%.2f", total/2.0)
        total3Label.text = String (format: "\(currencySymbol)%.2f", total/3.0)
        total4Label.text = String (format: "\(currencySymbol)%.2f", total/4.0)
    }
    

}

