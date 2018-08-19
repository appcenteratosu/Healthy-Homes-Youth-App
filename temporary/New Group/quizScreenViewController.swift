//
//  quizScreenViewController.swift
//  Healthy Homes Youth App
//
//  Created by osuappcenter on 7/26/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class quizScreenViewController: UIViewController {
    
    @IBOutlet weak var chapterName: UILabel!
    @IBOutlet weak var quesName: UILabel!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    var percent: Double = 0.0
    var StatusArray = [String]()
    var status = String()
    
    //outlet for buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    @IBOutlet weak var nextButtonSelected: UIButton!
    
    @IBAction func backButton(_ sender: UIButton) {
        if questionNumber > 0 {
            if sender.tag == 5 {
                questionNumber -= 1
                updateQuestion()
            }
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if status == "correct" {
            score += 1
        }
        percent = Double(score*4)
        print(status)
         print(score)
   //     StatusArray.append(status)
        if questionNumber == 24 {
            nextButtonSelected.isHidden = true
        }
        self.StatusArray[questionNumber] = status
        
        if sender.tag == 6 {
            questionNumber += 1
            updateQuestion()
        }
        
        
        
    }
    
    
    @IBAction func EndQuiz(_ sender: Any) {
        self.performSegue(withIdentifier: "results", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //you should update answer here only if he hasnt clicked
        StatusArray = ["skipped","skipped","skipped","skipped","skipped","skipped","skipped","skipped",
        "skipped","skipped","skipped","skipped","skipped","skipped","skipped","skipped","skipped",
        "skipped","skipped","skipped","skipped","skipped","skipped","skipped","skipped"]
      
        updateQuestion()
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func optionAPressed(_ sender: UIButton) {
        if(sender.backgroundImage(for: UIControlState.normal) == UIImage(named: "unselected button")  ) {
            sender.setBackgroundImage(UIImage(named: "selected answer button"), for: UIControlState.normal)
        } else {
            sender.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        }
        optionB.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
            optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        } else {
            optionC.setBackgroundImage(nil, for: UIControlState.normal)
            optionD.setBackgroundImage(nil, for: UIControlState.normal)
        }
        
        if sender.tag == selectedAnswer {
            status = "correct"
        } else {
            status = "wrong"
        }
         print(status)
    }
    
    @IBAction func optionBPressed(_ sender: UIButton) {
        if(sender.backgroundImage(for: UIControlState.normal) == UIImage(named: "unselected button")  ) {
            sender.setBackgroundImage(UIImage(named: "selected answer button"), for: UIControlState.normal)
        } else {
            sender.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        }
        optionA.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
            optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        } else {
            optionC.setBackgroundImage(nil, for: UIControlState.normal)
            optionD.setBackgroundImage(nil, for: UIControlState.normal)
        }
        
        if sender.tag == selectedAnswer {
            status = "correct"
        } else {
            status = "wrong"
        }
         print(status)
    }
    
    @IBAction func optionCPressed(_ sender: UIButton) {
        if(sender.backgroundImage(for: UIControlState.normal) == UIImage(named: "unselected button")  ) {
            sender.setBackgroundImage(UIImage(named: "selected answer button"), for: UIControlState.normal)
        } else {
            sender.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        }
        optionA.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        optionB.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
            optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        } else {
            optionC.setBackgroundImage(nil, for: UIControlState.normal)
            optionD.setBackgroundImage(nil, for: UIControlState.normal)
        }
        
        if sender.tag == selectedAnswer {
            status = "correct"
        } else {
            status = "wrong"
        }
         print(status)
    }
    
    @IBAction func optionDPressed(_ sender: UIButton) {
        if(sender.backgroundImage(for: UIControlState.normal) == UIImage(named: "unselected button")  ) {
            sender.setBackgroundImage(UIImage(named: "selected answer button"), for: UIControlState.normal)
        } else {
            sender.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        }
        optionA.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        optionB.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
            optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        } else {
            optionC.setBackgroundImage(nil, for: UIControlState.normal)
            optionD.setBackgroundImage(nil, for: UIControlState.normal)
        }
        
        if sender.tag == selectedAnswer {
            status = "correct"
        } else {
            status = "wrong"
        }
         print(status)
    }
    
    var percentage = Int()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "results" {
            if let vc = segue.destination as? QuizResultsViewController {
                vc.scoreText = self.score
                vc.percentage = self.percent
                vc.answerStatusArray = self.StatusArray
            }
        }
        
    }
    
    func updateQuestion() {
        if questionNumber <= allQuestions.list.count {
            optionA.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            optionB.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            
            if optionC.title(for: UIControlState.normal) != "" {
                optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            } else {
                optionC.setBackgroundImage(nil, for: UIControlState.normal)
                //            optionC.backgroundColor = UIColor.clear
                //            optionC.isHidden = true
            }
            
            if optionD.title(for: UIControlState.normal) != "" {
                optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            } else {
                optionD.setBackgroundImage(nil, for: UIControlState.normal)
                //            optionC.backgroundColor = UIColor.clear
                //         optionD.isHidden = true
            }
        }
        
        if questionNumber <= allQuestions.list.count - 1 {
            chapterName.text = allQuestions.list[questionNumber].chapterName
            quesName.text = allQuestions.list[questionNumber].questionName
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControlState.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControlState.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControlState.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControlState.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAns
            
            if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
                optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
                optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            } else {
                optionC.setBackgroundImage(nil, for: UIControlState.normal)
                optionD.setBackgroundImage(nil, for: UIControlState.normal)
            }
        }
        status = "skipped"
        
    }
    
    var Score : Int = 0
    
    func updateUI() {
        
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
}
