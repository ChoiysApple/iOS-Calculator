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
    
    var delegate: DataManagerDelegate?
    
    var currentValue: Float = 0.0
    
    mutating func proccessNumber(button: UIButton, labelText: String){
        
        var currentString = labelText
        
        if let input =  button.currentTitle {
            if input == "AC" {
                currentString = "0"
                
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
        print("\(currentString): currentString")
        
        currentValue = (currentString as NSString).floatValue
        delegate?.updateView(result: currentString)
    }
    
    
}
