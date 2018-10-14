//
//  SafeViewController.swift
//  temporary
//
//  Created by apple on 15/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class SafeViewController: UIViewController {
    let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it SAFE|" + "Injuries such as falls, burns, and poisonings occur most often..."

    // Declaration of UI Objects
    @IBOutlet weak var bookmarkSelected: UIButton!
    
    // Unwind Segue.
    @IBAction func UnwindSafeToPrinciple(_ sender: Any) {
        performSegue(withIdentifier: "UnwindSafeToPrinciple", sender: nil)        
    }
    
    @IBOutlet var bottomNavButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // changes the status of button based on "value"
        var value = false
        value = UserDefaults.standard.bool(forKey: key)

        if value == true {
            bookmarkSelected.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkSelected.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
        
        // fixing title font for iPhone screens to 15 and iPad screens to 27
        let frame = UIScreen.main.bounds
        
        for button in bottomNavButtons {
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
    
    // Bookmark button, when it is null, Status of bookmark changes to bookmark selected and vice-versa.
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it SAFE|" + "Injuries such as falls, burns, and poisonings occur most often..."
        var existingAnswer = defaults.object(forKey:key) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        // Stores the bookmark status in userdefaults and add the page into save for later.
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key)
            UserDefaults.standard.synchronize()
            bookmarkSelected.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        }
        else
        {
            UserDefaults.standard.set(false, forKey: key)
            UserDefaults.standard.synchronize()
            
            bookmarkSelected.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }
}
