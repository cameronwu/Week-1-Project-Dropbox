//
//  CreateAccountViewController.swift
//  Dropbox
//
//  Created by Cameron Wu on 9/17/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var strengthImageView: UIImageView!
    @IBOutlet weak var createView: UIView!
    
    @IBAction func BackToWelcomeButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createButton.enabled = false
        firstNameField.becomeFirstResponder()
        createView.hidden = true
        createView.alpha = 0.0
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Check if fields are empty and enable the Create button when they are not.
    func checkFields() {
        if ((firstNameField.text != "") && (lastNameField.text != "") && (emailField.text != "") && (passwordField.text != "")) {
            // print("Fields are filled!")
            createButton.enabled = true
        } else {
            createButton.enabled = false
        }
    }
    
    func checkPasswordStrength() {
        if (passwordField.text!.isEmpty) {
            // Hide image
            strengthImageView.hidden = true
        } else if ((passwordField.text!.characters.count > 0) && (passwordField.text!.characters.count <= 2)) {
            // Weak
            strengthImageView.hidden = false
            strengthImageView.image = UIImage(named: "password_weak")
        } else if ((passwordField.text!.characters.count > 2) && (passwordField.text!.characters.count <= 6)) {
            // So-so
            strengthImageView.hidden = false
            strengthImageView.image = UIImage(named: "password_so-so")
        } else if ((passwordField.text!.characters.count > 6) && (passwordField.text!.characters.count <= 10)) {
            // Good
            strengthImageView.hidden = false
            strengthImageView.image = UIImage(named: "password_good")
        } else if (passwordField.text!.characters.count > 10) {
            // Great
            strengthImageView.hidden = false
            strengthImageView.image = UIImage(named: "password_great")
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func firstNameField(sender: AnyObject) {
        checkFields()
    }
    
    @IBAction func lastNameField(sender: AnyObject) {
        checkFields()
    }
    
    @IBAction func emailField(sender: AnyObject) {
        checkFields()
    }
    @IBAction func passwordField(sender: AnyObject) {
        checkFields()
        checkPasswordStrength()
    }

    @IBAction func createButtonTouchUpInside(sender: AnyObject) {
        view.endEditing(true)
        UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseOut, animations: {
            self.createView.hidden = false
            self.createView.alpha = 1.0
            }, completion: {
                finished in
                print("Create menu open.")
        })
    }
    
}
