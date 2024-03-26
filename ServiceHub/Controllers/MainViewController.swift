//
//  MainViewController.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//
import UIKit
import UIView_Shimmer

class MainViewController: UIViewController {
    
    var count = 1
    var mainView:MainView {return self.view as! MainView}
    var source = [MyService]()

    override func viewDidLoad() {
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        fetchData()
        mainView.tableView.register(CellConfig.self, forCellReuseIdentifier: "\(CellConfig.self)")
    }
    
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellConfig.self)", for: indexPath) as? CellConfig else {
            return UITableViewCell()
        }
        

        cell.backgroundColor = .colourForCell
        cell.layer.cornerRadius = 12
        
        if self.source.isEmpty {
            cell.firstLabel.text = LoadingText.firstText.rawValue
            cell.secondLabel.text = LoadingText.secondText.rawValue
        }
        
        cell.shimmerLayer.isHidden = false
        cell.firstLabel.text = self.source[indexPath.item].name
        cell.secondLabel.text = self.source[indexPath.item].title
        
        if !self.source.isEmpty {
            let url = URL(string: self.source[indexPath.item].image)
            
            DispatchQueue.global().async {
                if let url = url, let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        if let cellToUpdate = tableView.cellForRow(at: indexPath) as? CellConfig {
                            cell.shimmerLayer.isHidden = true
                            cellToUpdate.firstImageView.image = UIImage(data: data)
                        }
                    }
                    
                }
                
            }
        }
        
        return cell
    }

}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = self.source[indexPath.row].link
        guard let url = URL(string: urlString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension MainViewController {
    func fetchData() {
        let networkManager = NetworkManager.shared
        Source(networkManager: networkManager).requestForCollection { myArray in
            if let myArray = myArray{
                if self.count == 1 {
                    self.source = myArray
                    self.count -= 1
                    DispatchQueue.main.async {
                        self.mainView.tableView.reloadData()
                    }
                }
            }
        }
    }
}

enum LoadingText: String {
    case firstText = "Loading ..."
    case secondText = "Plz, wait ..."
}
