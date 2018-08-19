//
//  MoldMoistureViewController.swift
//  temporary
//
//  Created by apple on 17/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class MoldMoistureViewController: UIViewController {
    
    @IBOutlet weak var bookmarkSelected1: UIButton!
    
    @IBOutlet weak var bookmarkSelected2: UIButton!
    
    @IBOutlet weak var bookmarkSelected3: UIButton!
    
    @IBOutlet weak var bookmarkSelected4: UIButton!
    
    @IBOutlet weak var bookmarkSelected5: UIButton!
    
    @IBOutlet weak var bookmarkSelected6: UIButton!
    
    
    let key1 = "bookmark|" + "BigStuff|" + "MoldMoisture1"
    let key2 = "bookmark|" + "BigStuff|" + "MoldMoisture2"
    let key3 = "bookmark|" + "BigStuff|" + "MoldMoisture3"
    let key4 = "bookmark|" + "BigStuff|" + "MoldMoisture4"
    let key5 = "bookmark|" + "BigStuff|" + "MoldMoisture5"
    let key6 = "bookmark|" + "BigStuff|" + "MoldMoisture6"


    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        if value1 == true {
            bookmarkSelected1.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            bookmarkSelected1.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
        
        if value2 == true {
            bookmarkSelected2.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            bookmarkSelected2.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
        
        if value3 == true {
            bookmarkSelected3.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            bookmarkSelected3.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
        
        if value4 == true {
            bookmarkSelected4.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            bookmarkSelected4.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
        
        if value5 == true {
            bookmarkSelected5.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            bookmarkSelected5.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
        
        if value6 == true {
            bookmarkSelected6.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            bookmarkSelected6.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func bookmarkTapped1(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key1 = "bookmark|" + "BigStuff|" + "MoldMoisture1"
        var existingAnswer = defaults.object(forKey:key1) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key1)
            UserDefaults.standard.synchronize()
            bookmarkSelected1.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key1)
            UserDefaults.standard.synchronize()
            
            bookmarkSelected1.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
        
    }
    
    @IBAction func bookmarkTapped2(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key2 = "bookmark|" + "BigStuff|" + "MoldMoisture2"
        var existingAnswer = defaults.object(forKey:key2) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key2)
            UserDefaults.standard.synchronize()
            bookmarkSelected2.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key2)
            UserDefaults.standard.synchronize()
            
            bookmarkSelected2.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
    }
    
    @IBAction func bookmarkTapped3(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key3 = "bookmark|" + "BigStuff|" + "MoldMoisture3"
        var existingAnswer = defaults.object(forKey:key3) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key3)
            UserDefaults.standard.synchronize()
            bookmarkSelected3.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key3)
            UserDefaults.standard.synchronize()
            
            bookmarkSelected3.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
    }
    
    @IBAction func bookmarkTapped4(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key4 = "bookmark|" + "BigStuff|" + "MoldMoisture4"
        var existingAnswer = defaults.object(forKey:key4) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key4)
            UserDefaults.standard.synchronize()
            bookmarkSelected4.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key4)
            UserDefaults.standard.synchronize()
            
            bookmarkSelected4.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
    }
    
    @IBAction func bookmarkTapped5(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key5 = "bookmark|" + "BigStuff|" + "MoldMoisture5"
        var existingAnswer = defaults.object(forKey:key5) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key5)
            UserDefaults.standard.synchronize()
            bookmarkSelected5.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key5)
            UserDefaults.standard.synchronize()
            
            bookmarkSelected5.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
    }
    
    @IBAction func bookmarkTapped6(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key6 = "bookmark|" + "BigStuff|" + "MoldMoisture6"
        var existingAnswer = defaults.object(forKey:key6) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key6)
            UserDefaults.standard.synchronize()
            bookmarkSelected6.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key6)
            UserDefaults.standard.synchronize()
            
            bookmarkSelected6.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
    }
    
    
}
