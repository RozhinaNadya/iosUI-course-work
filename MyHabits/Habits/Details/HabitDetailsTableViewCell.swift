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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintsDetailsViewCell()
    }
    
    func constraintsDetailsViewCell() {
        contentView.addSubview(dayLabel)
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
