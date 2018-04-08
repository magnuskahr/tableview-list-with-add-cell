//
//  TableViewController.swift
//  tableview-list-with-add-cell
//
//  Created by Magnus Jensen on 08/04/2018.
//  Copyright © 2018 Magnus Jensen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var strings = [String]()
    private var addedString = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == strings.count {
            let identifier = addedString ? "textfieldCell" : "addNewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            
            if let inputCell = cell as? TextfieldCell {
                inputCell.resignationHandler = { [weak self, unowned inputCell] in
                    if let text = inputCell.textfield.text {
                        self?.strings.append(text)
                        inputCell.textfield.text = nil
                    }
                    self?.addedString = false
                    self?.tableView.reloadData()
                }
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
            let string = strings[indexPath.row]
            cell.textLabel?.text = string
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == strings.count {
            addedString = !addedString
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let inputCell = cell as? TextfieldCell {
            inputCell.textfield.becomeFirstResponder()
        }
    }
}
