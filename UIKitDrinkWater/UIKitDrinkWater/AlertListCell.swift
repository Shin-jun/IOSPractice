//
//  AlertListCell.swift
//  UIKitDrinkWater
//
//  Created by Shin yongjun on 2022/10/16.
//

import UIKit
import UserNotifications

class AlertListCell: UITableViewCell {
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var alertSwitch: UISwitch!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data, var alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return }
        
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alerts")
        
        if sender.isOn {
            userNotificationCenter.addNotificationRequest(by: alerts[sender.tag])
        } else {
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[sender.tag].id])
        }
    }
    
}
