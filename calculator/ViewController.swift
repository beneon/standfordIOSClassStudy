//
//  ViewController.swift
//  calculator
//
//  Created by zheng junming on 15/8/27.
//  Copyright (c) 2015年 lucidstudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var display: UILabel!
    // implicitly unwrap
    //: UILabel! means the type of display
    var userIsInTheMiddleOfTypingANumber = false
    var brain = CalculatorBrain()
    @IBAction func appendDigid(sender: UIButton)
    {
        let digit = sender.currentTitle!
        print("digit = \(digit)")
        //optional, kinda like the Vector3? in c#
        if userIsInTheMiddleOfTypingANumber {
        display.text = display.text! + digit
        }else{
            display.text=digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            }else{
                displayValue = 0
            }
        }
        
    }

    //this is creating an instance of a class
    //type inference: operatorStack:Array<Double> = Array<Double> () >> operatorStack = Array<Double> ()
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        }else{
            displayValue = 0
        }
    }
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }



}
