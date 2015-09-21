//
//  WelcomeViewController.swift
//  Dropbox
//
//  Created by Cameron Wu on 9/19/15.
//  Copyright © 2015 Cameron Wu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var WelcomeScrollView: UIScrollView!
    @IBOutlet weak var WelcomePageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        WelcomeScrollView.contentSize = CGSize(width: 960, height: 568)
        WelcomeScrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page: Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        WelcomePageControl.currentPage = page
    }

}