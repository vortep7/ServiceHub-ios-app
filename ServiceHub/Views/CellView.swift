
import UIKit
import Foundation

class CellConfig: UITableViewCell {
    
    var firstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "abosanova", size: 20)
        return label
    }()
    
    var secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "abosanova", size: 14)
        label.numberOfLines = 3
        return label
    }()
    
    var thirdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "abosanova", size: 10)
        return label
    }()
    
    var firstImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    func setupCell() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false

        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(firstLabel)
        self.contentView.addSubview(secondLabel)
        self.contentView.addSubview(thirdLabel)

        self.contentView.addSubview(firstImageView)
        
        NSLayoutConstraint.activate([
            firstImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            firstImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            firstImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -270),
            firstImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            
            firstLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            firstLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100),
            firstLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            
            secondLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            secondLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100),
            secondLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            secondLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 15),
            thirdLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            thirdLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            thirdLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
