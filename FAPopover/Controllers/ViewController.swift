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
    
    @IBAction func showNavigationalPopover(_ sender: UIButton) {
        
        let testViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TestTableViewController")
        let navigationController = UINavigationController(rootViewController: testViewController)
        FAPopoverManager.show(navigationController, arrow: .up, sourceRect: sender.bounds, sourceView: sender)
    }

    @IBAction func showSingleControllerInPopover(_ sender: UIButton) {
        
        let testViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TestTableViewController")
        FAPopoverManager.show(testViewController, arrow: .up, sourceRect: sender.bounds, sourceView: sender)
    }

    @IBAction func showSingleControllerInFromUIBarButtonItem(_ sender: UIBarButtonItem) {
        
        let testViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TestTableViewController")
        let navigationController = UINavigationController(rootViewController: testViewController)
        FAPopoverManager.showFromBarButtonItem(navigationController, arrow: .up, sourceView: sender)
    }
}

