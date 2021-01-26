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
    
    
    var dataManager = DataManager()
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.delegate = self
    }
        
    //MARK:- make buttons round
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
    


}

//MARK:- View Actions
extension ViewController: DataManagerDelegate {
    //MARK: IBActions
    @IBAction func numberPressed(_ sender: UIButton) {
        dataManager.proccessNumber(button: sender, labelText: resultLabel.text!)
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        dataManager.processOperator(button: sender)
    }
    
    @IBAction func resultPressed(_ sender: UIButton) {
        dataManager.getResult()
    }

    //MARK: DataManagerDelegate stubs
    func updateView(result: String) {
        resultLabel.text = result
    }
}

