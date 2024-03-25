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
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 20
        return tableView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "abosanova", size: 40)
        label.text = "My services"
        
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 4.0
        label.layer.shadowOpacity = 1.0
        
        return label
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
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
    
    func constraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    //MARK: - setup all views
    func setupViews() {
        self.addSubview(imageView)
        self.addSubview(tableView)
        self.addSubview(label)
    }
    
    //MARK: - setup all constraints
    func setupConstraints() {
        constraintsForImageView()
        constraintsForTableView()
        constraintsForLabel()
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
