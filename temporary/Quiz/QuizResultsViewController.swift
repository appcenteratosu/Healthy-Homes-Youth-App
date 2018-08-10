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
    
    var scoreText = Int()
    var total = Int()
    var percentage = Double()
    var checkStatusArray = [String]()
    var answerStatusArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "You got \(scoreText) out of \(25) right!"
        percentageLabel.text = "That means you achieved \(percentage)%"
        print(answerStatusArray)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
