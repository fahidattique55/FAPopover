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

    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.preferredContentSize = preferredContentsizeForPopover()
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Details"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
    }
}
