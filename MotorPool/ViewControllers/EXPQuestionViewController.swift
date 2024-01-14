//
//  EXPQuestionViewController.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 12.01.2024.
//

import UIKit

final class EXPQuestionViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var languageSwitchSegmentedControl: UISegmentedControl!
    
    @IBOutlet var questionStackView: UIStackView!
    @IBOutlet var questionTitleLabel: UILabel! {
        didSet {
            questionTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet var questionAnswers: [UIButton]! {
        didSet {
            questionAnswers.forEach { button in
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.white.cgColor
                button.layer.cornerRadius = 10
            }
        }
    }
    
    @IBOutlet var resultStackView: UIStackView!
    @IBOutlet var resultImageView: UIImageView!
    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var resultDescription: UILabel!
    
    @IBOutlet var completeButton: UIButton! {
        didSet {
            completeButton.layer.borderWidth = 1
            completeButton.layer.borderColor = UIColor.white.cgColor
            completeButton.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    // MARK: Properties
    private let questions = Question.getQuestion().shuffled()
    private var answersChosen: [Answer] = []
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answersRU
    }

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultStackView.isHidden = true
        
        displayQuestion()
    }
    
    // MARK: IBAction
    @IBAction func completeButtonDidTapped() {
        dismiss(animated: true)
    }

    @IBAction func languageSwitch() {
        displayQuestion()
        
        resultDescription.text = quizDescription()
    }
    
    @IBAction func choosingAnAnswer(_ sender: UIButton) {
        guard let buttonIndex = questionAnswers.firstIndex(of: sender) else { return }
        
        let answer = currentAnswers[buttonIndex]
        answersChosen.append(answer)
        
        nextQuestion()
        displayQuestion()
    }
}

// MARK: Question
private extension EXPQuestionViewController {
    func nextQuestion() {
        
        if questionIndex < questions.count - 1 {
            questionIndex += 1
        } else {
            showResultQuiz()
        }
    }
    
    func displayQuestion() {
                
        if languageSwitchSegmentedControl.selectedSegmentIndex == 0 {
            let correctTitle = questions[questionIndex].titleRU
            let correctAnswers = questions[questionIndex].answersRU
            questionTitleLabel.text = correctTitle
            
            for (answer, button) in zip(correctAnswers, questionAnswers) {
                button.setTitle(answer.title, for: .normal)
            }
            
        } else {
            let correctTitle = questions[questionIndex].titleENG
            let correctAnswers = questions[questionIndex].answersENG
            questionTitleLabel.text = correctTitle
            
            for (answer, button) in zip(correctAnswers, questionAnswers) {
                button.setTitle(answer.title, for: .normal)
            }
        }
            
        let totalProgress = Float(questionIndex) / Float(questions.count - 1)
        questionProgressView.setProgress(totalProgress, animated: true)
    }
}

// MARK: Result quiz
private extension EXPQuestionViewController {
    func quizSortedCar() -> Car {
        var frequencyOfCar: [Car: Int] = [:]
        let cars = answersChosen.map { $0.car }
        
        for car in cars {
            frequencyOfCar[car, default: 0] += 1
        }
        
        let sortedFrequentOfCar = frequencyOfCar.sorted { $0.value > $1.value }
        guard let mostFrequentCar = sortedFrequentOfCar.first?.key else { return Car.ford }
        
        return mostFrequentCar
    }
    
    func quizDescription() -> String{
        let car = quizSortedCar()
        
        if languageSwitchSegmentedControl.selectedSegmentIndex == 0 {
            resultDescription.text = car.descriptionRU
        } else {
            resultDescription.text = car.descriptionENG
        }
        return resultDescription.text ?? ""
    }
    
    func showResultQuiz() {
        let car = quizSortedCar()
        
        completeButton.layer.borderColor = UIColor.systemGreen.cgColor
        completeButton.layer.borderWidth = 2
        
        questionProgressView.isHidden.toggle()
        questionStackView.isHidden.toggle()
        resultStackView.isHidden.toggle()
        
        resultImageView.image = UIImage(named: car.image)
        resultTitle.text = car.rawValue
        resultDescription.text = quizDescription()
    }
}
