//
//  ViewController.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//

import UIKit

class MenuViewController: UIViewController {
    var menuView: MenuView {return self.view as! MenuView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
    }
}

