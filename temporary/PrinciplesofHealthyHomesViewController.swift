//
//  PrinciplesofHealthyHomesViewController.swift
//  temporary
//
//  Created by apple on 19/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class PrinciplesofHealthyHomesViewController: UIViewController {
    
    @IBOutlet var MainButtons: [UIButton]!
    
    @IBOutlet weak var MainMenuButton: UIButton!
    
    @IBAction func unWindToManiMenu(_ sender: Any) {
        performSegue(withIdentifier: "UnwindToMainmenu", sender: nil)
    }
    
    @IBAction func returnToPrinciple(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = UIScreen.main.bounds
        
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
