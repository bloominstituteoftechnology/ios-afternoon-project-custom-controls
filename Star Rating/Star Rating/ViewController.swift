//
//  ViewController.swift
//  Star Rating
//
//  Created by Jon Bash on 2019-11-07.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        let starText = ratingControl.value == 1 ? "star" : "stars"
        title = "User Rating: \(ratingControl.value) \(starText)"
    }
    
}

