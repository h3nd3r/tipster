//
//  ViewController.swift
//  tipster
//
//  Created by Sara Hender on 9/2/16.
//  Copyright © 2016 Sara Hender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var equalsLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    var screenSize: CGRect? = nil
    
    override func viewDidLoad() {
        print("%s", #function)
        super.viewDidLoad()
        
        screenSize = UIScreen.mainScreen().bounds
        billField.becomeFirstResponder()
        UIWindow.setAnimationsEnabled(false)
        
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 42.0/255.0, green: 221.0/255.0, blue: 228.0/255.0, alpha: 1.0)

        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(ViewController.keyboardShown(_:)), name: UIKeyboardDidShowNotification, object: nil)
        
        
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
    
    @IBAction func billChanged(sender: UITextField) {
        print("%s", #function)
    }

    @IBAction func billFieldChanged(sender: UITextField) {
        print("%s", #function)        
    }
    
    @IBAction func outsideBillField(sender: AnyObject) {
        print("%s", #function)         
    }
    override func viewDidAppear(animated: Bool) {
        print("%s", #function)
        super.viewDidAppear(animated)
        UIWindow.setAnimationsEnabled(true)
    }
    @IBAction func billEditBegin(sender: UITextField) {
        print("%s", #function)
    }
    
    @IBAction func billEditEnd(sender: UITextField) {
        print("%s", #function)
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
        
        tipAmountLabel.text = String(format: "%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
        
        equalsLabel.text? += "-"
        
    }

    func keyboardShown(notification: NSNotification) {
        let info  = notification.userInfo!
        let value: AnyObject = info[UIKeyboardFrameEndUserInfoKey]!
        
        let rawFrame = value.CGRectValue()
        let keyboardFrame = view.convertRect(rawFrame, fromView: nil)
        
        print("keyboardFrame: \(keyboardFrame)")
    }
    
    func updateColorScheme(color: Bool) {
        var myBlue = UIColor.init(red: 42.0/255.0, green: 221.0/255.0, blue: 228.0/255.0, alpha: 1.0)
        
        if color {
            self.view.backgroundColor = UIColor.blackColor()
            tipControl.tintColor = UIColor.grayColor()
            self.view.tintColor = UIColor.grayColor()
            billField.textColor = myBlue
            tipAmountLabel.textColor = myBlue
            totalAmountLabel.textColor = myBlue
            equalsLabel.textColor = UIColor.whiteColor()
            plusLabel.textColor = UIColor.whiteColor()
        }
        else {
            self.view.backgroundColor = myBlue
            self.view.tintColor = UIColor.grayColor()
            tipControl.tintColor = UIColor.grayColor()
            tipControl.backgroundColor = UIColor.whiteColor()
            billField.textColor = UIColor.blackColor()
            tipAmountLabel.textColor = UIColor.blackColor()
            totalAmountLabel.textColor = UIColor.blackColor()
            equalsLabel.textColor = UIColor.whiteColor()
            plusLabel.textColor = UIColor.whiteColor()
        }
        
    }
    
}

