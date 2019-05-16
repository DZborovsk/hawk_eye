//
//  AuthorViewController.swift
//  EyeGame
//
//  Created by Danyil Zborovskyi on 3/15/19.
//  Copyright © 2019 BlueWolf Development. All rights reserved.
//

import UIKit

class AuthorViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Rounded corners
        nameLabel.layer.cornerRadius = 10
        aboutText.layer.cornerRadius = 10
        
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
