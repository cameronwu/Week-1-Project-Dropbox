//
//  GettingStartedDetailViewController.swift
//  Dropbox
//
//  Created by Cameron Wu on 9/19/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class GettingStartedDetailViewController: UIViewController {

    @IBOutlet weak var GettingStartedScrollView: UIScrollView!
    @IBOutlet weak var GettingStartedImageView: UIImageView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var darkenView: UIView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var isMenuOpen = false
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GettingStartedScrollView.contentSize = GettingStartedImageView.image!.size
        
        darkenView.hidden = true
        darkenView.alpha = 0.0
        menuView.frame.origin.y = -277
    }
    
    override func viewDidAppear(animated: Bool) {
        // If isGettingStartedFavorited is true, display the button
        if (defaults.boolForKey("isGettingStartedFavorited")) {
            favoriteImageView.hidden = false
        // If isGettingStartedFavorited is false, hide the button
        } else if (!defaults.boolForKey("isGettingStartedFavorited")) {
            favoriteImageView.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackToFilesButton(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
    }
    
    // Open/close menu on button touch
    @IBAction func menuButtonTouchUpInside(sender: AnyObject) {
        if (!isMenuOpen) {
            openMenu()
            isMenuOpen = true
        } else {
            closeMenu()
            isMenuOpen = false
        }
    }
    
    // Open menu
    func openMenu() {
        UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: {
            self.menuView.frame.origin.y = 64
            self.darkenView.hidden = false
            self.darkenView.alpha = 1.0
            }, completion: {
                finished in
                print("Detail menu open.")
        })
    }
    
    // Close menu
    func closeMenu() {
        UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: {
            self.menuView.frame.origin.y = -277
            self.darkenView.alpha = 0.0
            }, completion: {
                finished in
                self.darkenView.hidden = true
                print("Detail menu closed.")
        })
    }
    
    // Favorite button on touch down
    @IBAction func favoriteButtonTouchDown(sender: AnyObject) {
        favoriteButton.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
    }
    
    // Favorite button on touch up
    @IBAction func favoriteButtonTouchUpInside(sender: AnyObject) {
        favoriteButton.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        
        // If isGettingStartedFavorited is false, make it true
        if (!defaults.boolForKey("isGettingStartedFavorited")) {
            favoriteImageView.hidden = false
            defaults.setBool(true, forKey: "isGettingStartedFavorited")
            defaults.synchronize()
        // If isGettingStartedFavorited is true, make it false
        } else {
            favoriteImageView.hidden = true
            defaults.setBool(false, forKey: "isGettingStartedFavorited")
            defaults.synchronize()
        }
        
    }
    
}
