//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Надежда on 23.02.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    var backgroundColor: UIColor = .white
    
    let newHabitsImageView: UIImageView = {
        let newHabits = UIImageView(image: UIImage(systemName: "plus"))
        newHabits.toAutoLayout()
        return newHabits
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
        constraintsHabitsViewController()
    }
    
    func constraintsHabitsViewController() {
        self.view.addSubview(newHabitsImageView)
        NSLayoutConstraint.activate([
            newHabitsImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 44),
            newHabitsImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
