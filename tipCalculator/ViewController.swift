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
    @IBOutlet weak var tipView: UIView!
    
    var tip1 = 0
    var tip2 = 0
    var tip3 = 0
    var viewInEmptyPosition = true
    
    let currencyFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billField.becomeFirstResponder()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        tipSettings.set("light", forKey: "themeSetting")
        tipSettings.synchronize()
        billField.placeholder = locale.currencySymbol!
        billField.center.y += view.bounds.height / 4
        tipControl.center.y += view.bounds.height
        tipView.center.y += view.bounds.height
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if ((tipSettings.string(forKey: "themeSetting")) == "light"){
            self.billField.textColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            self.view.backgroundColor = .white
            self.tipControl.tintColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
        } else {
            self.billField.textColor = .white
            self.view.backgroundColor = UIColor(red: 1/255, green: 4/255, blue: 52/255, alpha: 1)
            self.tipControl.tintColor = .white
        }
        
        if (tipSettings.object(forKey: "defaultTipIndex") != nil){
            tipControl.selectedSegmentIndex = tipSettings.integer(forKey: "defaultTipIndex")
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
        
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = locale
        currencyFormatter.maximumFractionDigits = 2
        
        let tipPercentages = [Double(tip1)/100, Double(tip2)/100, Double(tip3)/100]
        let bill = Double(billField.text!) ?? 0
        let tip =  bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
        total2Label.text = currencyFormatter.string(from: NSNumber(value: total/2.0))
        total3Label.text = currencyFormatter.string(from: NSNumber(value: total/3.0))
        total4Label.text = currencyFormatter.string(from: NSNumber(value: total/4.0))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        if viewInEmptyPosition {
            viewInEmptyPosition = false
            UIView.animate(withDuration: 0.3, delay: 0.0,
                           options: [],
                           animations: {
                            self.billField.center.y -= self.view.bounds.height / 4
                            self.tipControl.center.y -= self.view.bounds.height
                            self.tipView.center.y -= self.view.bounds.height
            },
                           completion: nil
            )
        }
        
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = locale
        currencyFormatter.maximumFractionDigits = 2
        
        let tipPercentages = [Double(tip1)/100, Double(tip2)/100, Double(tip3)/100]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        tipLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
        total2Label.text = currencyFormatter.string(from: NSNumber(value: total/2.0))
        total3Label.text = currencyFormatter.string(from: NSNumber(value: total/3.0))
        total4Label.text = currencyFormatter.string(from: NSNumber(value: total/4.0))
    }
    
    
}

