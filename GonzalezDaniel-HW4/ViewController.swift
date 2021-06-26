//
//  ViewController.swift
//  Project: GonzalezDaniel-HW4
//  EID: Dg37584
//  Course: CS371L
//
//  Created by Daniel Gonzalez on 6/23/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supportedOperations.count // number of rows in table view
    }
    
    // return a dequeue reusable cell that will be displayed in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoCell", for: indexPath as IndexPath)
        let row = supportedOperations[indexPath.row]
        cell.textLabel?.text = row["operation"]
        return cell
    }
    
    // deselect row after being selected to remove highlight effect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // during segue pass the operator symbol into destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculatorSegue", let destination = segue.destination as? calcViewController {
            let selectedRow = supportedOperations[tableView.indexPathForSelectedRow!.row]
            destination.operatorSymbol = selectedRow["symbol"]!
        }
    }
}

