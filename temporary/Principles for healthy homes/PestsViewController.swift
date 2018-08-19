//
//  PestsViewController.swift
//  temporary
//
//  Created by apple on 17/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class PestsViewController: UIViewController {

    @IBOutlet weak var bookmarkButtonSelected: UIButton!
    let key = "bookmark|" + "8Principles|" + "Pest"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var ChapterButton: UIButton!
    
    @IBOutlet weak var NextButton: UIButton!    

    override func viewDidLoad() {
        super.viewDidLoad()

        var value = false
        value = UserDefaults.standard.bool(forKey: key)
        
        if value == true {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
        
        //      Padding:
        backButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        //       Min font:
        backButton.titleLabel?.adjustsFontSizeToFitWidth = true
        //     Corner radius:
        backButton.layer.cornerRadius = 5
        //     Alignment:
        backButton.titleLabel?.textAlignment = .center
        
        //      Padding:
        ChapterButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        //       Min font:
        ChapterButton.titleLabel?.adjustsFontSizeToFitWidth = true
        //     Corner radius:
        ChapterButton.layer.cornerRadius = 5
        //     Alignment:
        ChapterButton.titleLabel?.textAlignment = .center
        
        //      Padding:
        NextButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        //       Min font:
        NextButton.titleLabel?.adjustsFontSizeToFitWidth = true
        //     Corner radius:
        NextButton.layer.cornerRadius = 5
        //     Alignment:
        NextButton.titleLabel?.textAlignment = .center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key = "bookmark|" + "8Principles|" + "Pest"

        var existingAnswer = defaults.object(forKey:key) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        existingAnswer = !(existingAnswer)!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key)
            UserDefaults.standard.synchronize()
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        }
        else {
            UserDefaults.standard.set(false, forKey: key)
            UserDefaults.standard.synchronize()
            
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
    }
    
}
