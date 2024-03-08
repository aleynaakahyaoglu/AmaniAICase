//
//  ViewController.swift
//  PeopleList
//
//  Created by Aleyna on 8.03.2024.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var ListButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func ListButtonAction(_ sender: Any) {
        guard let controller = self.storyboard?.instantiateViewController(identifier: "ListController") else {return}
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

