//
//  firstVC.swift
//  Lucky4D
//
//  Created by Harry Ng on 02/02/2017.
//  Copyright © 2017 Harry Ng. All rights reserved.
//

import UIKit
import UserNotifications

class firstVC: UIViewController {

    @IBOutlet weak var strikeBtn: UIButton!
    @IBOutlet weak var switchBtn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
     
        
    }
    
    
    
    
    func calendarNotification() {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        
        content.title = "Lucky4D"
        content.subtitle = "Your lucky 4D numbers for today is :"
        content.body = String(arc4random_uniform(9999))
        
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 00
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "Lucky4D", content: content, trigger: trigger)
        
        center.add(request)
        
    }

    @IBAction func switchClicked(_ sender: Any) {
        if switchBtn.isOn {
            print("on")
            
            // request notification
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
                if error != nil {
                    print(error!)
                } else {
                    print(success)
                }
            }

            
            self.calendarNotification()
            
            
        } else {
            print("off")
        }

    }
    

   }
