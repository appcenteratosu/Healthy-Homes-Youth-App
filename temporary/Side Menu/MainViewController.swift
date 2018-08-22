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
    @IBOutlet var MainButtons: [UIButton]!

    @IBOutlet weak var MenuBarNavigationItem: UINavigationItem!
    
    @IBOutlet weak var menuButtonSelected: UIButton!
    
    @IBOutlet weak var TitleImage: UIImageView!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var TitleView: UIView!
    @IBAction func returnMainMenu(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

  //      MenuButton.image = UIImage(named: "hamburger menu")
        
        for eachbutton in MainButtons {
            eachbutton.titleLabel?.textAlignment = .center
            eachbutton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
            eachbutton.titleLabel?.adjustsFontSizeToFitWidth = true
            eachbutton.layer.cornerRadius = 5
        }

        let barButton = UIBarButtonItem(customView: menuButtonSelected)
//        //assign button to navigationbar
        
        self.navigationItem.titleView = TitleView
        self.navigationItem.rightBarButtonItem = barButton
  //      self.navigationItem.titleView = TitleLabel
        
    
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2745098039, green: 0.8156862745, blue: 0.9921568627, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MenuButton(_ sender: UIButton) {
        delegate?.toggleRightPanel?()
    }
    
    

}
