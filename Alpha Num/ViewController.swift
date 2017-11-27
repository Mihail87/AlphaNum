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
    
    let alphabetProvider = AlphabetProvider()
    var correctCounter: Int = 0
    var incorrectCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctLabel.text = String(correctCounter)
        incorrectLabel.text = String(incorrectCounter)
        
        labelAlpha.text = alphabetProvider.randomLetters()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func answerCorrect() {
        correctCounter += 1
        correctLabel.text = String(correctCounter)
        labelAlpha.text = alphabetProvider.randomLetters()
    }
    @IBAction func answerWrong() {
        incorrectCounter += 1
        correctLabel.text = String(correctCounter)
        labelAlpha.text = alphabetProvider.randomLetters()
    }
    
}

