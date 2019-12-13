//
//  ViewController.swift
//  FAPopover
//
//  Created by fahid.attique on 13/12/2019.
//  Copyright © 2019 fahid.attique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showPopover(_ sender: UIButton) {
        
        let testViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TestTableViewController")
//        let navVC = UINavigationController(rootViewController: testViewController)
        let sourceRect = sender.bounds
//        FAPopoverViewController.shared.showWith(testViewController, arrow: UIPopoverArrowDirection.up, contentSize: CGSize(width: 200, height: 200), sourceRect: sourceRect, sourceView: sender)
        
        FAPopoverManager.show(testViewController, arrow: .up, contentSize: CGSize(width: 200, height: 200), sourceRect: sourceRect, sourceView: sender)
        
  
//        FAPopoverViewController.shared.showWithAgain(testViewController, arrow: UIPopoverArrowDirection.up, contentSize: CGSize(width: 200, height: 200), sourceRect: sourceRect, sourceView: sender)
        
//        let presentationController = AlwaysPresentAsPopover.configurePresentation(forController: testViewController)
//        presentationController.sourceView = sender
//        presentationController.sourceRect = sender.bounds
//        presentationController.permittedArrowDirections = [.down, .up]
//        self.present(testViewController, animated: true)

    }
    
    @IBAction func showPhonePopover(_ sender: UIBarButtonItem) {
        
                let testViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TestTableViewController")
                FAPopoverViewController.shared.showWithNewStyle(testViewController, arrow: UIPopoverArrowDirection.up, contentSize: CGSize(width: 200, height: 200), sourceView: sender)
    }
}

