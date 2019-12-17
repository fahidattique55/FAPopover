//
//  TestTableViewController.swift
//  FAPopover
//
//  Created by fahid.attique on 13/12/2019.
//  Copyright © 2019 fahid.attique. All rights reserved.
//

import UIKit

class TestTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PopoverPresentable {

    func preferredContentsizeForPopover() -> CGSize { return CGSize(width: 200, height: 200) }

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.preferredContentSize = preferredContentsizeForPopover()
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Functions

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }

        cell?.textLabel?.text = "Row - \(indexPath.row + 1)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetails", sender: self)
    }
}
