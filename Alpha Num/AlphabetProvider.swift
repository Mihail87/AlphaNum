//
//  AlphabetProvider.swift
//  Alpha Num
//
//  Created by Mihai Leonte on 11/27/17.
//  Copyright © 2017 Mihai Leonte. All rights reserved.
//

import GameKit

class AlphabetProvider {
    var lowerCaseAlphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    var upperCaseAlphabet: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var previousLetterIndex: Int = 33
    
    /// Returns a random uppercase and lowercase character - and removes it from the data source if the doRemove parameter is true. So it won't be returned again when the function is called the next time.
    func randomLetters(doRemove remove: Bool) -> String {
        if previousLetterIndex != 33 && remove {
            lowerCaseAlphabet.remove(at: previousLetterIndex)
            upperCaseAlphabet.remove(at: previousLetterIndex)
        }
        if lowerCaseAlphabet.count == 0 {
            return "N/A"
        }
        var randomNumber = 34
        if remove || lowerCaseAlphabet.count < 2 {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: lowerCaseAlphabet.count)
        } else {
            repeat {
                randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: lowerCaseAlphabet.count)
            } while randomNumber == previousLetterIndex
        }
        previousLetterIndex = randomNumber
        let upperChar = upperCaseAlphabet[randomNumber]
        let lowerChar = lowerCaseAlphabet[randomNumber]

        return upperChar + lowerChar
    }
    
    func resetAlphabet() {
        lowerCaseAlphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        upperCaseAlphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        previousLetterIndex = 33
    }
}
