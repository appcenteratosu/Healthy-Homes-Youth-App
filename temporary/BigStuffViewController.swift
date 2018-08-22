//
//  BigStuffViewController.swift
//  temporary
//
//  Created by apple on 20/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class BigStuffViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
