//
//  HabitDetailsTableViewCell.swift
//  MyHabits
//
//  Created by Надежда on 17.03.2022.
//

import UIKit

class HabitDetailsTableViewCell: UITableViewCell {
    
    var dayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = .bodyFont
        label.toAutoLayout()
        return label
    }()
    
    var checkImageView: UIImageView = {
        let check = UIImageView()
        check.image = UIImage(systemName: "checkmark")
        check.toAutoLayout()
        return check
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintsDetailsViewCell()
    }
    
    func constraintsDetailsViewCell() {
        contentView.addSubviews([dayLabel, checkImageView])
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dayLabel.widthAnchor.constraint(equalToConstant: 200),
            dayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            
            checkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            checkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
