//
//  1423-MaximumPointsYouCanObtainfromCards.swift
//  Lee
//
//  Created by Matthew Lu on 31/5/22.
//  Copyright © 2022 Matthew Lu. All rights reserved.
//

import Foundation
//There are several cards arranged in a row, and each card has an associated number of points. The points are given in the integer array cardPoints.
//
//In one step, you can take one card from the beginning or from the end of the row. You have to take exactly k cards.
//
//Your score is the sum of the points of the cards you have taken.
//
//Given the integer array cardPoints and the integer k, return the maximum score you can obtain.
//
//Example 1:
//
//Input: cardPoints = [1,2,3,4,5,6,1], k = 3
//Output: 12
//Explanation: After the first step, your score will always be 1. However, choosing the rightmost card first will maximize your total score. The optimal strategy is to take the three cards on the right, giving a final score of 1 + 6 + 5 = 12.
//Example 2:
//
//Input: cardPoints = [2,2,2], k = 2
//Output: 4
//Explanation: Regardless of which two cards you take, your score will always be 4.
//Example 3:
//
//Input: cardPoints = [9,7,7,9,7,7,9], k = 7
//Output: 55
//Explanation: You have to take all the cards. Your score is the sum of points of all cards.

class Solution_1423 {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        
        let windowSize = cardPoints.count - k
        
        var sum = cardPoints[0..<windowSize].reduce(0, +)
        
        var res = sum
        for i in windowSize..<cardPoints.count {
            sum = sum + cardPoints[i] - cardPoints[i - windowSize]
            res = min(res, sum)
        }
        
        return cardPoints.reduce(0, +) - res
    }
}
