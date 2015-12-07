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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if defaultSet() {
           tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipIndex")
        }
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if defaultSet() {
            tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipIndex")
            onEditingChanged(self)
        }
    }
    
    func defaultSet() -> Bool {
        if(NSUserDefaults.standardUserDefaults().objectForKey("defaultTipIndex") != nil) {
            return true
        } else {
            return false
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
    }
}

