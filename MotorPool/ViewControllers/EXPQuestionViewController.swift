//
//  EXPQuestionViewController.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 12.01.2024.
//

import UIKit

class EXPQuestionViewController: UIViewController {
    
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
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    private let questions = Question.getQuestion()
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
    
    @IBAction func choosingAnAnswer(_ sender: UIButton) {
        guard let buttonIndex = questionAnswers.firstIndex(of: sender) else { return }
        
        let answer = currentAnswers[buttonIndex]
        answersChosen.append(answer)
        
        print("buttonIndex")
        print(buttonIndex)
        print("answer")
        print(answer)
        nextQuestion()
        displayingTheDesiredQuestion()
    }
}

private extension EXPQuestionViewController {
    func nextQuestion() {
        
        if questionIndex < questions.count - 1 {
            questionIndex += 1
        } else {
            questionStackView.isHidden.toggle()
            resultStackView.isHidden.toggle()
            quizResult()
        }
        
    }
    
    func displayingTheDesiredQuestion() {
        
        questions.forEach { question in
            
            let correctTitle = questions[questionIndex].title
            let correctAnswers = questions[questionIndex].answers
            
            questionTitleLabel.text = correctTitle
            
            for (answer, button) in zip(correctAnswers, questionAnswers) {
                button.setTitle(answer.title, for: .normal)
            }
        }
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
        
        updateUI(with: mostFrequentCar)
    }
    
    func updateUI(with car: Car) {
        resultImageView.image = UIImage.audi
        
        resultTitle.text = car.rawValue
        resultDescription.text = car.descriptionRU
    }
}
