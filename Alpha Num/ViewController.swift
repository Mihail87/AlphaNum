//
//  ViewController.swift
//  Alpha Num
//
//  Created by Mihai Leonte on 11/27/17.
//  Copyright © 2017 Mihai Leonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numResultLabel: UILabel!
    @IBOutlet weak var labelAlpha: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var numericButton: UIButton!
    @IBOutlet weak var numeric2Button: UIButton!
    @IBOutlet weak var numeric3Button: UIButton!
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var incorrectButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let alphabetProvider = AlphabetProvider()
    let numProvider = NumProvider()
    var correctCounter: Int = 0
    var incorrectCounter: Int = 0
    var finishedAlphabet: Bool = false
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numResultLabel.isHidden = true
        
        numericButton.isHidden = true
        numericButton.backgroundColor = .clear
        numericButton.layer.cornerRadius = 5
        numericButton.layer.borderWidth = 1
        numericButton.layer.borderColor = UIColor.black.cgColor
        
        numeric2Button.isHidden = true
        numeric2Button.backgroundColor = .clear
        numeric2Button.layer.cornerRadius = 5
        numeric2Button.layer.borderWidth = 1
        numeric2Button.layer.borderColor = UIColor.black.cgColor
        
        numeric3Button.isHidden = true
        numeric3Button.backgroundColor = .clear
        numeric3Button.layer.cornerRadius = 5
        numeric3Button.layer.borderWidth = 1
        numeric3Button.layer.borderColor = UIColor.black.cgColor
        
        correctLabel.text = String(correctCounter)
        incorrectLabel.text = String(incorrectCounter)
        
        if segmentedControl.selectedSegmentIndex == 0 {
            labelAlpha.text = alphabetProvider.randomLetters(doRemove: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func increaseCorrectCounter() {
        correctCounter += 1
        correctLabel.text = String(correctCounter)
    }
    
    func increaseIncorrectCounter() {
        incorrectCounter += 1
        incorrectLabel.text = String(incorrectCounter)
    }

    @IBAction func answerCorrect() {
        increaseCorrectCounter()
        let newLetter = alphabetProvider.randomLetters(doRemove: true)
        
        if newLetter == "N/A" {
            labelAlpha.text = "🏆"
            finishedAlphabet = true
            correctButton.isHidden = true
            incorrectButton.isHidden = true
        } else {
            labelAlpha.text = newLetter
        }
    }
    @IBAction func answerWrong() {
        increaseIncorrectCounter()
        labelAlpha.text = alphabetProvider.randomLetters(doRemove: false)
    }
    
    func newOperation() {
        numProvider.newNumbersPair()
        labelAlpha.text = numProvider.operationString
        numericButton.setTitle(numProvider.labels[0], for: UIControlState.normal)
        numeric2Button.setTitle(numProvider.labels[1], for: UIControlState.normal)
        numeric3Button.setTitle(numProvider.labels[2], for: UIControlState.normal)
    }
    func showNum() {
        labelAlpha.font = labelAlpha.font.withSize(80.0)
        correctButton.isHidden = true
        incorrectButton.isHidden = true
        numericButton.isHidden = false
        numeric2Button.isHidden = false
        numeric3Button.isHidden = false
    }
    func showAlpha() {
        numResultLabel.isHidden = true
        numericButton.isHidden = true
        numeric2Button.isHidden = true
        numeric3Button.isHidden = true
        correctButton.isHidden = false
        incorrectButton.isHidden = false
    }
    @objc func hideNumResultLabel() {
        numResultLabel.isHidden = true
    }
    func showNumResult(isCorrect correct: Bool) {
        numResultLabel.isHidden = false
        if correct {
            numResultLabel.text = "🥇"
        } else {
            numResultLabel.text = "🤪"
        }
        if timer == nil {
            Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(hideNumResultLabel), userInfo: nil, repeats: false)
        } else {
            timer?.fire()
        }
    }
    func checkNumResult(forButton button: UIButton) {
        if let buttonLabel = button.titleLabel?.text {
            if Int(buttonLabel) == numProvider.firstNum + numProvider.secondNum {
                increaseCorrectCounter()
                showNumResult(isCorrect: true)
                newOperation()
            } else {
                increaseIncorrectCounter()
                showNumResult(isCorrect: false)
                newOperation()
            }
        }
    }
    @IBAction func pressFirstButton() {
        checkNumResult(forButton: numericButton)
    }
    @IBAction func pressSecondButton() {
        checkNumResult(forButton: numeric2Button)
    }
    @IBAction func pressThirdButton() {
        checkNumResult(forButton: numeric3Button)
    }
    
    @IBAction func selectIndex(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 1 {
            showNum()
            newOperation()
        } else if segmentedControl.selectedSegmentIndex == 0 {
            labelAlpha.font = labelAlpha.font.withSize(125.0)
            if finishedAlphabet {
                labelAlpha.text = "🏆"
                numResultLabel.isHidden = true
                numericButton.isHidden = true
                numeric2Button.isHidden = true
                numeric3Button.isHidden = true
            } else {
                showAlpha()
                labelAlpha.text = alphabetProvider.randomLetters(doRemove: false)
            }
        }
    }
}

