//
//  SignInViewController.swift
//  Dropbox
//
//  Created by Cameron Wu on 9/17/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

var isSetupComplete = false

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var troubleView: UIView!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func BackToWelcomeButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.enabled = false
        emailAddressField.becomeFirstResponder()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        troubleView.hidden = true
        troubleView.alpha = 0.0

        
        completeSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Check if fields are empty and enable the Create button when they are not.
    func checkFields() {
        if ((emailAddressField.text != "") && (passwordField.text != "")) {
            // print("Fields are filled!")
            signInButton.enabled = true
        } else {
            signInButton.enabled = false
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func completeSetup() {
        if (!isSetupComplete) {
            defaults.setBool(false, forKey: "isGettingStartedFavorited")
            defaults.synchronize()
            
            isSetupComplete = true
        }
    }

    @IBAction func emailAddressField(sender: AnyObject) {
        checkFields()
    }
    
    @IBAction func passwordField(sender: AnyObject) {
        checkFields()
    }
    
    @IBAction func troubleButtonTouchUpInside(sender: AnyObject) {
        view.endEditing(true)
        UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: {
            self.troubleView.hidden = false
            self.troubleView.alpha = 1.0
            }, completion: {
                finished in
        })
    }
    
    @IBAction func troubleCancelButtonTouchUpInside(sender: AnyObject) {
        UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: {
            self.troubleView.alpha = 0.0
            }, completion: {
                finished in
                self.troubleView.hidden = true
        })
    }
}
