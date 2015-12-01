//
//  SettingsViewController.swift
//  tips
//
//  Created by Adam Hair on 11/30/15.
//  Copyright © 2015 Adam Hair. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    @IBAction func defaultTipControl(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if !defaultSet() {
            defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipIndex")
            defaults.synchronize()
        } else {
            defaultTipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipIndex")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func defaultSet() -> Bool {
        if(NSUserDefaults.standardUserDefaults().objectForKey("defaultTipIndex") != nil) {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func defaultTipUpdate(sender: AnyObject) {
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
