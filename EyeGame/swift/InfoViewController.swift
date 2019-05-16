//
//  InfoViewController.swift
//  EyeGame
//
//  Created by Danyil Zborovskyi on 3/9/19.
//  Copyright © 2019 BlueWolf Development. All rights reserved.
//

import UIKit
import WebKit

class InfoViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Search html file, if TRUE translate to url and make a request from it
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            
            //Load html file to WKWebView
            webView.load(request)
        }
        
    }
    
    //Close button reaction
    @IBAction func closeButton() {
        dismiss(animated: true, completion: nil)
    }

}
