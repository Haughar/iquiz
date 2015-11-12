//
//  ResultViewController.swift
//  iQuiz
//
//  Created by Alison Rose Haugh on 11/12/15.
//  Copyright © 2015 Alison Haugh. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var finish: UIButton!
    
    var quiz : Quiz!;
    
    @IBOutlet weak var amountCorrect: UILabel!
    @IBOutlet weak var results: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        amountCorrect.text! = "You got \(quiz.questionsCorrect) out of \(quiz.questionNumber) correct";
        
        if quiz.questionNumber == quiz.questionsCorrect {
            results.text! = "You got a perfect score!";
        } else {
            results.text! = "You have some room for improvement.";
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
