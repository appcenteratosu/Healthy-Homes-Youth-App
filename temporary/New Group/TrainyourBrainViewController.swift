//
//  TrainyourBrainViewController.swift
//  Healthy Homes Youth App
//
//  Created by osuappcenter on 7/26/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class TrainyourBrainViewController: UIViewController {
    
    // Declaration of UI objects.
    @IBOutlet weak var QuizSpeechBubble: UIImageView!
    
    // Unwind Segues.
    @IBAction func ReturnQuizToMainMenu(_ sender: Any) {
        performSegue(withIdentifier: "UnwindQuizToMainMenu", sender: nil)
    }
    
    @IBAction func ReturnQuizResultsToQuizMain(segue: UIStoryboardSegue) {
        
    }
    
    @IBOutlet weak var Enter: UIButton!    
    @IBOutlet weak var MainMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fixing title font for iPhone screens to 15 and iPad screens to 27
        let frame = UIScreen.main.bounds
        
        if frame.height > 850 && frame.width > 450  {
            Enter.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
        }
        else
        {
            Enter.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
        
        if frame.height > 850 && frame.width > 450  {
            MainMenu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
        }
        else
        {
            MainMenu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
