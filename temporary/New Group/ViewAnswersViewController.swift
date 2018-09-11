//
//  ViewAnswersViewController.swift
//  temporary
//
//  Created by osuappcenter on 8/8/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class ViewAnswersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var checkingStatusArray = [String]()
    var viewAnswersStatusArray = [String]()
    var answersImageArray = [UIImageView]()
    var Image = UIImageView()
    
    @IBOutlet weak var Back: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ViewAnswersTableView.delegate = self
        self.ViewAnswersTableView.dataSource = self
        viewAnswersStatusArray = checkingStatusArray
        self.ViewAnswersTableView.separatorColor = #colorLiteral(red: 0.1647058824, green: 0.5294115647, blue: 1, alpha: 1)
        self.ViewAnswersTableView.backgroundColor = UIColor.clear
        self.ViewAnswersTableView.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.5294115647, blue: 1, alpha: 1)
        
        let frame = UIScreen.main.bounds
        
        if frame.height > 850 && frame.width > 450  {
            Back.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
            
        }
        else
        {
            Back.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var ViewAnswersTableView: UITableView!
    
    @IBAction func ReturnQuizResultsToQuizMain(_ sender: Any) {
        performSegue(withIdentifier: "UnwindQuizResultsToQuizMain", sender: nil)
    }
    
    
    let CorrectAnswers : [String] = ["1. D: All of the above", "2. D: Keep it beautiful", "3. D: All of the above",
                                     "4. A: 1978", "5. B: False", "6. A: True", "7. D: Increase the amount of fiber that you eat",
                                     "8. A: True", "9. D: All of the above", "10. B: False", "11. B: Lung cancer", "12. A: True",
                                     "13. B: False", "14. D: All of the above", "15. A: True", "16. A: True", "15. B: False",
                                     "18. A: True", "19. A: True", "20. A: True", "21. A: True", "22. A: Comfortable",
                                     "23. A: True", "24. B: False", "25. C:Carbon monoxide"]
    
    
    
    func numberOfSections(in ViewAnswersTableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ ViewAnswersTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ ViewAnswersTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ViewAnswersTableView.dequeueReusableCell(withIdentifier: "ViewAnswersCell", for: indexPath) as! ViewAnswersTableViewCell
        
        cell.AnswersLabel.text = CorrectAnswers[indexPath.row]
        cell.AnswersLabel.textColor = #colorLiteral(red: 1, green: 0.05098039216, blue: 0.5019607843, alpha: 1)
        cell.AnswersLabel.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.5294115647, blue: 1, alpha: 1)
        cell.AnswersLabel.layer.borderWidth = 2
        cell.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        cell.contentView.backgroundColor = UIColor.clear
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.5294115647, blue: 1, alpha: 1)
        
        var isChecked = viewAnswersStatusArray[indexPath.row]
        
        if isChecked == "correct" {
            cell.AnswerImage.image = UIImage(named: "correct")
        } else if isChecked == "wrong" {
            cell.AnswerImage.image = UIImage(named: "incorrect")
        } else if isChecked == "skipped" {
            cell.AnswerImage.image = UIImage(named: "skipped")
        }
        
        return cell;
    }
}
