//
//  PrinciplesofHealthyHomesViewController.swift
//  temporary
//
//  Created by apple on 19/08/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class PrinciplesofHealthyHomesViewController: UIViewController {
    
    @IBOutlet weak var TitleTextView: UITextView!
    
    
    @IBOutlet var MainButtons: [UIButton]!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        TitleTextView.contentInset = UIEdgeInsetsMake(5,5,5,5)
        TitleTextView.adjustsFontForContentSizeCategory = true
        TitleTextView.textAlignment = .center
        TitleTextView.textContainer.maximumNumberOfLines = 2
        
      
        for eachbutton in MainButtons {
            eachbutton.titleEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            
    //        Min font:
            eachbutton.titleLabel?.adjustsFontSizeToFitWidth = true
     //       Corner radius:
            eachbutton.layer.cornerRadius = 5
     //       Alignment:
            eachbutton.titleLabel?.textAlignment = .center
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
