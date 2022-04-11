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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
    // MARK: - Actions
    @IBAction func addItem() {
        let newRowIndex = items.count
        
        let item = CheckListItem()
        item.text = "I'm a new row"
        item.checked = true
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
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
        
        configureText(for: cell, with: item)
        configureCheckmarks(for: cell, with: item)
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        items.remove(at: indexPath.row)
        
        let indexPath = [indexPath]
        tableView.deleteRows(at: indexPath, with: .automatic)
    }
    
    // MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            item.checked.toggle()
            
            configureCheckmarks(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureText(
        for cell: UITableViewCell,
        with item: CheckListItem
    ) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckmarks(
        for cell: UITableViewCell,
        with item: CheckListItem
    ) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}

