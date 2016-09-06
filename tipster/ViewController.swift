//
//  ViewController.swift
//  tipster
//
//  Created by Sara Hender on 9/2/16.
//  Copyright © 2016 Sara Hender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        print("%s", #function)
        super.viewDidLoad()
        billField.becomeFirstResponder()
        UIWindow.setAnimationsEnabled(false)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let theme = defaults.boolForKey("theme")
        updateColorScheme(theme)
        print("theme: \(theme)")
    }

    override func viewWillAppear(animated: Bool) {
        print("%s", #function)
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("tipControl")
        
        calculateTip(self)
        
        let theme = defaults.boolForKey("theme")
        updateColorScheme(theme)
        print("theme: \(theme)")
    }
    
    override func viewDidAppear(animated: Bool) {
        print("%s", #function)
        super.viewDidAppear(animated)
        UIWindow.setAnimationsEnabled(false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("%s", #function)
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("%s", #function)
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }

    func keyboardShown(notification: NSNotification) {
        let info  = notification.userInfo!
        let value: AnyObject = info[UIKeyboardFrameEndUserInfoKey]!
        
        let rawFrame = value.CGRectValue()
        let keyboardFrame = view.convertRect(rawFrame, fromView: nil)
        
        print("keyboardFrame: \(keyboardFrame)")
    }
    
    func updateColorScheme(color: Bool) {
        if color {
            self.view.backgroundColor = UIColor.blackColor()
            tipControl.tintColor = UIColor.grayColor()
            self.view.tintColor = UIColor.grayColor()
            tipLabel.textColor = UIColor.whiteColor()
            totalLabel.textColor = UIColor.whiteColor()
            //billField.textColor = UIColor.whiteColor()
            billLabel.textColor = UIColor.whiteColor()
            tipAmountLabel.textColor = UIColor.whiteColor()
            totalAmountLabel.textColor = UIColor.whiteColor()
        }
        else {
            self.view.backgroundColor = UIColor.whiteColor()
            self.view.tintColor = UIColor.grayColor()
            tipControl.tintColor = UIColor.grayColor()
            tipLabel.textColor = UIColor.blackColor()
            totalLabel.textColor = UIColor.blackColor()
            //billField.textColor = UIColor.blackColor()
            billLabel.textColor = UIColor.blackColor()
            tipAmountLabel.textColor = UIColor.blackColor()
            totalAmountLabel.textColor = UIColor.blackColor()
        }
        
    }
    
}

