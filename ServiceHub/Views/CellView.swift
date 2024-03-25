
import UIKit
import Foundation

class CellConfig: UITableViewCell {
    
    var firstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "abosanova", size: 20)
        label.text = TextForView.firstLabel.rawValue
        return label
    }()
    
    var firstImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    func setupCell() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(firstLabel)
        self.contentView.addSubview(firstImageView)
        
        NSLayoutConstraint.activate([
            
            firstLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 50),
            firstLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -1),
            firstLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 1),
            firstLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 1),
            
            firstImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            firstImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -40),
            firstImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 1),
            firstImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 1),
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
