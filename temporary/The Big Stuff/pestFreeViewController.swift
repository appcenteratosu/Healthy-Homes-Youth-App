//
//  pestFreeViewController.swift
//  temporary
//
//  Created by apple on 15/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class pestFreeViewController: UIViewController {
    let key1 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Pests are unwanted living things in or around your..."
    let key2 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Inside your home, mice, rats and cockroaches may trigger..."
    let key3 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Pests travel into your home from outdoors or other..."
    let key4 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Help clean up after cooking and..."
    let key5 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Help keep your house tidy: Do not let..."
    let key6 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Help clean up your yard. Keep mulch, garden..."
    
    // Declaration of UI Objects
    @IBOutlet weak var bookmarkSelected1: UIButton!
    @IBOutlet weak var bookmarkSelected2: UIButton!
    @IBOutlet weak var bookmarkSelected3: UIButton!
    @IBOutlet weak var bookmarkSelected4: UIButton!
    @IBOutlet weak var bookmarkSelected5: UIButton!
    @IBOutlet weak var bookmarkSelected6: UIButton!
    @IBOutlet var BottomNavButtons: [UIButton]!
    
    // Unwind Segues.
    @IBAction func ReturnPestToBigStuff(_ sender: Any) {
        performSegue(withIdentifier: "UnwindPestToBigStuff", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // fixing title font for iPhone screens to 15 and iPad screens to 27
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
        
        var value1 = false
        value1 = UserDefaults.standard.bool(forKey: key1)
        
        var value2 = false
        value2 = UserDefaults.standard.bool(forKey: key2)
        
        var value3 = false
        value3 = UserDefaults.standard.bool(forKey: key3)
        
        var value4 = false
        value4 = UserDefaults.standard.bool(forKey: key4)
        
        var value5 = false
        value5 = UserDefaults.standard.bool(forKey: key5)
        
        var value6 = false
        value6 = UserDefaults.standard.bool(forKey: key6)
        
        // changes the status of button based on "value"
        if value1 == true {
            bookmarkSelected1.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkSelected1.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
        
        if value2 == true {
            bookmarkSelected2.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkSelected2.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
        
        if value3 == true {
            bookmarkSelected3.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkSelected3.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
        
        if value4 == true {
            bookmarkSelected4.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkSelected4.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
        
        if value5 == true {
            bookmarkSelected5.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkSelected5.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
        
        if value6 == true {
            bookmarkSelected6.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkSelected6.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Bookmark button, when it is null, Status of bookmark changes to bookmark selected and vice-versa.
    @IBAction func bookmarkButtonSelected1(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key1 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Pests are unwanted living things in or around your..."
        var existingAnswer = defaults.object(forKey:key1) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        // Stores the bookmark status in userdefaults and uses to add the page into save for later.
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key1)
            UserDefaults.standard.synchronize()
            bookmarkSelected1.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key1)
            UserDefaults.standard.synchronize()
            
            bookmarkSelected1.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }
    
    // Bookmark button, when it is null, Status of bookmark changes to bookmark selected and vice-versa.
    @IBAction func bookmarkButtonSelected2(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key2 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Inside your home, mice, rats and cockroaches may trigger..."
        var existingAnswer = defaults.object(forKey:key2) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        // Stores the bookmark status in userdefaults and uses to add the page into save for later.
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key2)
            UserDefaults.standard.synchronize()
            bookmarkSelected2.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key2)
            UserDefaults.standard.synchronize()
            bookmarkSelected2.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }
    
    // Bookmark button, when it is null, Status of bookmark changes to bookmark selected and vice-versa.
    @IBAction func bookmarkButtonSelected3(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key3 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Pests travel into your home from outdoors or other..."
        var existingAnswer = defaults.object(forKey:key3) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        // Stores the bookmark status in userdefaults and uses to add the page into save for later.
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key3)
            UserDefaults.standard.synchronize()
            bookmarkSelected3.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key3)
            UserDefaults.standard.synchronize()
            bookmarkSelected3.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }
    
    // Bookmark button, when it is null, Status of bookmark changes to bookmark selected and vice-versa.
    @IBAction func bookmarkButtonSelected4(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key4 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Help clean up after cooking and..."
        var existingAnswer = defaults.object(forKey:key4) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        // Stores the bookmark status in userdefaults and uses to add the page into save for later.
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key4)
            UserDefaults.standard.synchronize()
            bookmarkSelected4.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key4)
            UserDefaults.standard.synchronize()
            bookmarkSelected4.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }
    
    // Bookmark button, when it is null, Status of bookmark changes to bookmark selected and vice-versa.
    @IBAction func bookmarkButtonSelected5(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key5 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Help keep your house tidy: Do not let..."
        var existingAnswer = defaults.object(forKey:key5) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        // Stores the bookmark status in userdefaults and uses to add the page into save for later.
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key5)
            UserDefaults.standard.synchronize()
            bookmarkSelected5.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key5)
            UserDefaults.standard.synchronize()
            bookmarkSelected5.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }
    
    // Bookmark button, when it is null, Status of bookmark changes to bookmark selected and vice-versa.
    @IBAction func bookmarkButtonSelected6(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key6 = "bookmarks|" + "The Big Stuff|" + "pestFree|" + "Help clean up your yard. Keep mulch, garden..."
        var existingAnswer = defaults.object(forKey:key6) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        // Stores the bookmark status in userdefaults and uses to add the page into save for later.
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key6)
            UserDefaults.standard.synchronize()
            bookmarkSelected6.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key6)
            UserDefaults.standard.synchronize()
            bookmarkSelected6.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }
}
