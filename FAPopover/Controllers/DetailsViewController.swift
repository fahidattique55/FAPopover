//
//  DetailsViewController.swift
//  FAPopover
//
//  Created by fahid.attique on 16/12/2019.
//  Copyright © 2019 fahid.attique. All rights reserved.
//

import UIKit

class DetailsViewController: UITableViewController, PopoverPresentable {
    
    func preferredContentsizeForPopover() -> CGSize { CGSize(width: 350, height: 300) }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.preferredContentSize = preferredContentsizeForPopover()
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goBack(_ sender: Any) {
        navigationController?.preferredContentSize = (navigationController?.viewControllers.first as! PopoverPresentable).preferredContentsizeForPopover()
        navigationController?.popViewController(animated: true)
    }
}
