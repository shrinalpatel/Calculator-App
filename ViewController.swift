//
// Simple Calculator
// Authors: Shrinal Patel and Akash Sharma
// Student ids: 301204864 and 301211702
// Date: 3rd October 2021
// Calculator App
// Version 1.0
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double  = 0;
    var previousNumber:Double = 0;
    var isPerformingOperation = false;
    var operation = 0;
    
    // Result Area Outlet
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorResults.text = "0";
    }
    
    // Number Buttons Function
    
    @IBAction func numberButtonsTap(_ sender: UIButton) {
        
        if isPerformingOperation == true {
            isPerformingOperation = false
            calculatorResults.text = String(sender.tag-1)
            numberOnScreen = Double(calculatorResults.text!)!
            }
        else {
        calculatorResults.text = calculatorResults.text! + String(sender.tag-1)
        numberOnScreen = Double(calculatorResults.text!)!
        }
    }
    
    // Operator Buttons Function
    
    @IBAction func operatorButtonsTap(_ sender: UIButton) {
        
        // Clear Button
        
        if sender.tag == 19 {
            calculatorResults.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            return
        }
        
        // Delete Button
        
        else if sender.tag == 20 {
            isPerformingOperation = true
            var previousNumber = String(calculatorResults.text!)
            if (!previousNumber.description.isEmpty) {
                calculatorResults.text = String(previousNumber.removeFirst())
            }
            operation = sender.tag
        }
        
        // Operations: /(tag = 11), *(tag = 12), +(tag = 13), -(tag = 14), %(tag = 15), +/-(tag = 16), .(tag = 17)
        
        else if sender.tag == 11 { // Divide
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "/"
            operation = sender.tag
        }
        else if sender.tag == 12 { // Multiply
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "*"
            operation = sender.tag
        }
        else if sender.tag == 13 { // Plus
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "+"
            operation = sender.tag
        }
        else if sender.tag == 14 { // Minus
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "-"
            operation = sender.tag
        }
        else if sender.tag == 15 { //Percentage
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "%"
            operation = sender.tag
        }
        else if sender.tag == 16 { // Plus minus
            isPerformingOperation = true
            var previousNumber = String(calculatorResults.text!)
            previousNumber = "-" + previousNumber
            calculatorResults.text = String(previousNumber)
            operation = sender.tag
        }
        else if sender.tag == 17 { // Decimal point
            isPerformingOperation = true
            if previousNumber.description.count <= 7 {
                var previousNumber = String(calculatorResults.text!)
                previousNumber += "."
                calculatorResults.text = previousNumber
                operation = sender.tag
            }
        }
       
        // Equals to Button
        
        else if sender.tag == 18{
            if operation == 11 {
                calculatorResults.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 12 {
                calculatorResults.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 13 {
                calculatorResults.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 14 {
                calculatorResults.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {
                calculatorResults.text = String(previousNumber / 100)
            }
            else if operation == 16 {
                calculatorResults.text = String(previousNumber)
            }
            else if operation == 17 {
                calculatorResults.text = String(previousNumber)
            }
            
        }
        
    }
    
    
}
