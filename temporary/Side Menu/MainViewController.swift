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
    
    // Declaration of UI Objects
    @IBOutlet var MainButtons: [UIButton]!
    @IBOutlet weak var menuButtonSelected: UIButton!
    @IBOutlet weak var MainButton1: UIButton!
    @IBOutlet weak var TitleLabel: UILabel!
    
    // unwind segue.
    @IBAction func returnMainMenu(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = UIScreen.main.bounds
        
        // fixing title font for iPhone screens to 12 and iPad screens to 27
            for button in MainButtons {
                if frame.height > 850 && frame.width > 450  {
                    button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
                    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
                }
                else
                {
                    button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
                    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
                }
            }
        
         // fixing title font for iPhone screens to 12 and iPad screens to 27
        if frame.height > 850 && frame.width > 450  {
            MainButton1.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
            MainButton1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        }
        else
        {
            MainButton1.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
            MainButton1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        }
       
        TitleLabel.adjustsFontSizeToFitWidth = true;
        TitleLabel.minimumScaleFactor = 0.5;

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
