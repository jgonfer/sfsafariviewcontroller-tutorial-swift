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
    @IBOutlet weak var openBrowserButton: UIButton!
    @IBOutlet weak var openReaderButton: UIButton!
    
    private var urlString:String = "https://www.w3schools.com/js/tryit.asp?filename=tryjs_cookie_username"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        openBrowserButton.backgroundColor = .orange
        openBrowserButton.layer.cornerRadius = 10
        openBrowserButton.setTitleColor(.white, for: .normal)
        openReaderButton.backgroundColor = .blue
        openReaderButton.layer.cornerRadius = 10
        openReaderButton.setTitleColor(.white, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func openBrowser(withReaderMode readerMode: Bool) {
        let svc = SFSafariViewController(url: NSURL(string: self.urlString)! as URL, entersReaderIfAvailable: readerMode)
        // You can also init the view controller with the SFSafariViewController:url: method
        svc.delegate = self
        if #available(iOS 10.0, *) {
            // The color to tint the background of the navigation bar and the toolbar.
            svc.preferredBarTintColor = readerMode ? .blue : .orange
            // The color to tint the the control buttons on the navigation bar and the toolbar.
            svc.preferredControlTintColor = .white
        } else {
            // Fallback on earlier versions
        }
        present(svc, animated: true, completion: nil)
    }

    @IBAction func openInAppBrowser(_ sender: UIButton) {
        openBrowser(withReaderMode: false)
    }
    
    @IBAction func openReaderMode(_ sender: UIButton) {
        openBrowser(withReaderMode: true)
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
