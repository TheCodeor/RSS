//
//  LibraryAPI.swift
//  RSS
//
//  Created by fanpeng on 17/4/11.
//  Copyright © 2017年 fanpeng. All rights reserved.
//

import Foundation
import SWXMLHash

class LibraryAPI {
    
    class var sharedInstance: LibraryAPI {
        struct Singleton {
            static let instance = LibraryAPI()
        }
        return Singleton.instance
    }
    
    func getChannel() -> [Channel] {
        let path = Bundle.main.path(forResource: "rss.xml", ofType: nil)
        let string = try! String(contentsOfFile: path!, encoding: .utf8)
        let xml = SWXMLHash.parse(string)
        let channel: [Channel] = try! xml["rss"]["channel"].value()
        return channel
    }
}
