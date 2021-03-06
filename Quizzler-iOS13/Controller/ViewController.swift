//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    /*
     let     quiz = [["Four + Two is equal to Six", "True"],
                    ["Five - Three is greater than One", "True"],
                    ["Three + Eigth is less than Ten", "False"]
    ]

or     */
    /* (2)
    let     quiz = [Question(q: "A slug's blood is green.", a: "True"),
                    Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                    Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                    Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                    Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                    Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                    Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                    Question(q: "Google was originally called 'Backrub'.", a: "True"),
                    Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                    Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                    Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                    Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

    ]
 */    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
  
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLable.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLable.text = "Score: \(quizBrain.getScore())"
    }
}

