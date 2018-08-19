//
//  WellMaintainedViewController.swift
//  temporary
//
//  Created by apple on 17/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class WellMaintainedViewController: UIViewController {

    @IBOutlet weak var bookmarkButtonTapped: UIButton!
    
    let key = "bookmark|" + "8Principles|" + "Maintained"

    override func viewDidLoad() {
        super.viewDidLoad()

        var value = false
        value = UserDefaults.standard.bool(forKey: key)
        //        configureCheckmark()
        // change the status of button based on "value"
        if value == true {
            bookmarkButtonTapped.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            bookmarkButtonTapped.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookmarkButtonSelected(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key = "bookmark|" + "8Principles|" + "Maintained"
        var existingAnswer = defaults.object(forKey:key) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key)
            UserDefaults.standard.synchronize()
            bookmarkButtonTapped.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key)
            UserDefaults.standard.synchronize()
            
            bookmarkButtonTapped.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
    }
    
}
