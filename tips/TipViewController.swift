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
        var colorIndex = 1
        
        if defaultSet() {
            // Update colors
            colorIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultColorIndex")
        }
        
        var redBackgrounds: [Int] = [255,167,30]
        var greenBackgrounds = [132,255,181]
        var blueBackgrounds = [121,144,255]
        
        var redForegrounds = [249,0,23]
        var greenForegrounds = [44,147,26]
        var blueForegrounds = [42,27,255]
        
        // Background colors
       // backgroundView.backgroundColor = UIColor(red: redBackgrounds[colorIndex-1]/255.0, green: CGFloat(greenBackgrounds[colorIndex-1]/255), blue: CGFloat(blueBackgrounds[colorIndex-1]/255), alpha: 1.0)
        //totalLabel.textColor = UIColor(red: CGFloat(redBackgrounds[colorIndex-1]/255), green: CGFloat(greenBackgrounds[colorIndex-1]/255), blue: CGFloat(blueBackgrounds[colorIndex-1]/255), alpha: 1.0)
        //tipLabel.textColor = UIColor(red: CGFloat(redBackgrounds[colorIndex-1]/255), green: CGFloat(greenBackgrounds[colorIndex-1]/255), blue: CGFloat(blueBackgrounds[colorIndex-1]/255), alpha: 1.0)
        //plusTipLabel.textColor = UIColor(red: CGFloat(redBackgrounds[colorIndex-1]/255), green: CGFloat(greenBackgrounds[colorIndex-1]/255), blue: CGFloat(blueBackgrounds[colorIndex-1]/255), alpha: 1.0)
        //grandTotalLabel.textColor = UIColor(red: CGFloat(redBackgrounds[colorIndex-1]/255), green: CGFloat(greenBackgrounds[colorIndex-1]/255), blue: CGFloat(blueBackgrounds[colorIndex-1]/255), alpha: 1.0)
        
        // Foreground Colors
        //blackBarView.backgroundColor = UIColor(red: CGFloat(redForegrounds[colorIndex-1]/255), green: CGFloat(greenForegrounds[colorIndex-1]/255), blue: CGFloat(blueForegrounds[colorIndex-1]/255), alpha: 1.0)
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

