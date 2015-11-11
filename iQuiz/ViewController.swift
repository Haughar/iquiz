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
    @IBOutlet weak var settingsBtn: UIBarButtonItem!
    @IBOutlet var listView: UIView!
    @IBOutlet var mathView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier);
        settingsBtn.action = "settingsAlert:";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quizzes.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        let mathViewController = self.storyboard!.instantiateViewControllerWithIdentifier("math-question1") 
        let marvelViewController = self.storyboard!.instantiateViewControllerWithIdentifier("marvel-question1") 
        let scienceViewController = self.storyboard!.instantiateViewControllerWithIdentifier("science-question1")
        
        if (row == 0) {
            self.presentViewController(mathViewController, animated: true, completion: { () -> Void in
                
            })
            //self.navigationController?.pushViewController(mathViewController, animated: true)
        } else if(row == 1) {
            self.presentViewController(marvelViewController, animated: true, completion: { () -> Void in
                
            })
            //self.navigationController?.pushViewController(marvelViewController, animated: true)
        } else {
            self.presentViewController(scienceViewController, animated: true, completion: { () -> Void in
                
            })
            //self.navigationController?.pushViewController(scienceViewController, animated: true)
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!;
        
        cell.textLabel?.text = quizzes[indexPath.row];
        cell.imageView!.image = UIImage(named : quizzes[indexPath.row]);
        cell.detailTextLabel?.text = descriptions[indexPath.row];
        
        return cell
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
