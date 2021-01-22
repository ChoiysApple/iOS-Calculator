//
//  ViewController.swift
//  iOS-Calculator
//
//  Created by Daegeon Choi on 2021/01/20.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- IBOutlets
    
    // result label
    @IBOutlet weak var resultLabel: UILabel!
    
    // function button
    @IBOutlet weak var ACButton: UIButton!
    @IBOutlet weak var posNegButton: UIButton!
    @IBOutlet weak var modulatButton: UIButton!
    
    // operation button
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addbutton: UIButton!
    @IBOutlet weak var resultbutton: UIButton!
    
    // number button
    @IBOutlet weak var buttonDot: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var number: String = "0"
    
    override func viewDidAppear(_ animated: Bool) {
        
        let buttons = [ACButton, posNegButton, modulatButton, divideButton, multiplyButton, subtractButton, addbutton, resultbutton, buttonDot, button1, button2, button3, button4, button5, button6, button7, button8, button9]
        
        // make buttons round
        for button in buttons {
            if let btn = button {
                btn.layer.cornerRadius = btn.bounds.width / 2
            }
            button0.layer.cornerRadius = button0.bounds.height / 2
            
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        if let input =  sender.currentTitle {
            if input == "AC" {
                number = "0"
            } else if input == "+/-"{
                if number[number.startIndex] == "-"{
                    number.remove(at: number.startIndex)
                }else {
                    number = "-"+number
                }
            } else if input != "." && number == "0"{
                number = input
            } else if input == "%" {
                let decimal = (number as NSString).floatValue
                print(decimal)
                number = String(decimal/100)
            } else {
                number += input
            }
        }
        resultLabel.text = number
    }
    


}

