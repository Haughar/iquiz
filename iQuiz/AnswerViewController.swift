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
    @IBOutlet weak var answerStatus: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var chosenAnswer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
