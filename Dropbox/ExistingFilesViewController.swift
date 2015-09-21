//
//  ExistingFilesViewController.swift
//  Dropbox
//
//  Created by Cameron Wu on 9/19/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class ExistingFilesViewController: UIViewController {

    @IBOutlet weak var gettingStartedButton: UIButton!
    @IBOutlet weak var favoriteBadge: UIImageView!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        if (defaults.boolForKey("isGettingStartedFavorited")) {
            // If isGettingStartedFavorited is true, display the badge
            favoriteBadge.hidden = false
        } else {
            // If isGettingStartedFavorited is false, hide the badge
            favoriteBadge.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gettingStartedTouchDown(sender: AnyObject) {
        gettingStartedButton.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
    }
    
    @IBAction func gettingStartedTouchUpInside(sender: AnyObject) {
        gettingStartedButton.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
    }
    

}
