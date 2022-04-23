//
//  Checklist.swift
//  MyChecklists
//
//  Created by Eric Grant on 17.04.2022.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var iconName = "No Icon"
    var items = [CheckListItem]()
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
}
