//
//  ViewController.swift
//  print demo
//
//  Created by mhmohamed on 10/30/18.
//  Copyright © 2018 mhmohamed. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var webView : WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        webView.load(URLRequest(url :URL(string: "https://www.google.com")!))
        webView.allowsBackForwardNavigationGestures = true
        webView.reload()
        webView.navigationDelegate = self

    }
    @IBAction func  print (){
        let printController = UIPrintInteractionController.shared
        // 2
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = .general
        printInfo.jobName = "print Job"
        printController.printInfo = printInfo
        printController.printFormatter = webView.viewPrintFormatter()
        printController.present(animated: true, completionHandler: nil)
    }
}

extension ViewController : WKNavigationDelegate {
  
}
