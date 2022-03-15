//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Надежда on 23.02.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    var backgroundColor: UIColor = .white
    
    let habitsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor(named: "allBackgroundColor")
        tableView.toAutoLayout()
        return tableView
    }()
    
    let cellHabit = "HebitTableViewCell"
    let cellProgress = "ProgressTableViewCell"
                
    init( color: UIColor) {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
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
        habitsTableView.register(HabitTableViewCell.self, forCellReuseIdentifier: cellHabit)
        habitsTableView.register(ProgressTableViewCell.self, forCellReuseIdentifier: cellProgress)
        habitsTableView.dataSource = self
        habitsTableView.rowHeight = UITableView.automaticDimension
        habitsTableView.delegate = self
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Сегодня"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.habitsTableView.separatorStyle = .none
    }
    
    @objc func addNewHabit() {
        let newHabit = UINavigationController(rootViewController: HabitViewController(color: .white, title: "Создать"))
        present(newHabit, animated: true)
    }
    
    func constraintsHabitsViewController() {
        view.addSubview(habitsTableView)
        NSLayoutConstraint.activate([
            habitsTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            habitsTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            habitsTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            habitsTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HabitsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return HabitsStore.shared.habits.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellProgress, for: indexPath) as? ProgressTableViewCell else { fatalError() }
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellHabit, for: indexPath) as? HabitTableViewCell else { fatalError() }
            let myHabit = HabitsStore.shared.habits[indexPath.row]
            cell.habitNameLabel.text = "\(myHabit.name)"
            cell.targetTimeLabel.text = "\(myHabit.dateString)"
            cell.timerLabel.text = "Счётчик: \(myHabit.trackDates.count)"
            cell.checkPointImageView.layer.borderColor = myHabit.color.cgColor
            cell.habitNameLabel.textColor = myHabit.color
            return cell
        }
    }
}
