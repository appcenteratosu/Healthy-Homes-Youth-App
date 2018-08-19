//
//  QuestionBank.swift
//  Healthy Homes Youth App
//
//  Created by osuappcenter on 7/26/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [QuizQuestion]()
    
    init() {
        list.append(QuizQuestion(chapName: "Introduction", quesName: "A home can:", choiceA: "A. Make you feel safe", choiceB: "B. Help keep you safe", choiceC: "C. Support the health of your family", choiceD: "D. All of the above", answer: 4))
        
        list.append(QuizQuestion(chapName: "Eight Principles of Healthy Homes", quesName: "Which of the following is not a healthy home principle?", choiceA: "A. Keep it dry", choiceB: "B. Keep it clean", choiceC: "C. Keep it safe", choiceD: "D. Keep it beautiful", answer: 4))
        
        list.append(QuizQuestion(chapName: "Eight Principles of Healthy Homes", quesName: "Mold and pests can contribute to which of the following?", choiceA: "A. Asthma", choiceB: "B. Allergies", choiceC: "C. Respiratory illnesses", choiceD: "D. All of the above", answer: 4))
        
        list.append(QuizQuestion(chapName: "Lead", quesName: "If a home is built before this year, paint should be tested for lead:", choiceA: "A. 1978", choiceB: "B. 1990", choiceC: "C. 2000", choiceD: "D. 2010", answer: 1))
        
        list.append(QuizQuestion(chapName: "Lead", quesName: "Lead poisoning is a problem of the past; no one gets lead poisoned", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 2))
        
        list.append(QuizQuestion(chapName: "Asthma and Allergies", quesName: "There are items in the home environment that can cause asthma attacks.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Asthma and Allergies", quesName: "Consider healthy homes: which of the following is not effective in reducing asthma and allergy risk?", choiceA: "A. Vacuuming", choiceB: "B. Keep pets out of sleeping areas", choiceC: "C. Vent clothes dryers to the outside", choiceD: "D. Increase the amount of fiber that you eat", answer: 4))
        
        list.append(QuizQuestion(chapName: "Mold and Moisture", quesName: "Mold might be found in moist, humid areas.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Mold and Moisture", quesName: "Mold can be which of the following colors?", choiceA: "A. Black", choiceB: "B. Gray", choiceC: "C. Orange", choiceD: "D. All of the above", answer: 4))
        
        list.append(QuizQuestion(chapName: "Radon", quesName: "Radon can sometimes smell like freshly mowed grass.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 2))
        
        list.append(QuizQuestion(chapName: "Radon", quesName: "When you breathe air containing radon, you can get:", choiceA: "A. A rash", choiceB: "B. Lung cancer", choiceC: "C. A bad case of the spots", choiceD: "D. All of the above", answer: 2))
        
        list.append(QuizQuestion(chapName: "Household Chemicals", quesName: "Household chemicals can be harmful if not used properly.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Household Chemicals", quesName: "Reading the labels on household products us a good idea, but optional in most cases.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 2))
        
        list.append(QuizQuestion(chapName: "Pests", quesName: "Pests travel into your home and are looking for:", choiceA: "A. Food", choiceB: "B. Water", choiceC: "C. Shelter", choiceD: "D. All of the above", answer: 4))
        
        list.append(QuizQuestion(chapName: "Pests", quesName: "Cleaning up after cooking and eating can help reduce pests in the home.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Carbon Monoxide", quesName: "You can’t see, taste, or smell carbon monoxide.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Carbon Monoxide", quesName: "It is safe to breathe low levels of carbon monoxide.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 2))
        
        list.append(QuizQuestion(chapName: "Home Safety", quesName: "Keeping the floors in your home free of clutter one way to reduce the risk of falling down.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Home Safety", quesName: "Homes should have fire alarms on every level and near every sleeping area.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Asbestos", quesName: "Asbestos fibers are harmful if they get into the air and you breathe them.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Asbestos", quesName: "Breathing in asbestos fibers for many years can lead to health problems.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Home Temperature Control", quesName: "A healthy home has _______ temperature and humidity levels.", choiceA: "A. Comfortable", choiceB: "B. Hot", choiceC: "C. Cold", choiceD: "D. None of the above", answer: 1))
        
        list.append(QuizQuestion(chapName: "Home Temperature Control", quesName: "Homes that are too cold or hot can be bad for seniors and people with chronic illnesses.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 1))
        
        list.append(QuizQuestion(chapName: "Indoor Air Quality", quesName: "It is always easy to tell if a home has good indoor air quality.", choiceA: "A. True", choiceB: "B. False", choiceC: "", choiceD: "", answer: 2))
        
        list.append(QuizQuestion(chapName: "Indoor Air Quality", quesName: "This home toxin cannot be seen or smelled:", choiceA: "A. Clutter", choiceB: "B. Lead", choiceC: "C. Carbon monoxide", choiceD: "D. Disease", answer: 3))
        
    }
}
