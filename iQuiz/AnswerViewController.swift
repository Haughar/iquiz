//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Alison Rose Haugh on 11/10/15.
//  Copyright © 2015 Alison Haugh. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    var correct : Bool!;
    var quiz : Quiz!;
    var userAnswer : String!;
    @IBOutlet weak var next: UIButton!
    @IBOutlet weak var finish: UIButton!
    @IBOutlet weak var answerStatus: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var chosenAnswer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        finish.hidden = true;
        correctAnswer.text! = "Answer: \(quiz.getAnswer())";
        chosenAnswer.text! = "Your answer: \(userAnswer)";
        quiz.moveOn(quiz.getAnswer() == userAnswer);
        if((quiz.correctChosen) != nil) {
            answerStatus.text! = "Congratulations! You got that one right!";
        } else {
            answerStatus.text! = "Woops! That wasn't right.";
        }
        
        if(quiz.quizFinished) {
            next.hidden = true;
            finish.hidden = false;
        }
        next.addTarget(self, action: "goToNextQuestion:", forControlEvents: .TouchUpInside);

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToNextQuestion(sender: AnyObject) {
        self.performSegueWithIdentifier("segueToNextQuestion", sender: self);
        
    }
    
    
    @IBAction func goToResult(sender: AnyObject) {
        self.performSegueWithIdentifier("segueToResult", sender: self);
        
    }
    
    override func prepareForSegue(segue : UIStoryboardSegue, sender : AnyObject?) {
        
        if(segue.identifier == "segueToResult") {
            let svc = segue.destinationViewController as! ResultViewController;
            svc.quiz = quiz;
        } else if(segue.identifier == "segueToNextQuestion") {
            let svc = segue.destinationViewController as! QuestionViewController;
            svc.quiz = quiz;
        }
        
    }
    

}
