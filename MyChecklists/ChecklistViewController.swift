//
//  ViewController.swift
//  MyChecklists
//
//  Created by Eric Grant on 08.04.2022.
//

import UIKit

class ChecklistViewController: UITableViewController  {
    var items = [CheckListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = CheckListItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = CheckListItem()
        item2.text = "Read book"
        item2.checked = true
        items.append(item2)
        
        let item3 = CheckListItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = CheckListItem()
        item4.text = "Programming practice"
        items.append(item4)
        
        let item5 = CheckListItem()
        item5.text = "Eat ice cream"
        item5.checked = true
        items.append(item5)
        
        let item6 = CheckListItem()
        item6.text = "Go to the gym"
        items.append(item6)
        
        let item7 = CheckListItem()
        item7.text = "Watch the Halo"
        item7.checked = true
        items.append(item7)
    }
    
    // MARK: - Table View Data Source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return items.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        let item = items[indexPath.row]
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = item.text
        configureCheckmarks(for: cell, at: indexPath)
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            
            configureCheckmarks(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmarks(
        for cell: UITableViewCell,
        at indexPath: IndexPath) {
            
            let item = items[indexPath.row]

            if item.checked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
    }
}

