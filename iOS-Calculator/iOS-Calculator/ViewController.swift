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
    
    // Additional button
    @IBOutlet weak var openBraceButton: UIButton!
    @IBOutlet weak var closeBraceButton: UIButton!
    @IBOutlet weak var mcButton: UIButton!
    @IBOutlet weak var mPButton: UIButton!
    @IBOutlet weak var mNButton: UIButton!
    @IBOutlet weak var mrButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var squareButton: UIButton!
    @IBOutlet weak var thirdPowerButton: UIButton!
    @IBOutlet weak var yPowerButton: UIButton!
    @IBOutlet weak var ePowerButton: UIButton!
    @IBOutlet weak var tenPowerButton: UIButton!
    @IBOutlet weak var divideByButton: UIButton!
    @IBOutlet weak var root2Button: UIButton!
    @IBOutlet weak var root3Button: UIButton!
    @IBOutlet weak var rootYButton: UIButton!
    @IBOutlet weak var lnButton: UIButton!
    @IBOutlet weak var log10Button: UIButton!
    @IBOutlet weak var pactorialButton: UIButton!
    @IBOutlet weak var sinButton: UIButton!
    @IBOutlet weak var cosButton: UIButton!
    @IBOutlet weak var tanButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var EEButton: UIButton!
    @IBOutlet weak var RadButton: UIButton!
    @IBOutlet weak var sinhButton: UIButton!
    @IBOutlet weak var coshButton: UIButton!
    @IBOutlet weak var tanhButton: UIButton!
    @IBOutlet weak var piButton: UIButton!
    @IBOutlet weak var RadhButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let buttons = [ACButton, posNegButton, modulatButton, divideButton, multiplyButton, subtractButton, addbutton, resultbutton, buttonDot, button0, button1, button2, button3, button4, button5, button6, button7, button8, button9]
        
        // make buttons round
        for button in buttons {
            if let btn = button {
                btn.layer.cornerRadius = btn.bounds.height / 2
            }
            
        }
    }


}

