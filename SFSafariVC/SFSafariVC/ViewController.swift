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
    @IBOutlet weak var openButton: UIButton!
    
    private var urlString:String = "https://www.w3schools.com/js/tryit.asp?filename=tryjs_cookie_username"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        openButton.backgroundColor = .orange
        openButton.layer.cornerRadius = 10
        openButton.setTitleColor(.white, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openSFSafariViewController(_ sender: UIButton) {
        let svc = SFSafariViewController(url: NSURL(string: self.urlString)! as URL)
        if #available(iOS 10.0, *) {
            // The color to tint the background of the navigation bar and the toolbar.
            svc.preferredBarTintColor = .orange
            // The color to tint the the control buttons on the navigation bar and the toolbar.
            svc.preferredControlTintColor = .white
        } else {
            // Fallback on earlier versions
        }
        present(svc, animated: true, completion: nil)
    }
}

extension ViewController: SFSafariViewControllerDelegate {
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        //Tells the delegate that the initial URL load completed.
    }
    
    func safariViewController(_ controller: SFSafariViewController, activityItemsFor URL: URL, title: String?) -> [UIActivity] {
        //Tells the delegate that the user tapped an Action button.
        return []
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        //Tells the delegate that the user dismissed the view.
    }
}
