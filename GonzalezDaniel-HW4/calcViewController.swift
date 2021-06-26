//
//  calcViewController.swift
//  Project: GonzalezDaniel-HW4
//  EID: Dg37584
//  Course: CS371L
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
    }
    
    // loads correct operator before user can see the VC
    override func viewWillAppear(_ animated: Bool) {
        operatorLabel.text = operatorSymbol
    }
    
    // method to validate text as it is typed by the user. main function is to prevents user from typing extra decimals
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch string {
        case ".":
            if textField.text!.contains(".") {
                return false
            } else {
                textField.text = textField.text!.isEmpty ? "0" : textField.text // place leading zero if no number has been entered
                return true
            }
        default:
            return true
        }
    }
    
    // calculator logic, converts strings in operandFields into doubles to perform operations
    @IBAction func pressedCalcButton(_ sender: Any) {
        if operandFieldOne.text == "" || operandFieldTwo.text == "" { // reminder to user to not leave any operand field empty
            resultLabel.text = "please enter two valid operands"
        } else {
            var resultFloat: Double?
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
            resultLabel.text = String(format: "%g", resultFloat!) // general format, shortest precise representation
        }
    }
    
    // code to enable tapping on the background to remove software keyboard
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
