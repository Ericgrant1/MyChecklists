//
//  ViewController.swift
//  MyChecklists
//
//  Created by Eric Grant on 08.04.2022.
//

import UIKit

class ChecklistViewController: UITableViewController  {
    
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false
    
    let row0text = "Walk the dog"
    let row1text = "Brush teeth"
    let row2text = "Learn iOS development"
    let row3text = "Soccer practice"
    let row4text = "Eat ice cream"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table View Data Source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 5
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = row0text
        } else if indexPath.row == 1 {
            label.text = row1text
        } else if indexPath.row == 2 {
            label.text = row2text
        } else if indexPath.row == 3 {
            label.text = row3text
        } else if indexPath.row == 4 {
            label.text = row4text
        }
        
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                row0checked = !row0checked
                if row0checked {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
            } else if indexPath.row == 1 {
                row1checked = !row1checked
                if row1checked {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
            } else if indexPath.row == 2 {
                row2checked = !row2checked
                if row2checked {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
            } else if indexPath.row == 3 {
                row3checked = !row3checked
                if row3checked {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
            } else if indexPath.row == 4 {
                row4checked = !row4checked
                if row4checked {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

