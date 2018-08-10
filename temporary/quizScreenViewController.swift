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
    
    //outlet for buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    
    @IBAction func backButton(_ sender: UIButton) {
        if questionNumber > 0 {
            if sender.tag == 5 {
                questionNumber -= 1
                updateQuestion()
            }
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if sender.tag == 6 {
            questionNumber += 1
            updateQuestion()
        }
        if status == "correct" {
            score += 1
        }
        percent = Double(score*4)
        StatusArray.append(status)
    }
    
    
    @IBAction func EndQuiz(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        } else if sender.tag != selectedAnswer {
            status = "wrong"
        } else if sender.tag == nil{
            status = "skipped"
        }
        
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
        } else if sender.tag != selectedAnswer {
            status = "wrong"
        } else if sender.tag == nil{
            status = "skipped"
        }
        
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
        } else if sender.tag != selectedAnswer {
            status = "wrong"
        } else if sender.tag == nil{
            status = "skipped"
        }
        
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
        } else if sender.tag != selectedAnswer {
            status = "wrong"
        } else if sender.tag == nil{
            status = "skipped"
        }
        
    }
    
    
    
    var status = String()
    
    var percentage = Int()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "results" {
            if let vc = segue.destination as? QuizResultsViewController {
                vc.scoreText = self.score
                vc.percentage = self.percent
            }
        }
        //        if segue.identifier == "ViewAnswersSegue" {
        //            if let vc = segue.destination as? ViewAnswersViewController {
        //                vc.answerStatusArray = self.StatusArray
        //            }
        //        }
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "ViewAnswersSegue" {
    //            if let vc = segue.destination as? ViewAnswersViewController {
    //                vc.answerStatusArray = self.StatusArray
    //            }
    //        }
    //    }
    
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
