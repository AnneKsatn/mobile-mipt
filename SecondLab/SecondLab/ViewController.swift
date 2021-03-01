//
//  ViewController.swift
//  SecondLab
//
//  Created by user187691 on 2/25/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var resultLabel: UILabel!
    var typingFlag = false
    var firstOperand: Double = 0
    var secondOpearnd: Double = 0
    var operation: String = ""
    var dotFlag = false;
    
    var currValue: Double {
        get {
            return Double(resultLabel.text!)!
        }
        
        set {
            resultLabel.text = "\(newValue)"
            typingFlag = false
            firstOperand = currValue
        }
    }
    
    
    @IBAction func enterDigit(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        print(number)
        
        if(typingFlag) {
            resultLabel.text = resultLabel.text! + number
        } else {
            resultLabel.text = number
            typingFlag = true
        }
    }
    
    func beforeOperation() {
        print("before")
        firstOperand = Double(resultLabel.text!)!
        typingFlag = false
    }
    
    @IBAction func enterOperation(_ sender: UIButton) {
  
        typingFlag = false
        dotFlag = false
        print(sender.currentTitle!)
        print("Second" + "\(secondOpearnd)")
        
        if(operation != "") {
            switch operation {
                case "+":
                    print(secondOpearnd)
                    currValue = currValue + firstOperand
                case "-":
                    currValue = firstOperand - currValue
                case "*":
                    currValue = firstOperand * currValue
                case "/":
                currValue = firstOperand / currValue
                default:
                    break
            }
        } else {
            firstOperand = currValue
        }
        
        operation = sender.currentTitle!
        
    }
    
    
    @IBAction func enterEquality(_ sender: UIButton) {
        
        if(typingFlag == true) {
            secondOpearnd = currValue
        }
        
        switch operation {
        case "+":
            resultLabel.text = "\(secondOpearnd + firstOperand)"
        case "-":
            resultLabel.text = "\(firstOperand - secondOpearnd)"
        case "*":
            resultLabel.text = "\(firstOperand * secondOpearnd)"
        case "/":
            resultLabel.text = "\(firstOperand / secondOpearnd)"
        default:
            break
        }
        
        typingFlag = false
        dotFlag = false
        operation = ""
        
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        firstOperand = 0
        secondOpearnd = 0
        resultLabel.text = "0"
        typingFlag = false
        operation = ""
        dotFlag = false
    }
    
    @IBAction func changeNumSign(_ sender: UIButton) {
        let newValue: Double =  -currValue
        resultLabel.text = "\(newValue)"
    }
    
    @IBAction func percentageButton(_ sender: UIButton) {
        if(firstOperand == 0) {
            resultLabel.text = "\(currValue / 100)"
            operation = ""
        } else {
            
        }
    }

    @IBAction func dotButton(_ sender: UIButton) {

        if (typingFlag && !dotFlag) {
            resultLabel.text = resultLabel.text! + "."
            dotFlag = true
        } else {
            if(!typingFlag && !dotFlag) {
                resultLabel.text = "0."
                typingFlag = true
                dotFlag = true
            }
        }
        
    }
}

