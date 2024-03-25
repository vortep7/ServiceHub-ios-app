//
//  MainView.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//
import UIKit
import Foundation

class MainView: UIView {
    
    //MARK: - create UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        return imageView
    }()
    
    //MARK: - create constraints
    func constraintsForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func setupViews() {
        self.addSubview(imageView)
       
    }
    
    //MARK: - setup all constraints
    func setupConstraints() {
        constraintsForImageView()
     
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
