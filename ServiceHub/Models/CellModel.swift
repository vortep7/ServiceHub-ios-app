//
//  CellModel.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//

import Foundation

struct MyService {
    var name: String
    var title: String
    var image: String
    var link: String
}

class Source {
    private var name = [String:Double]()
    private var title: String?
    
    var firstArray = [Service.Body.ServiceItem]()
    var myArray = [MyService]()
    var firstFlag = false
    
    let networkManager:NetworkService
    
    //MARK: - DI pattern
    init(networkManager:NetworkService) {
        self.networkManager = networkManager
    }

    func requestForCollection(completion: @escaping ([MyService]?) -> Void) {
        
        try? networkManager.fetchData {result in
            switch result {
            case .success(let data):
                self.firstArray = data.body.services
                self.firstFlag = true
                if self.firstFlag == true{
                    self.tableSource()
                    completion(self.myArray)
                }
            case .failure:
                completion(nil)
            }
        }
    }

    func tableSource() -> [MyService]{
        let dataArray = [
            MyService(name: firstArray[0].name, title: firstArray[0].description, image:firstArray[0].icon_url, link: firstArray[0].link),
            MyService(name: firstArray[1].name, title: firstArray[1].description, image: firstArray[1].icon_url, link: firstArray[1].link),
            MyService(name: firstArray[2].name, title: firstArray[2].description, image: firstArray[2].icon_url, link: firstArray[2].link),
            MyService(name: firstArray[3].name, title: firstArray[3].description, image: firstArray[3].icon_url, link: firstArray[3].link),
            MyService(name: firstArray[4].name, title: firstArray[4].description, image: firstArray[4].icon_url, link: firstArray[4].link),
            MyService(name: firstArray[5].name, title: firstArray[5].description, image: firstArray[5].icon_url, link: firstArray[5].link),
            MyService(name: firstArray[6].name, title: firstArray[6].description, image: firstArray[6].icon_url, link: firstArray[6].link),
            MyService(name: firstArray[7].name, title: firstArray[7].description, image: firstArray[7].icon_url, link: firstArray[7].link),
        ]
        self.myArray = dataArray
        return dataArray
    }
}


