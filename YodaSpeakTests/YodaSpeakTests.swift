//
//  YodaSpeakTests.swift
//  YodaSpeakTests
//
//  Created by Matthew Nielsen on 3/16/15.
//  Copyright (c) 2015 Matthew Nielsen. All rights reserved.
//

import Quick
import Nimble
import YodaSpeak

class YodaSpeakSpec: QuickSpec {
    override func spec() {
        
        describe("YodishAPI") {
            
            describe("error handling") {
                
                it("checks for empty input") {
                    let blankRequest = YodishAPI.request("")
                    expect(blankRequest).to(equal("ERROR: sentence provided is blank"))
                    expect(blankRequest).notTo(equal(""))
                }
                
                it("checks for a valid response") {
                    expect(YodishAPI.request("This is a test.")).notTo(equal("ERROR: API request failed; make sure the URL is correct"))
                }
                
                it("checks for correct API key") {
                    expect(YodishAPI.request("This is a test.")).notTo(equal("ERROR: API key is not valid"))
                }
                
            }
            
            describe("sentence conversion") {
                
                // NOTE: due to the random nature of the API, these tests may fail
                it("converts a sentence from English to Yodish") {
                    expect(YodishAPI.request("This is a test.")).to(equal("Test, this is.  "))
                    expect(YodishAPI.request("My name is Yoda.")).to(equal("Yoda, my name is.  "))
                    expect(YodishAPI.request("How is it going?")).to(equal("How going is it, hmm?  "))
                }
                
            }
            
        }
        
    }
    
}
