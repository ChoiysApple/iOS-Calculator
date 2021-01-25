//
//  DataManager.swift
//  iOS-Calculator
//
//  Created by Daegeon Choi on 2021/01/25.
//

import Foundation
import UIKit



struct DataManager {
    
    var currentValue = 0
    
    mutating func proccessNumber(button: UIButton, labelText: String) -> String{
        
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
                
            } else {
                currentString += input
            }
        }
        print("\(currentString): currentString")
        return currentString
    }
    
    
}
