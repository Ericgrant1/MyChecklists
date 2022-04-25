//
//  ViewController.swift
//  MyChecklists
//
//  Created by Eric Grant on 08.04.2022.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
    var checkList: Checklist!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        title = checkList.name
    }
    
    // MARK: - Navigation
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
            
            if let indexPath = tableView.indexPath(
                for: sender as! UITableViewCell) {
                controller.itemToEdit = checkList.items[indexPath.row]
            }
        }
    }
    
    // MARK: - Table View Data Source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return checkList.items.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        let item = checkList.items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmarks(for: cell, with: item)
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        checkList.items.remove(at: indexPath.row)
        
        let indexPath = [indexPath]
        tableView.deleteRows(at: indexPath, with: .automatic)
        
    }
    
    // MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = checkList.items[indexPath.row]
            item.checked.toggle()
            
            configureCheckmarks(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK: - Add Item ViewController Delegates
    func itemDetailViewControllerDidCancel(
        _ controller: ItemDetailViewController
    ) {
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(
        _ controller: ItemDetailViewController,
        didFinishAdding item: CheckListItem
    ) {
        let newRowIndex =  checkList.items.count
        checkList.items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func itemDetailViewController(
        _ controller: ItemDetailViewController,
        didFinishEditing item: CheckListItem
    ) {
        if let index = checkList.items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    func configureText(
        for cell: UITableViewCell,
        with item: CheckListItem
    ) {
        let label = cell.viewWithTag(1000) as! UILabel
        // label.text = item.text
        label.text = "\(item.itemID): \(item.text)"
    }
    
    func configureCheckmarks(
        for cell: UITableViewCell,
        with item: CheckListItem
    ) {
        let label = cell.viewWithTag(1001) as! UILabel
       
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
}

