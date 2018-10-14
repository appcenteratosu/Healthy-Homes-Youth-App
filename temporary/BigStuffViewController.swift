//
//  BigStuffViewController.swift
//  temporary
//
//  Created by apple on 20/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class BigStuffViewController: UIViewController {
    
    // Declaration of UI Objects
    @IBOutlet var MainButtons: [UIButton]!
    @IBOutlet weak var MainMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fixing title font for iPhone screens to 15 and iPad screens to 27
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
            MainMenu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
        }
        else
        {
            MainMenu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Unwind Segue.
    @IBAction func returnToMainMenu(_ sender: Any) {
        performSegue(withIdentifier: "returnBigStuffToMainMenu", sender: nil)
    }        
}
