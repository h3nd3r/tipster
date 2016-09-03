//
//  ViewController.swift
//  tipster
//
//  Created by Sara Hender on 9/2/16.
//  Copyright © 2016 Sara Hender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        print("%s", #function)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func viewWillAppear(animated: Bool) {
        print("%s", #function)
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("tipControl")
        
        calculateTip(self)
    }
    
    override func viewDidAppear(animated: Bool) {
        print("%s", #function)
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("%s", #function)
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("%s", #function)
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

