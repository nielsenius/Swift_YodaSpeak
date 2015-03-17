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
        var sentence = sentence.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
        let url = NSURL(string: "https://yoda.p.mashape.com/yoda?sentence=\(sentence)")
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.HTTPAdditionalHeaders = ["X-Mashape-Key" : "b6DXOx972SmshhUwaSS3Luzg7dpqp16hL3WjsnlCVM8MOFW8x5", "Accept" : "text/plain"]
        let session = NSURLSession(configuration: config)
        
        session.dataTaskWithURL(url!) {
            (let data, let response, let error) in
            if let httpResponse = response as? NSHTTPURLResponse {
                println(NSString(data: data, encoding: NSUTF8StringEncoding)!)
            }
        }.resume()
        return "Test"
    }
    
}

