//
//  LibraryViewController.swift
//  mytube
//
//  Created by subrata Samartha on 23/05/23.
//

import UIKit

class LibraryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doResetUserDefaultData(_ sender: Any) {
        UserData.shared.resetUserDefaultData()
    }
    
}
