//
//  DetailsViewController.swift
//  Json-Serlization
//
//  Created by KARIM on 2/24/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {

    var webView:WKWebView!
    var detailItem: String?
    
    
    override func loadView() {
        webView = WKWebView()
        view = webView
        
        //instantiate the html that will present the content
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        
    }
    


}
