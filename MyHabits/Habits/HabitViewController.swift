//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Надежда on 25.02.2022.
//

import UIKit

class HabitViewController: UIViewController {
    
    var backgroundColor: UIColor = .white
    
    init( color: UIColor, title: String = "Создать") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title
    }
        
    let habitScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.toAutoLayout()
        return scroll
    }()
    
    let titleHabitLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "НАЗВАНИЕ"
        return label
    }()
    
    let titleHabitTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.toAutoLayout()
        return textField
    }()
    
    let colorHabitLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "ЦВЕТ"
        return label
    }()
    
    let colorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .blue
        button.toAutoLayout()
        return button
    }()
    
    let timeHabitLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "ВРЕМЯ"
        return label
    }()
    
    let dataPickerLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Каждый день в "
        return label
    }()
    
    let txtDatePicker: UITextField = {
        let textDate = UITextField()
  /*      let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        textDate.text = formatter.string(from: datePicker.date)*/
        return textDate
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .dateAndTime
        picker.minuteInterval = 1
        picker.toAutoLayout()
        return picker
    }()
    
    let timeTool: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexSpece = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let donebutton = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
        toolbar.setItems([flexSpece, donebutton], animated: true)
        return toolbar
    }()
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsHabitViewController()
        colorButton.addTarget(self, action: #selector(TapSelectorColor), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
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
    
    @objc func safeHabit(){
        let newHabit = Habit(name: titleHabitTextField.text!,
                             date: Date(),
                             color: .systemRed)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
    }
    
  /*  func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }*/
    
    
    func constraintsHabitViewController() {
        self.view.addSubview(habitScrollView)
        habitScrollView.addSubviews([titleHabitLabel, titleHabitTextField, colorHabitLabel, colorButton, timeHabitLabel, dataPickerLabel, datePicker])
        NSLayoutConstraint.activate([
            habitScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            habitScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            habitScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            habitScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            titleHabitLabel.topAnchor.constraint(equalTo: habitScrollView.topAnchor, constant: 21),
            titleHabitLabel.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            titleHabitLabel.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            titleHabitLabel.widthAnchor.constraint(equalToConstant: 100),
            
            titleHabitTextField.topAnchor.constraint(equalTo: titleHabitLabel.bottomAnchor, constant: 7),
            titleHabitTextField.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            titleHabitTextField.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            titleHabitTextField.widthAnchor.constraint(equalTo: habitScrollView.widthAnchor),
            
            colorHabitLabel.topAnchor.constraint(equalTo: titleHabitTextField.bottomAnchor, constant: 15),
            colorHabitLabel.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            colorHabitLabel.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            colorHabitLabel.widthAnchor.constraint(equalToConstant: 100),
            
            colorButton.topAnchor.constraint(equalTo: colorHabitLabel.bottomAnchor, constant: 7),
            colorButton.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            
            timeHabitLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeHabitLabel.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            timeHabitLabel.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            timeHabitLabel.widthAnchor.constraint(equalToConstant: 100),
            
            dataPickerLabel.topAnchor.constraint(equalTo: timeHabitLabel.bottomAnchor, constant: 15),
            dataPickerLabel.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            dataPickerLabel.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            dataPickerLabel.widthAnchor.constraint(equalToConstant: 100),
            
            datePicker.topAnchor.constraint(equalTo: dataPickerLabel.bottomAnchor, constant: 15),
            datePicker.leadingAnchor.constraint(equalTo: habitScrollView.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: habitScrollView.trailingAnchor),
            datePicker.widthAnchor.constraint(equalToConstant: 100),
            datePicker.bottomAnchor.constraint(equalTo: habitScrollView.bottomAnchor)

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
