//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Alison Rose Haugh on 11/19/15.
//  Copyright © 2015 Alison Haugh. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {

    @IBOutlet weak var urlInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.urlInput.text = "http://tednewardsandbox.site44.com/questions.json"
    }
    
    @IBAction func getQuestions(sender: AnyObject) {
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let newUrl = self.urlInput.text
        
        let url = NSURL(string: newUrl!)
        
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            // let statusCode = (response as! NSHTTPURLResponse).statusCode
            
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            defaults.setObject(data, forKey: "quizData")
            
        }
        
        task.resume()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
