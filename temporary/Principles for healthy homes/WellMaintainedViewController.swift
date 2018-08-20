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
    
    @IBOutlet var BottomNavButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()

        var value = false
        value = UserDefaults.standard.bool(forKey: key)
        //        configureCheckmark()
        // change the status of button based on "value"
        if value == true {
            bookmarkButtonTapped.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkButtonTapped.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
        
        for eachbutton in BottomNavButtons {
            //          Padding:
            eachbutton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            //           Min font:
            eachbutton.titleLabel?.adjustsFontSizeToFitWidth = true
            //         Corner radius:
            eachbutton.layer.cornerRadius = 5
            //        Alignment:
            eachbutton.titleLabel?.textAlignment = .center
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
            bookmarkButtonTapped.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key)
            UserDefaults.standard.synchronize()
            
            bookmarkButtonTapped.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }
    
}
