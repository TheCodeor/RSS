//
//  RSSTests.swift
//  RSSTests
//
//  Created by fanpeng on 17/4/10.
//  Copyright © 2017年 fanpeng. All rights reserved.
//

import XCTest
import SWXMLHash
@testable import RSS

class RSSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let path = Bundle.main.path(forResource: "rss.xml", ofType: nil)
        XCTAssertNotNil(path,"没有找到文件")
        
        let html = try! String(contentsOfFile: path!, encoding: .utf8)
        let xml = SWXMLHash.parse(html)
        // one root element
        _ = xml["rss"].all.count
        let items = xml["rss"]["channel"]["item"][0]["title"].element?.text
        print(items as Any)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
