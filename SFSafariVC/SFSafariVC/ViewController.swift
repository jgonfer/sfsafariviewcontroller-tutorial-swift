//
//  ViewController.swift
//  SFSafariVC
//
//  Created by jgonzalez on 22/3/17.
//  Copyright © 2017 jgonfer. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    private var urlString:String = "https://www.w3schools.com/js/tryit.asp?filename=tryjs_cookie_username"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openSFSafariViewController(_ sender: UIButton) {
        let svc = SFSafariViewController(url: NSURL(string: self.urlString)! as URL)
        present(svc, animated: true, completion: nil)
    }
}
