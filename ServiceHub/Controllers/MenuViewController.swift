//
//  ViewController.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//

import UIKit

class MenuViewController: UIViewController {
    private var menuView: MenuView {return self.view as! MenuView}
    
    override func viewDidLoad() {
        menuView.onLogBottonAction = {[weak self] in self!.buttonAction()}
    }
    
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
    }
}

extension MenuViewController {
    @objc func buttonAction() {
        let nextController = MainViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
}
