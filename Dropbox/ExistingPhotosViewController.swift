//
//  ExistingPhotosViewController.swift
//  Dropbox
//
//  Created by Cameron Wu on 9/19/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class ExistingPhotosViewController: UIViewController {

    @IBOutlet weak var ExistingPhotosScrollView: UIScrollView!
    @IBOutlet weak var ExistingPhotosImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExistingPhotosScrollView.contentSize = ExistingPhotosImageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
