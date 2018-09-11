//
//  BigStuffViewController.swift
//  temporary
//
//  Created by apple on 20/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class BigStuffViewController: UIViewController {
    
    @IBOutlet var MainButtons: [UIButton]!

    @IBOutlet weak var MainMenu: UIButton!
    
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
            MainMenu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
        }
        else
        {
            MainMenu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
    }
    
    @IBAction func returnBigStuffToMainMenu(segue: UIStoryboardSegue) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnToMainMenu(_ sender: Any) {
        performSegue(withIdentifier: "returnBigStuffToMainMenu", sender: nil)
    }
    
    
}
