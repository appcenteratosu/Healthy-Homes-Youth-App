//
//  QuizResultsViewController.swift
//  Healthy Homes Youth App
//
//  Created by osuappcenter on 7/26/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class QuizResultsViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet var bottomNavButtons: [UIButton]!
    
    var scoreText = Int()
    var total = Int()
    var percentage = Double()
    var checkStatusArray = [String]()
    var answerStatusArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "You got \(scoreText) out of \(25) right!"
        percentageLabel.text = "That means you achieved \(percentage)%"
        checkStatusArray = answerStatusArray

        backgroundView.layer.cornerRadius = 5;
        backgroundView.layer.masksToBounds = true;
        
        for eachbutton in bottomNavButtons {
            eachbutton.titleLabel?.textAlignment = .center
            eachbutton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            eachbutton.titleLabel?.adjustsFontSizeToFitWidth = true
            eachbutton.layer.cornerRadius = 5
        
        }
    }
    
    @IBAction func returnToMainMenu(_ sender: Any) {
        performSegue(withIdentifier: "UnwindToMainMenu", sender: nil)

    }
    
    
    @IBAction func ReturnQuizResultsToQuizScreen(_ sender: Any) {
        performSegue(withIdentifier: "UnwindQuizResultsToQuizScreen", sender: nil)
    }
    
    @IBOutlet weak var backgroundView: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewAnswersSegue" {
            if let vc = segue.destination as? ViewAnswersViewController {
                vc.checkingStatusArray = self.checkStatusArray
            }
        }
    }
    
    @IBAction func ViewAnswersButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ViewAnswersSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
