//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Надежда on 23.02.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    var backgroundColor: UIColor = .white
    
    let habitsTableView = UITableView.init(frame: .zero, style: .plain)
    
    var habitsData = HabitsStore.self
    
 //   let waterHabit = Habit(name: "Выпить стакан воды", date: 2022-01-31T02:22:40+00:00, trackDates: [], color: UIColor(red: 98, green: 54, blue: 255, alpha: 1))
        
    init( color: UIColor/*, title: String = "Title"*/) {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
  //      self.title = title
    }
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsHabitsViewController()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNewHabit))
    }
    
    @objc func addNewHabit() {
        let newHabit = UINavigationController(rootViewController: HabitViewController(color: .white, title: "Создать"))
        present(newHabit, animated: true)
    }
    
    func constraintsHabitsViewController() {
        //тут будет сабвью
        NSLayoutConstraint.activate([
// тут будет констраинт
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
