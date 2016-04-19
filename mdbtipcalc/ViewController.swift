//
//  ViewController.swift
//  mdbtipcalc
//
//  Created by Ali Shelton on 2/13/16.
//  Copyright © 2016 Ali Shelton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var tenPercentTipLabel: UILabel!
    @IBOutlet weak var fifteenPercentTipLabel: UILabel!
    @IBOutlet weak var twentyPercentTipLabel: UILabel!
    
    @IBAction func calculatePressed(sender: AnyObject) {
        let amount:Double = Double(mainTextField.text!)!
        let tenPercentAmount:Double = amount*0.1
        let fifteenPercentAmount:Double = amount*0.15
        let twentyPercentAmount:Double = amount*0.2
        tenPercentTipLabel.text = "$"+String(roundAmount(tenPercentAmount))
        fifteenPercentTipLabel.text = "$"+String(roundAmount(fifteenPercentAmount))
        twentyPercentTipLabel.text = "$"+String(roundAmount(twentyPercentAmount))
    }
    
    func roundAmount(amount: Double) -> Double {
        return round(100*amount)/100
    }
    
    override func viewDidLoad() {
        mainTextField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        mainTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

