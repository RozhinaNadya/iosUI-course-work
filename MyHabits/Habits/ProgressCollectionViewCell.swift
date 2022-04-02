//
//  ProgressTableViewCell.swift
//  MyHabits
//
//  Created by Надежда on 15.03.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
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
        title.toAutoLayout()
        return title
    }()
    
    let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progress = HabitsStore.shared.todayProgress
        progress.toAutoLayout()
        return progress
    }()
    
    let progressProcentLabel: UILabel = {
        let label = UILabel()
        label.font = .footnoteFont
        label.textColor = .darkGray
        label.toAutoLayout()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintsProgressViewCell()
        contentView.backgroundColor = UIColor(named: "allBackgroundColor")
    }
    
       func progressText() {
        toProcent(progress: progressView.progress) == 100 ? (titleProgressLabel.text = "Супер! Сегодня всё выполнено") : (titleProgressLabel.text = "Всё получится!")
    }
    
    func constraintsProgressViewCell() {
        contentView.addSubview(backView)
        backView.addSubviews([titleProgressLabel, progressView, progressProcentLabel])
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleProgressLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            titleProgressLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            
            progressView.topAnchor.constraint(equalTo: titleProgressLabel.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            progressView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -15),
            
            progressProcentLabel.topAnchor.constraint(equalTo: titleProgressLabel.topAnchor),
            progressProcentLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12)
        ])
    }
    
    func toProcent(progress: Float) -> Int {
        return Int(progress * 100)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
