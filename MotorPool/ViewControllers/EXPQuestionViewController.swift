//
//  EXPQuestionViewController.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 12.01.2024.
//

import UIKit
import SwiftUI

final class EXPQuestionViewController: UIViewController {
    
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
            completeButton.layer.borderWidth = 0.5
            completeButton.layer.borderColor = UIColor.white.cgColor
            completeButton.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    private let questions = Question.getQuestionRU().shuffled()
    private let questionsENG = Question.getQuestionENG().shuffled()
    private var answersChosen: [Answer] = []
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultStackView.isHidden = true
        
        displayingTheDesiredQuestion()
    }
    
    @IBAction func completeButtonDidTapped() {
        dismiss(animated: true)
    }
    
    
    @IBAction func choosingAnAnswer(_ sender: UIButton) {
        guard let buttonIndex = questionAnswers.firstIndex(of: sender) else { return }
        
        let answer = currentAnswers[buttonIndex]
        answersChosen.append(answer)
        
        nextQuestion()
        displayingTheDesiredQuestion()
    }
}

private extension EXPQuestionViewController {
    func nextQuestion() {
        
        if questionIndex < questions.count - 1 {
            questionIndex += 1
        } else {
            changeUI()
        }
        
    }
    
    func changeUI() {
        questionProgressView.isHidden.toggle()
        questionStackView.isHidden.toggle()
        resultStackView.isHidden.toggle()
        quizResult()
    }
    
    func displayingTheDesiredQuestion() {
        
        let correctTitle = questions[questionIndex].title
        let correctAnswers = questions[questionIndex].answers
        questionTitleLabel.text = correctTitle
        
        for (answer, button) in zip(correctAnswers, questionAnswers) {
            button.setTitle(answer.title, for: .normal)
        }
        
        let totalProgress = Float(questionIndex) / Float(questions.count - 1)
        questionProgressView.setProgress(totalProgress, animated: true)
    }
}

private extension EXPQuestionViewController {
    func quizResult() {
        var frequencyOfCar: [Car: Int] = [:]
        let cars = answersChosen.map { $0.car }
        
        for car in cars {
            frequencyOfCar[car, default: 0] += 1
        }
        
        let sortedFrequentOfCar = frequencyOfCar.sorted { $0.value > $1.value }
        guard let mostFrequentCar = sortedFrequentOfCar.first?.key else { return }
        
        updateQuizView(with: mostFrequentCar)
    }
    
    func updateQuizView(with car: Car) {
        resultImageView.image = UIImage(named: car.image)
        
        resultTitle.text = car.rawValue
        resultDescription.text = car.descriptionRU
    }
}
