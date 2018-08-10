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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ViewAnswersTableView.delegate = self
        self.ViewAnswersTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var ViewAnswersTableView: UITableView!
    

    
    let CorrectAnswers : [String] = ["1. D: All of the above", "2. D: Keep it beautiful", "3. D: All of the above",
                                     "4. A: 1978", "5. B: False", "6. A: True", "7. D: Increase the amount of fiber that you eat",
                                     "8. A: True", "9. D: All of the above", "10. B: False", "11. B: Lung cancer", "12. A: True",
                                     "13. B: False", "14. D: All of the above", "15. A: True", "16. A: True", "17. B: False",
                                     "18. A: True", "19. A: True", "20. A: True", "21. A: True", "22. A: Comfortable",
                                     "23. A: True", "24. B: False", "25. C:Carbon monoxide"]
    
    
    
    func numberOfSections(in ViewAnswersTableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ ViewAnswersTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ ViewAnswersTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ViewAnswersTableView.dequeueReusableCell(withIdentifier: "ViewAnswersCell", for: indexPath) as! ViewAnswersTableViewCell
        
        cell.AnswersLabel.text = CorrectAnswers[indexPath.row]
 
        
        return cell;
        
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
