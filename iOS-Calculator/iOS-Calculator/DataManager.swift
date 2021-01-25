//
//  DataManager.swift
//  iOS-Calculator
//
//  Created by Daegeon Choi on 2021/01/25.
//

import Foundation
import UIKit

protocol DataManagerDelegate {
    func updateView(result: Float)
    func updateView(result: String)
}


struct DataManager {
    
    //MARK:- properties
    var delegate: DataManagerDelegate?
    
    var Value: Float = 0.0
    var Operator: String = ""
    var Operand: Float = 0.0
    var isOperandTurn: Bool = false
    
    //MARK:- Methods
    mutating func proccessNumber(button: UIButton, labelText: String){
        
        var currentString = labelText
        
        if isOperandTurn {
            currentString = "0"
            isOperandTurn = false
        }
        
        if let input =  button.currentTitle {
            if input == "AC" {
                currentString = "0"
                Operator = ""
                
            } else if input == "+/-"{
                if currentString[currentString.startIndex] == "-"{
                    currentString.remove(at: currentString.startIndex)
                }else {
                    currentString = "-"+currentString
                }
                
            } else if input != "." && currentString == "0"{
                        currentString = input
            } else if input != "." && currentString == "-0"{
                        currentString = "-"+input
                
            } else if input == "%" {
                let decimal = (currentString as NSString).floatValue
                currentString = String(decimal/100)
                
            } else if input == "." && currentString.contains(".") {
                return
                
            } else {
                currentString += input
            }
        }
        
        if Operator == "" {
            Value = (currentString as NSString).floatValue
            print("Value: \(Value)")
        } else {
            Operand = (currentString as NSString).floatValue
            print("Operand: \(Operand)")
        }
        
        delegate?.updateView(result: currentString)
        
    }
    
    mutating func processOperator(button: UIButton) {
        Operator = button.currentTitle ?? ""
        isOperandTurn = true
        print("Operator: \(Operator)")
    }
    
    mutating func getResult(){
        var result: Float
        
        switch Operator {
        case "÷":
            result = Value/Operand
            break
            
        case "×":
            result = Value*Operand
            break
            
        case "-":
            result = Value-Operand
            break
            
        case "+":
            result = Value+Operand
            break
            
        default:
            return
        }
        
        Value = result
        delegate?.updateView(result: result)
        print()
        print("Value: \(Value)")
        
    }
    
    
    
}
