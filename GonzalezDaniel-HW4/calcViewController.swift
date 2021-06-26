//
//  calcViewController.swift
//  GonzalezDaniel-HW4
//
//  Created by Daniel Gonzalez on 6/25/21.
//

import UIKit

class calcViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var operandFieldOne: UITextField!
    @IBOutlet weak var operandFieldTwo: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    var operatorSymbol = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandFieldOne.delegate = self
        operandFieldTwo.delegate = self
        operandFieldOne.text = String()
        operandFieldTwo.text = String()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        operatorLabel.text = operatorSymbol
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch string {
        case ".":
            if textField.text?.contains(".") == true {
                return false
            } else {
                return true
            }
        default:
            return true
        }
    }
    
    @IBAction func pressedCalcButton(_ sender: Any) {
        var resultFloat: Double?
        
        if operandFieldOne.text == "" || operandFieldTwo.text == "" || operandFieldOne.text == "." || operandFieldTwo.text == "." {
            resultLabel.text = "please enter two valid operands"
        } else {
            switch operatorSymbol {
            case "+":
                resultFloat = Double(operandFieldOne.text!)! + Double(operandFieldTwo.text!)!
            case "-":
                resultFloat = Double(operandFieldOne.text!)! - Double(operandFieldTwo.text!)!
            case "*":
                resultFloat = Double(operandFieldOne.text!)! * Double(operandFieldTwo.text!)!
            case "/":
                resultFloat = Double(operandFieldOne.text!)! / Double(operandFieldTwo.text!)!
            default:
                print("error")
            }
            resultLabel.text = String(format: "%g", resultFloat!)
        }
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
