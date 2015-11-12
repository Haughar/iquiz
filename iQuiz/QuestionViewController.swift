//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Alison Rose Haugh on 11/10/15.
//  Copyright © 2015 Alison Haugh. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var quizLabel: UILabel!
    var chosenAnswer : String!;
    var quiz : Quiz!;

    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        quizLabel.text = quiz.presentQuestion();
        let options = quiz.getChoices();
        showOptions(options);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func showOptions(options : [String]) {
        answerA.setTitle(options[0], forState : .Normal);
        answerA.addTarget(self, action: "chooseAnswer:", forControlEvents: .TouchUpInside);
        answerB.setTitle(options[1], forState : .Normal);
        answerB.addTarget(self, action: "chooseAnswer:", forControlEvents: .TouchUpInside);
        answerC.setTitle(options[2], forState : .Normal);
        answerC.addTarget(self, action: "chooseAnswer:", forControlEvents: .TouchUpInside);
        answerD.setTitle(options[3], forState : .Normal);
        answerD.addTarget(self, action: "chooseAnswer:", forControlEvents: .TouchUpInside);
        submit.addTarget(self, action: "submitAnswer:", forControlEvents: .TouchUpInside);
    }
    
    @IBAction func chooseAnswer(sender: UIButton) {
        chosenAnswer = sender.titleLabel!.text;
    }
    
    @IBAction func submitAnswer(sender: UIButton) {
        if chosenAnswer != nil {
            self.performSegueWithIdentifier("segueToAnswer", sender: self);
        }
    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueToAnswer") {
            let svc = segue.destinationViewController as! AnswerViewController;
            svc.quiz = quiz;
            svc.userAnswer = chosenAnswer;
        }
    }
    
}
