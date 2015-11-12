//
//  Quiz.swift
//  iQuiz
//
//  Created by Alison Rose Haugh on 11/10/15.
//  Copyright © 2015 Alison Haugh. All rights reserved.
//

import Foundation

class Quiz {
    var questions : [String];
    var answers : [String];
    var fillers : [[String]];
    var questionNumber : Int;
    var questionsCorrect : Int;
    var correctChosen : Bool!;
    var quizFinished : Bool;
    
    
    init(questions: [String], answers: [String], fillers: [[String]]) {
        self.questions = questions;
        self.answers = answers;
        self.fillers = fillers;
        self.quizFinished = false;
        self.questionsCorrect = 0;
        self.questionNumber = 0;
    }
    
    func presetQuestion() -> String {
        return questions[questionNumber];
    }
    
    func getAnswer() -> String {
        return answers[questionNumber];
    }
    
    func getChoices() -> [String] {
        return fillers[questionNumber];
    }
    
    func moveOn(correct : Bool) {
        self.questionNumber++;
        if(correct) {
            self.questionsCorrect++
        }
        correctChosen = correct;
        if(questionNumber == questions.count) {
            quizFinished = true;
        }
    }
}
