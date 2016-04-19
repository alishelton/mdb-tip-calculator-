//
//  SecondViewController.swift
//  mdbtipcalc
//
//  Created by Ali Shelton on 2/16/16.
//  Copyright © 2016 Ali Shelton. All rights reserved.
//

import UIKit

class SecondViewController:



UIViewController, UITextFieldDelegate {
    let yenConversion:Double = 114
    let euroConversion:Double = 0.90
    let dogecoinConversion:Double = 0.000285
    
    
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var tenPercentLabel: UILabel!
    @IBOutlet weak var fifteenPercentLabel: UILabel!
    @IBOutlet weak var twentyPercentLabel: UILabel!
    @IBOutlet weak var euroButton: UIButton!
    @IBOutlet weak var dogecoinButton: UIButton!
    @IBOutlet weak var yenButton: UIButton!
    
    var yenIsPressed:Bool = false
    var euroIsPressed:Bool = false
    var dogecoinIsPressed:Bool = false
    
    @IBAction func yenPressed(sender: AnyObject) {
        yenButton.alpha = 1
        euroButton.alpha = 0.6
        dogecoinButton.alpha = 0.6
        yenIsPressed = true
        euroIsPressed = false
        dogecoinIsPressed = false
    }
    @IBAction func euroPressed(sender: AnyObject){
        euroButton.alpha = 1
        yenButton.alpha = 0.6
        dogecoinButton.alpha = 0.6
        euroIsPressed = true
        yenIsPressed = false
        dogecoinIsPressed = false
    }
    @IBAction func dogecoinPressed(sender: AnyObject){
        dogecoinButton.alpha = 1
        yenButton.alpha = 0.6
        euroButton.alpha = 0.6
        dogecoinIsPressed = true
        yenIsPressed = false
        euroIsPressed = false
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let amount:Double = Double(amountText.text!)!
        let tenPercentAmount:Double = amount*0.1
        let fifteenPercentAmount:Double = amount*0.15
        let twentyPercentAmount:Double = amount*0.2
        if yenIsPressed {
            tenPercentLabel.text = "$"+String(roundAmount(tenPercentAmount*yenConversion))
            fifteenPercentLabel.text = "$"+String(roundAmount(fifteenPercentAmount*yenConversion))
            twentyPercentLabel.text = "$"+String(roundAmount(twentyPercentAmount*yenConversion))
        }
        else if euroIsPressed {
            tenPercentLabel.text = "$"+String(roundAmount(tenPercentAmount*euroConversion))
            fifteenPercentLabel.text = "$"+String(roundAmount(fifteenPercentAmount*euroConversion))
            twentyPercentLabel.text = "$"+String(roundAmount(twentyPercentAmount*euroConversion))
        }
        else if dogecoinIsPressed {
            tenPercentLabel.text = "$"+String(roundAmount(tenPercentAmount*dogecoinConversion))
            fifteenPercentLabel.text = "$"+String(roundAmount(fifteenPercentAmount*dogecoinConversion))
            twentyPercentLabel.text = "$"+String(roundAmount(twentyPercentAmount*dogecoinConversion))
        }
        else {
            tenPercentLabel.text = "Bro"
            fifteenPercentLabel.text = "Click"
            twentyPercentLabel.text = "Something"
        }
    }
    
    func roundAmount(amount: Double) -> Double {
        return round(100*amount)/100
    }
    
    override func viewDidLoad() {
        amountText.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        amountText.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
