//
//  ViewController.swift
//  YodaSpeak
//
//  Created by Matthew Nielsen on 3/16/15.
//  Copyright (c) 2015 Matthew Nielsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // two text fields in the UI
    @IBOutlet var englishSentence: UITextField?
    @IBOutlet var yodishSentence: UITextField?
    
    // one button to convert a sentence
    @IBAction func convert() {
        yodishSentence!.text = YodishAPI.request(englishSentence!.text)
    }
    
}
