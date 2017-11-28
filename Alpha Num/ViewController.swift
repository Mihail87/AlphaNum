//
//  ViewController.swift
//  Alpha Num
//
//  Created by Mihai Leonte on 11/27/17.
//  Copyright © 2017 Mihai Leonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    @IBAction func answerCorrect() {
        correctCounter += 1
        correctLabel.text = String(correctCounter)
        
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
        incorrectCounter += 1
        incorrectLabel.text = String(incorrectCounter)
        
        labelAlpha.text = alphabetProvider.randomLetters(doRemove: false)
    }
    
    @IBAction func selectIndex(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 1 {
            labelAlpha.font = labelAlpha.font.withSize(80.0)
            correctButton.isHidden = true
            incorrectButton.isHidden = true
            
            numProvider.newNumbersPair()
            labelAlpha.text = numProvider.operationString
            
            numericButton.isHidden = false
            numeric2Button.isHidden = false
            numeric3Button.isHidden = false

            print(numProvider.labels)
            numericButton.titleLabel!.text = numProvider.labels[0]
            numeric2Button.titleLabel!.text = numProvider.labels[1]
            numeric3Button.titleLabel!.text = numProvider.labels[2]
            
        } else if segmentedControl.selectedSegmentIndex == 0 {
            labelAlpha.font = labelAlpha.font.withSize(125.0)
            if finishedAlphabet {
                labelAlpha.text = "🏆"
            } else {
                numericButton.isHidden = true
                numeric2Button.isHidden = true
                numeric3Button.isHidden = true
                correctButton.isHidden = false
                incorrectButton.isHidden = false
                
                labelAlpha.text = alphabetProvider.randomLetters(doRemove: false)
            }
        }
    }
}

