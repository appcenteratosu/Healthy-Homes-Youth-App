//
//  keepItContaminentFreeViewController.swift
//  temporary
//
//  Created by apple on 16/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class keepItContaminentFreeViewController: UIViewController {
    
    let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it CONTAMINANT FREE|" + "Levels of contaminants such as lead, radon, carbon monoxide, asbestos,..."
    
    @IBOutlet weak var bookmarkButtonSelected: UIButton!
    
    @IBOutlet weak var speechBubbleText: UITextView!
    
    @IBOutlet var BottomNavButtons: [UIButton]!
    
    @IBAction func UnwindContFreeToPrinciple(_ sender: Any) {
        performSegue(withIdentifier: "UnwindContFreeToPrinciple", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = UIScreen.main.bounds
        
        for button in BottomNavButtons {
            if frame.height > 850 && frame.width > 450  {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
            }
            else
            {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
            }
        }
        
        var value = false
        value = UserDefaults.standard.bool(forKey: key)
        
        if value == true {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "fav heart"), for: UIControlState.normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it CONTAMINANT FREE|" + "Levels of contaminants such as lead, radon, carbon monoxide, asbestos,..."
        var existingAnswer = defaults.object(forKey:key) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key)
            UserDefaults.standard.synchronize()
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        }
        else {
            UserDefaults.standard.set(false, forKey: key)
            UserDefaults.standard.synchronize()
            
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "fav heart"), for: UIControlState.normal)
        }
       
    }
    
}
