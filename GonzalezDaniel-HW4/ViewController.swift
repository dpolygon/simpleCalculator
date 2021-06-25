//
//  ViewController.swift
//  GonzalezDaniel-HW4
//
//  Created by Daniel Gonzalez on 6/23/21.
//

import UIKit

var supportedOperations = ["Add", "Subtract", "Multiply", "Divide"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supportedOperations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoCell", for: indexPath as IndexPath)
        let row = indexPath.row
        cell.textLabel?.text = supportedOperations[row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

