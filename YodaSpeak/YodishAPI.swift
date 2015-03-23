//
//  Converter.swift
//  YodaSpeak
//
//  Created by Matthew Nielsen on 3/16/15.
//  Copyright (c) 2015 Matthew Nielsen. All rights reserved.
//

import Foundation

class YodishAPI {
    
    class func request(sentence: String) -> String {
        // check that the sentence is not blank
        if sentence == "" {
            return "ERROR: sentence provided is blank"
        }
        
        // replaces spaces with + for API call
        var sentence = sentence.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        // setup the HTTP request
        let url = NSURL(string: "https://yoda.p.mashape.com/yoda?sentence=\(sentence)")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        request.setValue("b6DXOx972SmshhUwaSS3Luzg7dpqp16hL3WjsnlCVM8MOFW8x5", forHTTPHeaderField: "X-Mashape-Key")
        var response: NSURLResponse?
        var error: NSErrorPointer = nil
        
        // make a synchronous HTTP request
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: error)
        // ensure that the API call was successful
        if data == nil {
            return "ERROR: API request failed; make sure the URL is correct"
        }
        
        // convert the returned data to a string
        var reply = NSString(data: data!, encoding: NSUTF8StringEncoding)
        // check that the returned data is valid
        if reply == "{\"message\":\"Invalid Mashape Key\"}" {
            return "ERROR: API key is not valid"
        } else {
            return String(reply!)
        }
    }
    
}
