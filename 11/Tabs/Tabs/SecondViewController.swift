//
//  SecondViewController.swift
//  Tabs
//
//  Created by Jesse Feiler on 9/21/17.
//  Copyright © 2017 ChamplainArts. All rights reserved.
//

import UIKit

//extension Notification.Name {
  //static let sliderResultTextNotification = Notification.Name("sliderResultTextNotification")
//}

let notificationKey = "com.champlainarts.notificationKey"

class SecondViewController: UIViewController {
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    NotificationCenter.default.addObserver(self, selector: #selector(SecondViewController.didReceiveNotificationResultText), name: NSNotification.Name(rawValue: notificationKey), object: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @objc func didReceiveNotificationResultText () {
    label.text = "Received Notification"
  }

}

