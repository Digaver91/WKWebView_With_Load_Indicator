//
//  ViewController.swift
//  WKWebViewApp
//
//  Created by Dmytro Gavrylov on 13.11.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view = webView
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.hidesWhenStopped = true
                let barButton = UIBarButtonItem(customView: activityIndicator)
                self.navigationItem.setRightBarButton(barButton, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let url = URL(string: "https://www.yelp.com/search?find_desc=&find_loc=New%20York%2C%20NY")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    func showActivityIndicator(show: Bool) {
            if show {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            showActivityIndicator(show: false)
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            showActivityIndicator(show: true)
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            showActivityIndicator(show: false)
        }
}

