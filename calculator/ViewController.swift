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
    //: UILabel! means the type of display
    var userIsInTheMiddleOfTypingANumber:Bool = false
    @IBAction func appendDigid(sender: UIButton)
    {
        let digit = sender.currentTitle!
        println("digit = \(digit)")
        //optional, kinda like the Vector3? in c#
        if userIsInTheMiddleOfTypingANumber {
        display.text = display.text! + digit
        }else{
            display.text=digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
}

