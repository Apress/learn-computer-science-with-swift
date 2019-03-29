//
//  FirstViewController.swift
//  Tabs
//
//  Created by Jesse Feiler on 9/21/17.
//  Copyright © 2017 ChamplainArts. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var button: UIButton!
  @IBAction func buttonAction(_ sender: Any) {
    label.text = "Button Tapped"
  }
  @IBAction func notificationButtonAction(_ sender: Any) {
    NotificationCenter.default.post(name: Notification.Name(rawValue:notificationKey), object: nil, userInfo: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
