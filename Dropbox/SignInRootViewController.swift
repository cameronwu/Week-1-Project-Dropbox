//
//  SignInRootViewController.swift
//  Dropbox
//
//  Created by Cameron Wu on 9/17/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class SignInRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegueWithIdentifier("SignInSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
