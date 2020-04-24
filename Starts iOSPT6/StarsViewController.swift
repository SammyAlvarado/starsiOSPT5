//
//  StarsViewController.swift
//  Starts iOSPT6
//
//  Created by Sammy Alvarado on 4/23/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController, UITableViewDataSource {

    // Mark: IBOutlest
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    
    let starController = StarsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Mark: IBActions
    @IBAction func printButtonTapped(_ sender: Any) {
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        guard let starName = nameTextField.text,
            let distanceInLightyears = distanceTextField.text,
            let distance = Double(distanceInLightyears),
            !starName.isEmpty else { return }
        
        starController.createStar(with: starName, distance: distance)
        self.tableView.reloadData()
        
    }
    // Mark: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starController.stars.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "StarCell") as? StartTableViewCell else { return UITableViewCell() }
        let star = starController.stars[indexPath.row]
        cell.star = star
        return cell
    }
        


}

class StartTableViewCell: UITableViewCell {
    // Mark: IBOutlest

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var star: Star? {
        didSet {
            self.updateViews()
        }
    }
    
    func updateViews() {
        guard let star = star else { return }
        nameLabel.text = star.name
        distanceLabel.text = "\(star.distance) Light years away"
    }
    
    
}

