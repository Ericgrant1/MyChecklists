//
//  ChecklistItem.swift
//  MyChecklists
//
//  Created by Eric Grant on 09.04.2022.
//

import Foundation

class CheckListItem: NSObject, Codable {
    var text = ""
    var checked = false
    var dueData = Date()
    var shouldRemind = false
    var itemID = -1
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
}
