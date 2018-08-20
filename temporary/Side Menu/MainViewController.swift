//
//  MainViewController.swift
//  temporary
//
//  Created by osuappcenter on 8/5/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var delegate: CenterViewControllerDelegate?
    
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    @IBOutlet var MainButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MenuButton.image = UIImage(named: "hamburger menu")
        
        for eachbutton in MainButtons {
            eachbutton.titleLabel?.textAlignment = .center
            eachbutton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            eachbutton.titleLabel?.adjustsFontSizeToFitWidth = true
            eachbutton.layer.cornerRadius = 5
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MenuButton(_ sender: UIBarButtonItem) {
        delegate?.toggleRightPanel?()
    }
    
    
    
}
