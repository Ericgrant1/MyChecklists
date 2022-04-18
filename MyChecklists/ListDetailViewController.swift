//
//  ListDetailViewController.swift
//  MyChecklists
//
//  Created by Eric Grant on 18.04.2022.
//

import UIKit

protocol ListDetailViewControllerDelegate: AnyObject {
    func listDetailViewControllerDidCancel(
        _ controller: ListDetailViewController)
    
    func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishAdding checklist: Checklist)
    
    func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    var checklistToEdit: Checklist?
}
