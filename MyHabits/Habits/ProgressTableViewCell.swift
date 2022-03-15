//
//  ProgressTableViewCell.swift
//  MyHabits
//
//  Created by Надежда on 15.03.2022.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.toAutoLayout()
        return view
    }()
    
    let titleProgressLabel: UILabel = {
        let title = UILabel()
        title.font = .footnoteFont
        title.textColor = .darkGray
        title.text = "Всё получится!"
        title.toAutoLayout()
        return title
    }()
    
    let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.toAutoLayout()
        return progress
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintsProgressViewCell()
        contentView.backgroundColor = UIColor(named: "allBackgroundColor")
    }
    
    func constraintsProgressViewCell() {
        contentView.addSubview(backView)
        backView.addSubviews([titleProgressLabel, progressView])
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18),
            
            titleProgressLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            titleProgressLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            
            progressView.topAnchor.constraint(equalTo: titleProgressLabel.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            progressView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
