//
//  HabitViewCell.swift
//  MyHabits
//
//  Created by Надежда on 14.03.2022.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    var habitNameLabel: UILabel = {
        let label = UILabel()
        label.font = .habitNameFont
        label.toAutoLayout()
        return label
    }()
    
    var targetTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .targetTimeFont
        label.textColor = .lightGray
        label.toAutoLayout()
        return label
    }()
    
    var timerLabel: UILabel = {
        let label = UILabel()
        label.font = .timerFont
        label.toAutoLayout()
        return label
    }()
    
    var checkPointImageView: UIImageView = {
        let checkPoint = UIImageView()
        checkPoint.layer.cornerRadius = 19
        checkPoint.layer.borderWidth = 1.5
        checkPoint.toAutoLayout()
        return checkPoint
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintsHabitViewCell()
    }
    
    func constraintsHabitViewCell() {
        contentView.addSubviews([habitNameLabel, targetTimeLabel, timerLabel, checkPointImageView])
        NSLayoutConstraint.activate([
            habitNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            targetTimeLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 4),
            targetTimeLabel.leadingAnchor.constraint(equalTo: habitNameLabel.leadingAnchor),
            
            timerLabel.topAnchor.constraint(equalTo: targetTimeLabel.bottomAnchor, constant: 30),
            timerLabel.leadingAnchor.constraint(equalTo: targetTimeLabel.leadingAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            checkPointImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            checkPointImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkPointImageView.heightAnchor.constraint(equalToConstant: 38),
            checkPointImageView.widthAnchor.constraint(equalToConstant: 38)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
