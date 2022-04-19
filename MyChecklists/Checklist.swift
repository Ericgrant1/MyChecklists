//
//  Checklist.swift
//  MyChecklists
//
//  Created by Eric Grant on 17.04.2022.
//

import UIKit

class Checklist: NSObject {
    var name = ""
    var items = [CheckListItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
