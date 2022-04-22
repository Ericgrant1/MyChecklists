//
//  IconPickerViewController.swift
//  MyChecklists
//
//  Created by Eric Grant on 22.04.2022.
//

import UIKit

protocol IconPickerViewControllerDelegate: AnyObject {
    func IconPicker(
        _ picker: IconPickerViewController,
        didPick iconName: String)
}

class IconPickerViewController: UITableViewController {
    weak var delegate: IconPickerViewControllerDelegate?
    let icons = [
      "No Icon", "Appointments", "Birthdays", "Chores",
      "Drinks", "Folder", "Groceries", "Inbox", "Photos", "Trips"
    ]
    
    //MARK: - Table View Data Source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return icons.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "IconCell",
            for: indexPath)
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        return cell
    }
}
