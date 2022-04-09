//
//  ViewController.swift
//  MyChecklists
//
//  Created by Eric Grant on 08.04.2022.
//

import UIKit

class ChecklistViewController: UITableViewController  {
    
    var row0item = CheckListItem()
    var row1item = CheckListItem()
    var row2item = CheckListItem()
    var row3item = CheckListItem()
    var row4item = CheckListItem()
    
//    let row0text = "Walk the dog"
//    let row1text = "Brush teeth"
//    let row2text = "Learn iOS development"
//    let row3text = "Soccer practice"
//    let row4text = "Eat ice cream"

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
            label.text = row0item.text
        } else if indexPath.row == 1 {
            label.text = row1item.text
        } else if indexPath.row == 2 {
            label.text = row2item.text
        } else if indexPath.row == 3 {
            label.text = row3item.text
        } else if indexPath.row == 4 {
            label.text = row4item.text
        }
        
        configureCheckmarks(for: cell, at: indexPath)
        
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                row0item.checked.toggle()
            } else if indexPath.row == 1 {
                row1item.checked.toggle()
            } else if indexPath.row == 2 {
                row2item.checked.toggle()
            } else if indexPath.row == 3 {
                row3item.checked.toggle()
            } else if indexPath.row == 4 {
                row4item.checked.toggle()
            }
            
            configureCheckmarks(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmarks(
        for cell: UITableViewCell,
        at indexPath: IndexPath) {
            var isChecked = false
            
            if indexPath.row == 0 {
                isChecked = row0item.checked
            } else if indexPath.row == 1 {
                isChecked = row1item.checked
            } else if indexPath.row == 2 {
                isChecked = row2item.checked
            } else if indexPath.row == 3 {
                isChecked = row3item.checked
            } else if indexPath.row == 4 {
                isChecked = row4item.checked
            }

            if isChecked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
    }
}

