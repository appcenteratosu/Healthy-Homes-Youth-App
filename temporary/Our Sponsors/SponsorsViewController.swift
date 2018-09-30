//
//  SponsorsViewController.swift
//  temporary
//
//  Created by apple on 15/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class SponsorsViewController: UIViewController {
    
    @IBOutlet var rightIconButtons: [UIButton]!
    
    @IBOutlet var leftIconButtons: [UIButton]!
    
    @IBOutlet weak var sponsor1: UIButton!
    
    @IBOutlet weak var sponsor2: UIButton!
    
    @IBOutlet weak var sponsor3: UIButton!
    
    @IBOutlet weak var sponsor4: UIButton!
    
    @IBOutlet weak var sponsor5: UIButton!
    
    @IBOutlet weak var sponsor6: UIButton!
    
    @IBOutlet weak var MainMenu: UIButton!
    
    @IBAction func ReturnSponsorsToMainMenu(_ sender: Any) {
        performSegue(withIdentifier: "UnwindSponsorsToMainMenu", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = UIScreen.main.bounds
        
        if frame.height > 850 && frame.width > 450  {
            MainMenu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
        }
        else
        {
            MainMenu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
 
        for button in leftIconButtons {
            if frame.height > 850 && frame.width > 450  {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 25)
                button.contentHorizontalAlignment = .center
                button.contentEdgeInsets = UIEdgeInsetsMake(5,5,5,5)
            }
            else
            {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 11)
                button.contentEdgeInsets = UIEdgeInsetsMake(5,5,5,5)
            }
        }
        
        for button in rightIconButtons {
            if frame.height > 850 && frame.width > 450  {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 25)
                button.contentHorizontalAlignment = .center
                button.contentEdgeInsets = UIEdgeInsetsMake(5,5,5,5)
            }
            else
            {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 11)
                button.contentEdgeInsets = UIEdgeInsetsMake(5,5,5,5)
            }
        }

        sponsor1.setTitle("US DEPARTMENT OF HOUSING", for: UIControlState.normal)
       
        sponsor2.setTitle("EQUAL HOUSING OPPORTUNITY", for: UIControlState.normal)
        
        sponsor3.setTitle("HEALTHY HOMES PARTNERSHIP", for: UIControlState.normal)
        
        sponsor4.setTitle("OFFICE OF LEAD HAZARD CONTROL", for: UIControlState.normal)
        
        sponsor5.setTitle("US DEPARTMENT OF AGRICULTURE", for: UIControlState.normal)
        
        sponsor6.setTitle("OKLAHOMA STATE APP CENTER", for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstSponsorButtonTapped(_ sender: Any) {
        
        UIApplication.shared.openURL(URL(string: "https://www.hud.gov/")!)
    }
    
    @IBAction func secondSpaonsorButtonTapped(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.hud.gov/program_offices/fair_housing_equal_opp")!)
    }
    
    @IBAction func thirdSponsorButtonTapped(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://extensionhealthyhomes.org/")!)
    }
    
    @IBAction func fourthSponsorButtonTapped(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.hud.gov/healthyhomes")!)
    }
    
    @IBAction func fifthSponsorButtonTapped(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.usda.gov/")!)
    }
    
    @IBAction func sixthSponsorButtonTapped(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://appcenter.okstate.edu/")!)
    }
    
}
