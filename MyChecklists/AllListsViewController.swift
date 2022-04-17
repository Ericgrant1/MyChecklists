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

    // MARK: - Table view data source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 3
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "List \(indexPath.row)"
        cell.contentConfiguration = content
        return cell
    }

    // MARK: - Table view delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        performSegue(withIdentifier: "ShowChecklist", sender: nil)
    }
}
