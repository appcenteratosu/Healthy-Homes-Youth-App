//
//  SponsorsViewController.swift
//  temporary
//
//  Created by apple on 15/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class SponsorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstSponsorButtonTapped(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.hud.gov/")!)
    }
    
    @IBAction func secondSpaonsorButtonTapped(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "")!)
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
