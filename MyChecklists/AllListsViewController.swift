//
//  AllListsViewController.swift
//  MyChecklists
//
//  Created by Eric Grant on 17.04.2022.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    let cellIdentifier = "ChecklistCell"
    var lists = [Checklist]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
        
        var list = Checklist(name: "Birthdays")
        lists.append(list)

        list = Checklist(name: "Groceries")
        lists.append(list)

        list = Checklist(name: "Cool Apps")
        lists.append(list)

        list = Checklist(name: "To Do")
        lists.append(list)
    }
    
    //MARK: - Navigation
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?) {
            if segue.identifier == "ShowChecklist" {
                let controller = segue.destination as! ChecklistViewController
                controller.checkList = sender as? Checklist
            }
    }

    // MARK: - Table View Data Source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return lists.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath)
        var content = cell.defaultContentConfiguration()
        let checkList = lists[indexPath.row]
        content.text = checkList.name
        cell.contentConfiguration = content
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }

    // MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let checkList = lists[indexPath.row]
        performSegue(
            withIdentifier: "ShowChecklist",
            sender: checkList)
    }
}
