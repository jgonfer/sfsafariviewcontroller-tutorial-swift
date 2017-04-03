//
//  ViewController.swift
//  SFSafariVC
//
//  Created by jgonzalez on 22/3/17.
//  Copyright © 2017 jgonfer. All rights reserved.
//

import UIKit
import SafariServices

let deepLinkingNotification = "deep_linking"

class ViewController: UIViewController {
    @IBOutlet weak var openBrowserButton: UIButton!
    @IBOutlet weak var openReaderButton: UIButton!
    @IBOutlet weak var openDeepLinking: UIButton!
    
    private var urlInAppBrowser:String = "https://www.w3schools.com/js/tryit.asp?filename=tryjs_cookie_username"
    private var urlDeepLinking:String = "https://jgonfer.com/misc/deep_linking.php"
    
    let orange = UIColor(red:0.91, green:0.66, blue:0.29, alpha:1.00)
    let blue = UIColor(red:0.04, green:0.69, blue:0.87, alpha:1.00)
    let green = UIColor(red:0.54, green:0.82, blue:0.30, alpha:1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        openBrowserButton.backgroundColor = orange
        openBrowserButton.layer.cornerRadius = 10
        openBrowserButton.setTitleColor(.white, for: .normal)
        openReaderButton.backgroundColor = blue
        openReaderButton.layer.cornerRadius = 10
        openReaderButton.setTitleColor(.white, for: .normal)
        openDeepLinking.backgroundColor = green
        openDeepLinking.layer.cornerRadius = 10
        openDeepLinking.setTitleColor(.white, for: .normal)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func openBrowser(withReaderMode readerMode: Bool) {
        openInAppSafariBrowser(url: self.urlInAppBrowser, color: readerMode ? blue : orange, reader: readerMode)
    }
    
    fileprivate func openInAppSafariBrowser(url: String, color: UIColor, reader: Bool) {
        let svc = SFSafariViewController(url: NSURL(string: url)! as URL, entersReaderIfAvailable: reader)
        // You can also init the view controller with the SFSafariViewController:url: method
        svc.delegate = self
        if #available(iOS 10.0, *) {
            // The color to tint the background of the navigation bar and the toolbar.
            svc.preferredBarTintColor = color
            // The color to tint the the control buttons on the navigation bar and the toolbar.
            svc.preferredControlTintColor = .white
        } else {
            // Fallback on earlier versions
        }
        if color == green {
            NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: deepLinkingNotification), object: nil, queue: nil) { (_) in
                // Dismiss the In-app Browser (SFSafariViewController) when the user taps a Deep Linking button 👌
                svc.dismiss(animated: true, completion: nil)
            }
        }
        present(svc, animated: true, completion: nil)
    }

    @IBAction func openInAppBrowser(_ sender: UIButton) {
        openBrowser(withReaderMode: false)
    }
    
    @IBAction func openReaderMode(_ sender: UIButton) {
        openBrowser(withReaderMode: true)
    }
    
    @IBAction func openDeepLinking(_ sender: UIButton) {
        openInAppSafariBrowser(url: self.urlDeepLinking, color: green, reader: false)
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
