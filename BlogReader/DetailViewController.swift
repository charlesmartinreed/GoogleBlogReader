//
//  DetailViewController.swift
//  BlogReader
//
//  Created by Charles Martin Reed on 9/20/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {


    @IBOutlet weak var webView: WKWebView!
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            
            //set the page title
            self.title = detail.value(forKey: "title") as? String
            
            if let blogWebView = self.webView {
                //MARK:- Displaying our content in a web view!
                //base URL not needed as the links are absolute URLs
                blogWebView.loadHTMLString(detail.value(forKey: "content") as! String, baseURL: nil)
            }
                //label.text = detail.timestamp!.description
            
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()

    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

