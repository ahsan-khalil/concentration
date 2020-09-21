//
//  ViewController.swift
//  Concentration
//
//  Created by AhsanKhalil on 21/09/2020.
//  Copyright © 2020 AhsanKhalil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var FlipCountLabel: UILabel!
    
    var FlipCount = 0 {
        didSet{
            FlipCountLabel.text = "Flip : \(FlipCount)"
        }
    }
    
    @IBAction func CardClick(_ sender: UIButton) {
        
    }
    
    
}

