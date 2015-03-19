//
//  Converter.swift
//  YodaSpeak
//
//  Created by Matthew Nielsen on 3/16/15.
//  Copyright (c) 2015 Matthew Nielsen. All rights reserved.
//

import Foundation

class YodishAPI {
    
    class func request(sentence: String) -> NSString {
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
        var reply = NSString(data: data!, encoding: NSUTF8StringEncoding)
        
        return reply!
    }
    
}
