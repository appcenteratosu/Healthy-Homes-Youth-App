//
//  WellMaintainedViewController.swift
//  temporary
//
//  Created by apple on 15/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class WellMaintainedViewController: UIViewController {

    @IBOutlet weak var bookmarkButtonTapped: UIButton!
    
    let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it WELL MAINTAINED|" + "Poorly maintained homes are at risk for moisture, pest problems..."
    
    @IBOutlet var BottomNavButtons: [UIButton]!

    @IBAction func UnwindMaintainedToPrinciple(_ sender: Any) {
        performSegue(withIdentifier: "UnwindMaintainedToPrinciple", sender: nil)
    }
        
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
        let frame = UIScreen.main.bounds
        
        for button in BottomNavButtons {
            if frame.height > 850 && frame.width > 450  {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
                button.titleLabel?.textAlignment = .center

            }
            else
            {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
                button.titleLabel?.textAlignment = .center

            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookmarkButtonSelected(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it WELL MAINTAINED|" + "Poorly maintained homes are at risk for moisture, pest problems..."
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
