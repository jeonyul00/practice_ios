//
//  LinkViewController.swift
//  Books
//
//  Created by 전율 on 11/3/24.
//

import UIKit
import WebKit

class LinkViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    

}
