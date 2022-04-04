//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Надежда on 17.03.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var habitForEdit: Habit
    
    let cellDetails = "DetailsTableViewCell"
    
    let editHabitVC = HabitViewController(color: .white, title: "Править")
    
    var detailsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(named: "allBackgroundColor")
        tableView.toAutoLayout()
        return tableView
    }()
        
    init(title: String = "Title", habitForEdit: Habit) {
        self.habitForEdit = habitForEdit
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.register(HabitDetailsTableViewCell.self, forCellReuseIdentifier: cellDetails)
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        constraintsDetailsViewContriller()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(doEditHabit))
        editHabitVC.delegateDetails = self
    }
    
    func constraintsDetailsViewContriller() {
        self.view.addSubview(detailsTableView)
        NSLayoutConstraint.activate([
            detailsTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            detailsTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            detailsTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            detailsTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func doEditHabit() {
        editHabitVC.thisHabit(habit: habitForEdit)
        editHabitVC.deleteHabitButton.isHidden = false
        let navigationHabit = UINavigationController(rootViewController: editHabitVC)
        navigationHabit.modalPresentationStyle = .fullScreen
        present(navigationHabit, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellDetails, for: indexPath) as? HabitDetailsTableViewCell else { fatalError() }
        cell.dayLabel.text = "\(HabitsStore.shared.trackDateString(forIndex: indexPath.row)!)"
        if HabitsStore.shared.habit(habitForEdit, isTrackedIn: HabitsStore.shared.dates[indexPath.item]) {
            cell.checkImageView.isHidden = false
        } else {
            cell.checkImageView.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "АКТИВНОСТЬ"
    }
}

extension HabitDetailsViewController: HabitDetailsViewControllerDelegate {
    func handlerToHabits(habit: Habit) {
        print("handlerToHabits")
        self.navigationItem.title = habit.name
        self.editHabitVC.delegate?.reloadCollectionView()
    }
}
