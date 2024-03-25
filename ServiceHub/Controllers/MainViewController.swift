//
//  MainViewController.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }
}
