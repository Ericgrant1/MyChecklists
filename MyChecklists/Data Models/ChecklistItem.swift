//
//  ChecklistItem.swift
//  MyChecklists
//
//  Created by Eric Grant on 09.04.2022.
//

import Foundation
import UserNotifications

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
    
    deinit {
        removeNotification()
    }
    
    func scheduleNotification() {
        removeNotification()
        if shouldRemind && dueData > Date() {
            
            let content = UNMutableNotificationContent()
            content.title = "Reminder:"
            content.body = text
            content.sound = UNNotificationSound.default
            
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents(
                [.year, .month, .day, .hour, .minute],
                from: dueData)
            
            let trigger = UNCalendarNotificationTrigger(
                dateMatching: components,
                repeats: false)
            
            let request = UNNotificationRequest(
                identifier: "\(itemID)",
                content: content,
                trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled: \(request) for itemID: \(itemID)")
        }
    }
    
    func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
}
