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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

