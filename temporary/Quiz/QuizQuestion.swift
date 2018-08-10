//
//  Question.swift
//  Healthy Homes Youth App
//
//  Created by osuappcenter on 7/26/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import Foundation

class QuizQuestion {
    let chapterName : String
    let questionName : String
    let optionA : String
    let optionB : String
    var optionC : String?
    var optionD : String?
    
    
    let correctAns : Int
    
    init(chapName : String, quesName : String, choiceA : String, choiceB : String, choiceC : String, choiceD : String, answer : Int) {
        self.chapterName = chapName
        self.questionName = quesName
        self.optionA = choiceA
        self.optionB = choiceB
        self.optionC = choiceC
        self.optionD = choiceD
        self.correctAns = answer
    }
    
    init(chapName : String, quesName : String, choiceA : String, choiceB : String, answer : Int) {
        
        
        self.chapterName = chapName
        self.questionName = quesName
        self.optionA = choiceA
        self.optionB = choiceB
        self.correctAns = answer
    }
}
