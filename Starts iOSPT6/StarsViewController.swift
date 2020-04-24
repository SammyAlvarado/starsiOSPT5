//
//  StarsViewController.swift
//  Starts iOSPT6
//
//  Created by Sammy Alvarado on 4/23/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {

    // Mark: IBOutlest
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Mark: IBActions
    @IBAction func printButtonTapped(_ sender: Any) {
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
    }
    // Mark: UITableViewDataSource


}

class StartTableViewCell: UITableViewCell {
    // Mark: IBOutlest

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
}

