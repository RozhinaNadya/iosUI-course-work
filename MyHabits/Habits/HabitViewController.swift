//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Надежда on 25.02.2022.
//

import UIKit

class HabitViewController: UIViewController {
    
    var backgroundColor: UIColor = .white

    var delegate: HabitsViewControllerDelegate?
    
    var delegateDetails: HabitDetailsViewControllerDelegate?
        
    var habit: Habit?
    
    let habitScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.toAutoLayout()
        return scroll
    }()
    
    let titleHabitLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "TITLE"
        label.font = .footnoteFont
        return label
    }()
    
    let titleHabitTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Run in the morning, sleep 8 hours, etc."
        textField.textColor = .blue
        textField.font = .bodyFont
        textField.toAutoLayout()
        return textField
    }()
    
    let colorHabitLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "COLOR"
        label.font = .footnoteFont
        return label
    }()
    
    let colorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(TapSelectorColor), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    let timeHabitLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "TIME"
        label.font = .footnoteFont
        return label
    }()
    
    let dataPickerLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.text = "Every day in "
        label.font = .bodyFont
        return label
    }()
    
    let txtDatePicker: UITextField = {
        let textDate = UITextField()
        textDate.textColor = UIColor(named: "AccentColor")
        textDate.font = .bodyFont
        textDate.toAutoLayout()
        return textDate
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.minuteInterval = 1
        picker.date = Date()
        picker.addTarget(self, action: #selector(getDateFromPicker), for: .allEvents)
        picker.toAutoLayout()
        return picker
    }()
    
    let deleteHabitButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setTitle("Delete Habit", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .bodyFont
        button.addTarget(self, action: #selector(deleteHabit), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    init( color: UIColor, title: String = "Title") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsHabitViewController()
        txtDatePicker.inputView = datePicker
        datePicker.datePickerMode = .time
        getDateFromPicker()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelHabit))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(safeHabit))
    }
    
    @objc func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        txtDatePicker.text = formatter.string(from: datePicker.date)
    }
    
    @objc func doneAction(){
        getDateFromPicker()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            habitScrollView.contentInset.bottom = keyboardSize.height
            habitScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        habitScrollView.contentInset.bottom = .zero
        habitScrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc func TapSelectorColor() {
        let colorPicer = UIColorPickerViewController()
        colorPicer.delegate = self
        present(colorPicer, animated: true)
    }
    
    @objc func cancelHabit() {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func safeHabit() {
        
        guard let habitNewName = self.titleHabitTextField.text, !habitNewName.isEmpty else { return }
        
        if let habit = self.habit, let indexHabit = HabitsStore.shared.habits.firstIndex(of: habit) {
            HabitsStore.shared.habits[indexHabit].name = habitNewName
            HabitsStore.shared.habits[indexHabit].date = self.datePicker.date
            HabitsStore.shared.habits[indexHabit].color = self.colorButton.backgroundColor ?? .blue
            HabitsStore.shared.save()
            self.delegateDetails?.handlerToHabits(habit: habit)
            self.dismiss(animated: true, completion: nil)
        } else {
            let newHabit = Habit(name: habitNewName,
                                 date: self.datePicker.date,
                                 color: self.colorButton.backgroundColor ?? .blue)
            HabitsStore.shared.habits.append(newHabit)
            self.delegate?.reloadCollectionView()
            self.dismiss(animated: true, completion: {self.delegate?.reloadCollectionView()})
        }
    }
    
    @objc func deleteHabit() {
        print("delete delete")
        let alert = UIAlertController(title: "Delete habit", message: "Do you want delete habit '\(titleHabitTextField.text ?? "No title")'?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: {alert -> Void in
            HabitsStore.shared.habits.remove(at: HabitsStore.shared.habits.firstIndex(of: self.habit!)!)
            HabitsStore.shared.save()
            self.delegateDetails?.close()
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func thisHabit(habit: Habit) {
        self.habit = habit
        titleHabitTextField.text = habit.name
        datePicker.date = habit.date
        colorButton.backgroundColor = habit.color
    }
    
    func constraintsHabitViewController() {
        self.view.addSubview(habitScrollView)
        habitScrollView.addSubviews([titleHabitLabel, titleHabitTextField, colorHabitLabel, colorButton, timeHabitLabel, dataPickerLabel, datePicker, txtDatePicker, deleteHabitButton])
        NSLayoutConstraint.activate([
            habitScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            habitScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            habitScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            habitScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            titleHabitLabel.topAnchor.constraint(equalTo: habitScrollView.topAnchor, constant: 21),
            titleHabitLabel.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            titleHabitLabel.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            
            titleHabitTextField.topAnchor.constraint(equalTo: titleHabitLabel.bottomAnchor, constant: 7),
            titleHabitTextField.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            titleHabitTextField.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            
            colorHabitLabel.topAnchor.constraint(equalTo: titleHabitTextField.bottomAnchor, constant: 15),
            colorHabitLabel.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            colorHabitLabel.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            
            colorButton.topAnchor.constraint(equalTo: colorHabitLabel.bottomAnchor, constant: 7),
            colorButton.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            
            timeHabitLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeHabitLabel.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            timeHabitLabel.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            
            dataPickerLabel.topAnchor.constraint(equalTo: timeHabitLabel.bottomAnchor, constant: 15),
            dataPickerLabel.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            
            txtDatePicker.topAnchor.constraint(equalTo: dataPickerLabel.topAnchor),
            txtDatePicker.leadingAnchor.constraint(equalTo: dataPickerLabel.trailingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: dataPickerLabel.bottomAnchor, constant: 15),
            datePicker.centerXAnchor.constraint(equalTo: habitScrollView.centerXAnchor),
            datePicker.bottomAnchor.constraint(equalTo: habitScrollView.bottomAnchor, constant: -219),
            
            deleteHabitButton.centerXAnchor.constraint(equalTo: habitScrollView.centerXAnchor),
            deleteHabitButton.bottomAnchor.constraint(equalTo: habitScrollView.bottomAnchor),
            deleteHabitButton.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        colorButton.backgroundColor = color
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        colorButton.backgroundColor = color
    }
}

