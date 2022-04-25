//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Надежда on 23.02.2022.
//

import UIKit

class InfoViewController: UIViewController, UIScrollViewDelegate{
    
    var backgroundColor: UIColor = .white
    
    let infoScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.toAutoLayout()
        return scroll
    }()
    
    let titleInfoHabitsLabel: UILabel = {
        let title = UILabel()
        title.text = "Habit in 21 days"
        title.font = .titleFont
        title.toAutoLayout()
        return title
    }()
    
    let textInfoHabitsLabel: UILabel = {
        let textInfo = UILabel()
        textInfo.text = "The passage of stages for which a habit is developed in 21 days is subject to the following algorithm: \n\n1. Spend 1 day without revisiting old habits, trying to act as if the goal, put into perspective, is just a step away. \n\n2. Maintain 2 days in the same state of self-control. \n\n3. To mark in the diary the first week of changes and sum up the first results - what turned out to be hard, what was easier, what still needs to be seriously fought. \n\n4. Congratulate yourself on passing your first major threshold at 21 days. During this time, the rejection of bad inclinations will already take the form of a conscious overcoming and a person will be able to work more towards the adoption of positive qualities. \n\n5. Hold the plank for 40 days. The practitioner of the technique already feels freed from past negativity and is moving in the right direction with good dynamics. \n\n6. On the 90th day of observing the technique, everything superfluous from the “past life” ceases to remind of itself, and a person, looking back, realizes that he is completely renewed."
        textInfo.font = .bodyFont
        textInfo.numberOfLines = 0
        textInfo.toAutoLayout()
        return textInfo
    }()
    
    let footnoteInfoHabitsLabel: UILabel = {
        let footnote = UILabel()
        footnote.text = "Source: psychbook.ru"
        footnote.font = .bodyFont
        footnote.toAutoLayout()
        return footnote
    }()
    
    init( color: UIColor, title: String = "Title") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title
    }
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsInfoViewController()
        infoScrollView.delegate = self
    }
    
    func constraintsInfoViewController(){
        self.view.addSubview(infoScrollView)
        infoScrollView.addSubviews([titleInfoHabitsLabel, textInfoHabitsLabel, footnoteInfoHabitsLabel])
        titleInfoHabitsLabel.frame.size = infoScrollView.contentSize
        textInfoHabitsLabel.frame.size = infoScrollView.contentSize
        footnoteInfoHabitsLabel.frame.size = infoScrollView.contentSize
        
        NSLayoutConstraint.activate([
            infoScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            infoScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            infoScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            infoScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            titleInfoHabitsLabel.topAnchor.constraint(equalTo: infoScrollView.topAnchor, constant: 22),
            titleInfoHabitsLabel.leadingAnchor.constraint(equalTo: infoScrollView.leadingAnchor),
            titleInfoHabitsLabel.trailingAnchor.constraint(equalTo: infoScrollView.trailingAnchor),
            
            textInfoHabitsLabel.topAnchor.constraint(equalTo: titleInfoHabitsLabel.bottomAnchor, constant: 16),
            textInfoHabitsLabel.leadingAnchor.constraint(equalTo: titleInfoHabitsLabel.leadingAnchor),
            textInfoHabitsLabel.trailingAnchor.constraint(equalTo: titleInfoHabitsLabel.trailingAnchor),
            textInfoHabitsLabel.widthAnchor.constraint(equalTo: infoScrollView.widthAnchor),
            
            footnoteInfoHabitsLabel.topAnchor.constraint(equalTo: textInfoHabitsLabel.bottomAnchor, constant: 12),
            footnoteInfoHabitsLabel.leadingAnchor.constraint(equalTo: textInfoHabitsLabel.leadingAnchor),
            footnoteInfoHabitsLabel.trailingAnchor.constraint(equalTo: textInfoHabitsLabel.trailingAnchor),
            footnoteInfoHabitsLabel.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
