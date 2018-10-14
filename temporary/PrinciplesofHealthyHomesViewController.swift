//
//  PrinciplesofHealthyHomesViewController.swift
//  temporary
//
//  Created by apple on 19/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class PrinciplesofHealthyHomesViewController: UIViewController {
    
    // Declaration of UI Objects
    @IBOutlet var MainButtons: [UIButton]!
    @IBOutlet weak var MainMenuButton: UIButton!
    
    // unwind segue.
    @IBAction func unWindToManiMenu(_ sender: Any) {
        performSegue(withIdentifier: "UnwindToMainmenu", sender: nil)
    }
    
    @IBAction func returnToPrinciple(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = UIScreen.main.bounds
        
        // fixing title font for iPhone screens to 15 and iPad screens to 27
        for button in MainButtons {
            if frame.height > 850 && frame.width > 450  {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
            }
            else
            {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
            }
        }
        
        if frame.height > 850 && frame.width > 450  {
            MainMenuButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
        }
        else
        {
            MainMenuButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
