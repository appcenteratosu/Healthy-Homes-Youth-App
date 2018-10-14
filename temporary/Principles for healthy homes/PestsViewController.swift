//
//  PestsViewController.swift
//  temporary
//
//  Created by apple on 15/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class PestsViewController: UIViewController {

    @IBOutlet weak var bookmarkButtonSelected: UIButton!
    let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it PEST FREE|" + "Exposure to pests such as roaches and rodents can trigger an asthma attack..."
    
    // Declaration of UI Objects
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var ChapterButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet var BottomNavButtons: [UIButton]!
    
    // Unwind Segue.
    @IBAction func UnwindToPrincipleMenu(_ sender: Any) {
        performSegue(withIdentifier: "returnPestToPrincipleMenu", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // changes the status of button based on "value"
        var value = false
        value = UserDefaults.standard.bool(forKey: key)
        
        if value == true {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }

        let frame = UIScreen.main.bounds
        
        // fixing title font for iPhone screens to 15 and iPad screens to 27
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
   
    // Bookmark button, when it is null, Status of bookmark changes to bookmark selected and vice-versa.
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it PEST FREE|" + "Exposure to pests such as roaches and rodents can trigger an asthma attack..."

        var existingAnswer = defaults.object(forKey:key) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        // Stores the bookmark status in userdefaults and add the page into save for later.
        existingAnswer = !(existingAnswer)!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key)
            UserDefaults.standard.synchronize()
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        }
        else {
            UserDefaults.standard.set(false, forKey: key)
            UserDefaults.standard.synchronize()
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }    
}
