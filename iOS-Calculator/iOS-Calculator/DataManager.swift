//
//  DataManager.swift
//  iOS-Calculator
//
//  Created by Daegeon Choi on 2021/01/25.
//

import Foundation
import UIKit

protocol DataManagerDelegate {
    func updateView(result: String)
}


struct DataManager {
    
    //MARK:- properties
    var delegate: DataManagerDelegate?
    
    var Value: Double = 0.0
    var Operator: String = ""
    var Operand: Double = 0.0
    var isOperandInput: Bool = false
    
    //MARK:- Methods
    mutating func proccessNumber(button: UIButton, labelText: String){
        
        var currentString = labelText
        
        if isOperandInput {
            currentString = "0"
            isOperandInput = false
        }
        
        if let input =  button.currentTitle {
            if input == numberGroup.ac {
                currentString = numberGroup.zero
                Operator = ""
                
            } else if input == numberGroup.sign{
                if currentString[currentString.startIndex] == Character(numberGroup.negative) {
                    currentString.remove(at: currentString.startIndex)
                }else {
                    currentString = numberGroup.negative + currentString
                }
                
            } else if input != numberGroup.dot && currentString == numberGroup.zero{
                        currentString = input
            } else if input != numberGroup.dot && currentString == numberGroup.negative+numberGroup.zero{
                currentString = numberGroup.negative+input
                
            } else if input == numberGroup.percent {
                let decimal = (currentString as NSString).doubleValue
                currentString = String(decimal/100)
                
            } else if input == numberGroup.dot && currentString.contains(numberGroup.dot) {
                return
                
            } else {
                currentString += input
            }
        }
        
        if Operator == "" {
            Value = (currentString as NSString).doubleValue
            print("Value: \(Value)")
        } else {
            Operand = (currentString as NSString).doubleValue
            print("Operand: \(Operand)")
        }
        
        delegate?.updateView(result: currentString)
        
    }
    
    mutating func processOperator(button: UIButton) {
        Operator = button.currentTitle ?? ""
        isOperandInput = true
        print("Operator: \(Operator)")
    }
    
    mutating func getResult(){
        var result: Double
        
        switch Operator {
        case operatorGroup.divide:
            result = Value/Operand
            break
            
        case operatorGroup.multiply:
            result = Value*Operand
            break
            
        case operatorGroup.sub:
            result = Value-Operand
            break
            
        case operatorGroup.add:
            result = Value+Operand
            break
            
        default:
            return
        }
        
        Value = result
        if result.truncatingRemainder(dividingBy: 1) == 0.0 {
            delegate?.updateView(result: String(Int(result)))
        } else {
            delegate?.updateView(result: String(result))
        }
        
        print()
        print("Value: \(Value)")
        
    }
    
    
    
}
