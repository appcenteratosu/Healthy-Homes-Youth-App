//
//  TrainyourBrainViewController.swift
//  Healthy Homes Youth App
//
//  Created by osuappcenter on 7/26/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class TrainyourBrainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var brainBGView: UIView!
    
    
   
    @IBAction func ReturnQuizToMainMenu(_ sender: Any) {
        performSegue(withIdentifier: "UnwindQuizToMainMenu", sender: nil)
    }
    
    @IBAction func ReturnQuizResultsToQuizMain(segue: UIStoryboardSegue) {
        
    }
    
    
}
