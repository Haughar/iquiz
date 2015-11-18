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
    let quizzes = ["Math", "Marvel", "Science"];
    let descriptions = ["A quiz about how good you are at math.", "A quiz about how well you know the super heroes of Marvel.", "A quiz about how good you are at science."];
    let cellIdentifier = "tableCell";
    @IBOutlet weak var settingsBtn: UIBarButtonItem!;
    var quizSelected : String!;
    let mathQs : [String] = ["Math Question 1", "Math Question 2", "Math Question 3"];
    let mathAs : [String] = ["A", "C", "D"];
    let mathFillers : [[String]] = [["A", "B", "C", "D"], ["A", "B", "C", "D"], ["A", "B", "C", "D"]];
    
    let marvelQs : [String] = ["Marvel Question 1", "Marvel Question 2", "Marvel Question 3"];
    let marvelAs : [String] = ["C", "D", "A"];
    let marvelFillers : [[String]] = [["A", "B", "C", "D"], ["A", "B", "C", "D"], ["A", "B", "C", "D"]];
    
    let scienceQs : [String] = ["Science Question 1", "Science Question 2", "Science Question 3"];
    let scienceAs : [String] = ["B", "A", "B"];
    let scienceFillers : [[String]] = [["A", "B", "C", "D"], ["A", "B", "C", "D"], ["A", "B", "C", "D"]];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // put call to method that does http request here)
        let url = NSURL(string: "http://tednewardsandbox.site44.com/questions.json")!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                // when task does return data
                print(urlContent)
                
            } else {
                
                // When task does not return a data
                
            }
            
        }
        task.resume()
            
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier);
        settingsBtn.action = "settingsAlert:";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueToQuestion") {
            let questionVC = segue.destinationViewController as! QuestionViewController;
            if (self.quizSelected == "Math") {
                questionVC.quiz = Quiz(questions: self.mathQs, answers: self.mathAs, fillers: self.mathFillers);
            } else if (self.quizSelected == "Marvel") {
                questionVC.quiz = Quiz(questions: self.marvelQs, answers: self.marvelAs, fillers: self.marvelFillers);
            } else {
                questionVC.quiz = Quiz(questions: self.scienceQs, answers: self.scienceAs, fillers: self.scienceFillers);
            }
            
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
        
        cell.textLabel?.text = self.quizzes[indexPath.row];
        cell.imageView!.image = UIImage(named : self.quizzes[indexPath.row]);
        cell.detailTextLabel?.text = self.descriptions[indexPath.row];
        
        return cell;
    }
    
    func settingsAlert(sender: UIBarButtonItem) {
        let settingsController = UIAlertController(title: "Settings", message: "Settings will be here", preferredStyle: .Alert)
        let OKButtonAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            
        }
        settingsController.addAction(OKButtonAction);
        self.presentViewController(settingsController, animated: true) {
            
        }
    }
    
}
