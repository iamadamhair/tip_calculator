//
//  TipViewController.swift
//  tips
//
//  Created by Adam Hair on 11/30/15.
//  Copyright © 2015 Adam Hair. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var blackBarView: UIView!
    @IBOutlet weak var twoWayField: UILabel!
    @IBOutlet weak var threeWayField: UILabel!
    @IBOutlet weak var fourWayField: UILabel!
    @IBOutlet weak var fiveWayField: UILabel!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var plusTipLabel: UILabel!
    @IBOutlet weak var grandTotalLabel: UILabel!
    @IBOutlet weak var dollarLabel: UILabel!
    @IBOutlet weak var threeWaysLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var twoWaysLabel: UILabel!
    @IBOutlet weak var fourWaysLabel: UILabel!
    @IBOutlet weak var fiveWaysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.becomeFirstResponder()
        
        if defaultSet() {
           tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipIndex")
        }
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        twoWayField.text = "$0.00"
        threeWayField.text = "$0.00"
        fourWayField.text = "$0.00"
        fiveWayField.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if defaultSet() {
            tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipIndex")
            onEditingChanged(self)
        }
        setAppColor()
    }
    
    func defaultSet() -> Bool {
        if(NSUserDefaults.standardUserDefaults().objectForKey("defaultTipIndex") != nil) {
            return true
        } else {
            return false
        }
    }

    func setAppColor() {
        var colorIndex = 0
        
        if defaultSet() {
            // Update colors
            colorIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultColorIndex")
        }
        /*
        var redBackgrounds: [Int] = [255,167,30]
        var greenBackgrounds = [132,255,181]
        var blueBackgrounds = [121,144,255]
        
        var redForegrounds = [249,0,23]
        var greenForegrounds = [44,147,26]
        var blueForegrounds = [42,27,255]
        */
        
        if(colorIndex == 2) {
            // Blue
            // Background colors
            backgroundView.backgroundColor = UIColor(red: 0x1E/255.0, green: 0xB5/255.0, blue: 0xFF/255.0, alpha: 1.0)
            totalLabel.textColor = UIColor(red: 0x1E/255.0, green: 0xB5/255.0, blue: 0xFF/255.0, alpha: 1.0)
            tipLabel.textColor = UIColor(red: 0x1E/255.0, green: 0xB5/255.0, blue: 0xFF/255.0, alpha: 1.0)
            plusTipLabel.textColor = UIColor(red: 0x1E/255.0, green: 0xB5/255.0, blue: 0xFF/255.0, alpha: 1.0)
            grandTotalLabel.textColor = UIColor(red: 0x1E/255.0, green: 0xB5/255.0, blue: 0xFF/255.0, alpha: 1.0)
            
            // Foreground Colors
            dollarLabel.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            blackBarView.backgroundColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            billField.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            billLabel.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            tipControl.tintColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            twoWayField.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            twoWaysLabel.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            threeWayField.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            threeWaysLabel.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            fourWayField.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            fourWaysLabel.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            fiveWayField.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
            fiveWaysLabel.textColor = UIColor(red: 0x17/255.0, green: 0x1A/255.0, blue: 0xFF/255.0, alpha: 1.0)
        }
        else if(colorIndex == 1) {
            // Green
            // Background colors
            backgroundView.backgroundColor = UIColor(red: 0xA7/255.0, green: 0xFF/255.0, blue: 0x90/255.0, alpha: 1.0)
            totalLabel.textColor = UIColor(red: 0xA7/255.0, green: 0xFF/255.0, blue: 0x90/255.0, alpha: 1.0)
            tipLabel.textColor = UIColor(red: 0xA7/255.0, green: 0xFF/255.0, blue: 0x90/255.0, alpha: 1.0)
            plusTipLabel.textColor = UIColor(red: 0xA7/255.0, green: 0xFF/255.0, blue: 0x90/255.0, alpha: 1.0)
            grandTotalLabel.textColor = UIColor(red: 0xA7/255.0, green: 0xFF/255.0, blue: 0x90/255.0, alpha: 1.0)
            
            // Foreground Colors
            dollarLabel.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            blackBarView.backgroundColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            billField.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            billLabel.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            tipControl.tintColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            twoWayField.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            twoWaysLabel.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            threeWayField.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            threeWaysLabel.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            fourWayField.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            fourWaysLabel.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            fiveWayField.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
            fiveWaysLabel.textColor = UIColor(red: 0x00/255.0, green: 0x93/255.0, blue: 0x1B/255.0, alpha: 1.0)
        }
        else {
            // Red
            // Background colors
            backgroundView.backgroundColor = UIColor(red: 0xFF/255.0, green: 0x84/255.0, blue: 0x79/255.0, alpha: 1.0)
            totalLabel.textColor = UIColor(red: 0xFF/255.0, green: 0x84/255.0, blue: 0x79/255.0, alpha: 1.0)
            tipLabel.textColor = UIColor(red: 0xFF/255.0, green: 0x84/255.0, blue: 0x79/255.0, alpha: 1.0)
            plusTipLabel.textColor = UIColor(red: 0xFF/255.0, green: 0x84/255.0, blue: 0x79/255.0, alpha: 1.0)
            grandTotalLabel.textColor = UIColor(red: 0xFF/255.0, green: 0x84/255.0, blue: 0x79/255.0, alpha: 1.0)
            
            // Foreground Colors
            dollarLabel.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            blackBarView.backgroundColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            billField.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            billLabel.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            tipControl.tintColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            twoWayField.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            twoWaysLabel.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            threeWayField.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            threeWaysLabel.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            fourWayField.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            fourWaysLabel.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            fiveWayField.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
            fiveWaysLabel.textColor = UIColor(red: 0xF9/255.0, green: 0x2C/255.0, blue: 0x2A/255.0, alpha: 1.0)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let totalAmount = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", totalAmount)
        twoWayField.text = String(format: "$%.2f", totalAmount/2)
        threeWayField.text = String(format: "$%.2f", totalAmount/3)
        fourWayField.text = String(format: "$%.2f", totalAmount/4)
        fiveWayField.text = String(format: "$%.2f", totalAmount/5)
        
    }
}

