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
        title.text = "Привычка за 21 день"
        title.font = .titleFont
        title.toAutoLayout()
        return title
    }()
    
    let textInfoHabitsLabel: UILabel = {
        let textInfo = UILabel()
        textInfo.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму: \n\n1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага. \n\n2. Выдержать 2 дня в прежнем состоянии самоконтроля. \n\n3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче,с чем еще предстоит серьезно бороться. \n\n4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств. \n\n5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой. \n\n6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        textInfo.font = .bodyFont
        textInfo.numberOfLines = 0
        textInfo.toAutoLayout()
        return textInfo
    }()
    
    let footnoteInfoHabitsLabel: UILabel = {
        let footnote = UILabel()
        footnote.text = "Источник: psychbook.ru"
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
