//
//  AlphabetProvider.swift
//  Alpha Num
//
//  Created by Mihai Leonte on 11/27/17.
//  Copyright © 2017 Mihai Leonte. All rights reserved.
//

import GameKit

class AlphabetProvider {
    let lowerCaseAlphabet: [String] = ["a", "b", "c", "d"]
    let upperCaseAlphabet: [String] = ["A", "B", "C", "D"]
    
    func randomLetters -> String {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: lowerCaseAlphabet.count)
        return upperCaseAlphabet[randomNumber] + lowerCaseAlphabet[randomNumber]
    }
}
