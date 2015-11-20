//
//  ViewController.swift
//  iQuiz
//
//  Created by Alison Rose Haugh on 11/2/15.
//  Copyright © 2015 Alison Haugh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var newQuizzes = [AnyObject]()
    var questions = [String]()
    var fillers = [[String]]()
    var answers = [String]()
    var quizzes = [Quiz]()
    //let quizzes = ["Math", "Marvel", "Science"];
    //let descriptions = ["A quiz about how good you are at math.", "A quiz about how well you know the super heroes of Marvel.", "A quiz about how good you are at science."];
    let cellIdentifier = "tableCell";
    @IBOutlet weak var settingsBtn: UIBarButtonItem!;
    var quizSelected : String!;
    //let mathQs : [String] = ["Math Question 1", "Math Question 2", "Math Question 3"];
    //let mathAs : [String] = ["A", "C", "D"];
    //let mathFillers : [[String]] = [["A", "B", "C", "D"], ["A", "B", "C", "D"], ["A", "B", "C", "D"]];
    
    //let marvelQs : [String] = ["Marvel Question 1", "Marvel Question 2", "Marvel Question 3"];
    //let marvelAs : [String] = ["C", "D", "A"];
    //let marvelFillers : [[String]] = [["A", "B", "C", "D"], ["A", "B", "C", "D"], ["A", "B", "C", "D"]];
    
    //let scienceQs : [String] = ["Science Question 1", "Science Question 2", "Science Question 3"];
    //let scienceAs : [String] = ["B", "A", "B"];
    //let scienceFillers : [[String]] = [["A", "B", "C", "D"], ["A", "B", "C", "D"], ["A", "B", "C", "D"]];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // put call to method that does http request here)
        doData()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier);
        // settingsBtn.action = "settingsAlert:";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueToQuestion") {
            let questionVC = segue.destinationViewController as! QuestionViewController;
            for quiz in quizzes {
                if (self.quizSelected == quiz.title) {
                    questionVC.quiz = quiz
                }
            }
            
        }
        
    }
    
    func doData() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let data = defaults.objectForKey("quizData") as? NSData
        {
            do {
                
                self.newQuizzes = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                
                
                for quiz in self.newQuizzes {
                    let title = quiz["title"] as! String
                    let desc = quiz["desc"] as! String
                    if let questions = quiz["questions"] {
                        for question in questions as! [NSDictionary] {
                            self.questions.append(question["text"] as! String)
                            if let answers = question["answers"] {
                                var newFillers = [String]()
                                var index = 0
                                for answer in answers as! [String] {
                                    newFillers.append(answer)
                                    if String(index) == question["answer"] as! String {
                                        self.answers.append(answer)
                                    }
                                    index++
                                }
                                self.fillers.append(newFillers)
                            }
                            
                        }
                    }
                    self.quizzes.append(Quiz(title: title, desc: desc, questions: self.questions, answers: self.answers, fillers: self.fillers))
                }
                
            } catch {
                
            }

        } else {
            print("didnt make it.")
        }
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quizzes.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.quizSelected = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text;
        self.performSegueWithIdentifier("segueToQuestion", sender: self);
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!;
        
        cell.textLabel?.text = self.quizzes[indexPath.row].title;
        cell.imageView!.image = UIImage(named : self.quizzes[indexPath.row].title);
        cell.detailTextLabel?.text = self.quizzes[indexPath.row].desc;
        
        return cell;
    }
    
    @IBAction func exit(segue: UIStoryboardSegue) {
        
        doData()
    }
    
}
