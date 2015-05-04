//
//  ViewController.swift
//  tips
//
//  Created by Carlos Cheung on 4/30/15.
//  Copyright (c) 2015 carloscheung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var talkingText: UILabel!
    
    
//    // Optionally initialize the property to a desired starting value
//    self.firstView.alpha = 0
//    self.secondView.alpha = 1
//    UIView.animateWithDuration(0.4, animations: {
//    // This causes first view to fade in and second view to fade out
//    self.firstView.alpha = 1
//    self.secondView.alpha = 0
//    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        switch tipPercentage {
            case 0.18:
                self.talkingText.text = "Are you sure?"
            case 0.2:
                self.talkingText.text = "That's good!"
            default:
                self.talkingText.text = "Awesome!"
        }
        
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        self.talkingText.text = "Pick a tip!"
    }
    
}

