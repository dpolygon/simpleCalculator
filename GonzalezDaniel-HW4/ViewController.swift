//
//  ViewController.swift
//  Project: GonzalezDaniel-HW4
//  EID: Dg37584
//  Course: CS371L
//
//  Created by Daniel Gonzalez on 6/23/21.
//

import UIKit

var supportedOperations = ["Add", "Subtract", "Multiply", "Divide"]
var supportedOperatorSymbols = ["+", "-", "*", "/"]

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculatorSegue", let destination = segue.destination as? calcViewController,
           let selectedRowIndex = tableView.indexPathForSelectedRow?.row {
            destination.operatorSymbol = supportedOperatorSymbols[selectedRowIndex]
        }
    }
}

