//
//  ViewController.swift
//  temporary
//
//  Created by osuappcenter on 8/5/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var window: UIWindow?
    
    @IBOutlet weak var WelcomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let frame = UIScreen.main.bounds
        if frame.height > 850 && frame.width > 450 {
            WelcomeButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
            WelcomeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        }
        else
        {
            WelcomeButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
            WelcomeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func WelcomeButton(_ sender: UIButton) {
        HelloWorld()
    }
    
    func HelloWorld() {
        window = UIWindow(frame: UIScreen.main.bounds)

        let containerViewController = ContainerViewController()
        
        window!.rootViewController = containerViewController

    }
    
}

