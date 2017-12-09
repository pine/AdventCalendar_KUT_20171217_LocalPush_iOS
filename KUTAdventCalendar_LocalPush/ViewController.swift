//
//  ViewController.swift
//  KUTAdventCalendar_LocalPush
//
//  Created by Pine Mizune on 2017/12/09.
//  Copyright © 2017 Pine Mizune. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func notifyTapped(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "れんちょんからのお知らせ"
        content.body = "にゃんぱすー"
        content.sound = UNNotificationSound.default()
        
        if let path = Bundle.main.path(forResource: "Renchon", ofType: "jpg") {
            content.attachments = [try! UNNotificationAttachment(identifier: "renchon", url: URL(fileURLWithPath: path), options: nil)]
        }
        
        let request = UNNotificationRequest(identifier: "immediately", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @IBAction func nofityLaterTapped(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "れんちょんからのお知らせ"
        content.body = "もう朝なのん"
        content.sound = UNNotificationSound.default()
        
        if let path = Bundle.main.path(forResource: "Renchon", ofType: "jpg") {
            content.attachments = [try! UNNotificationAttachment(identifier: "renchon", url: URL(fileURLWithPath: path), options: nil)]
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "later", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

