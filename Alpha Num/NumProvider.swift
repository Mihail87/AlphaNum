//
//  NumProvider.swift
//  Alpha Num
//
//  Created by Mihai Leonte on 11/28/17.
//  Copyright © 2017 Mihai Leonte. All rights reserved.
//

import GameKit

class NumProvider {
    var firstNum: Int = 0
    var secondNum: Int = 0
    var operationString: String = ""
    var labels = ["", "", ""]

    
    func newNumbersPair() {
        //var randomIndex = 0
        var labelItems = ["", "", ""]
        var newLabels: [String] = []
        //first = true
        
        self.firstNum = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        self.secondNum = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        self.operationString = String(firstNum) + " + " + String(secondNum) + " = ?"
        labelItems[0] = String(firstNum + secondNum)
        labelItems[1] = String(firstNum + secondNum + 1)
        labelItems[2] = String(firstNum + secondNum - 1)
        
        for _ in 0..<labelItems.count
        {
            let rand = Int(arc4random_uniform(UInt32(labelItems.count)))
            newLabels.append(labelItems[rand])
            labelItems.remove(at: rand)
        }
        
        labels = newLabels
        
        /*
        randomIndex = GKRandomSource.sharedRandom().nextInt(upperBound: 2)
        labels[randomIndex] = String(firstNum + secondNum)
        for i in 0...2 {
            if labels[i] == "" {
                if first {
                    first = false
                    labels[i] = String(firstNum + secondNum - 1)
                } else {
                    labels[i] = String(firstNum + secondNum + 1)
                }
            }
        }
        */
    }
}
