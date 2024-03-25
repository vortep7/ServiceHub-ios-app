//
//  MenuView.swift
//  ServiceHub
//
//  Created by Андрей Петров on 25.03.2024.
//
import UIKit
import Lottie

final class MenuView: UIView {
    
    //MARK: - clouser for nav button
    var onLogBottonAction: (() -> Void)?
    
    //MARK: - create UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        return imageView
    }()
    
    private let animationView:LottieAnimationView = {
        let animationView = LottieAnimationView(name: "Comp")
        animationView.contentMode = .scaleAspectFit
        
        animationView.layer.shadowColor = UIColor.white.cgColor
        animationView.layer.shadowOffset = .zero
        animationView.layer.shadowRadius = 6.0
        animationView.layer.shadowOpacity = 1.0
        
        return animationView
    }()
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "abosanova", size: 50)
        label.text = TextForView.firstLabel.rawValue
        
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 4.0
        label.layer.shadowOpacity = 1.0
        
        return label
    }()
    
    private let button:UIButton = {
            let button = UIButton()
            
            button.backgroundColor = .firstColour
            button.tintColor = .white
            button.setTitle("Click to logIn", for: .normal)
            button.titleLabel?.font = UIFont(name: "abosanova", size: 30)
            button.layer.shadowOffset = CGSize(width: 2, height: 2)
            button.layer.shadowColor = UIColor.white.cgColor
            button.layer.shadowOpacity = 0.7
            button.layer.shadowRadius = 5
            
            button.layer.cornerRadius = 25
            
            return button
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
    
    func constraintsForButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 550),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForFirstLabel() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            firstLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -550),
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForAnimation() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: self.topAnchor, constant: 320),
            animationView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -370),
            animationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            animationView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func createTask() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    //MARK: - setup views
    func setupViews() {
        self.addSubview(imageView)
        self.addSubview(firstLabel)
        self.addSubview(animationView)
        self.addSubview(button)
    }
    
    //MARK: - setup all constraints
    func setupConstraints() {
        constraintsForImageView()
        constraintsForFirstLabel()
        constraintsForAnimation()
        constraintsForButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        createTask()
        animationView.play()
        animationView.loopMode = .loop
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

enum TextForView: String {
    case firstLabel = "SERVICE HUB"
}

extension MenuView {
    @objc func buttonAction() {
        onLogBottonAction?()
    }
}
