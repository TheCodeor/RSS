//
//  Channel.swift
//  RSS
//
//  Created by fanpeng on 17/4/11.
//  Copyright © 2017年 fanpeng. All rights reserved.
//

import Foundation
import SWXMLHash

struct Channel:XMLIndexerDeserializable {
    let title: String
    let link: String
    let description: String
    let atom_link: String
    let language: String
    let copyright: String
    let lastBuildDate: String
    let ttl: Int
    let items: [Item]
    
    static func deserialize(_ node: XMLIndexer) throws -> Channel {
        return try Channel(
            title: node["title"].value(),
            link: node["link"].value(),
            description: node["description"].value(),
            atom_link: node["atom:link"].value(ofAttribute:"href"),
            language: node["language"].value(),
            copyright: node["copyright"].value(),
            lastBuildDate: node["lastBuildDate"].value(),
            ttl: node["ttl"].value(),
            items: node["item"].value()
        )
    }
    
    
}
struct Item:XMLIndexerDeserializable {
    let title: String
    let link: String
    let description: String
    let pubDate: String
    let creator: String
    let guid: String
    
    static func deserialize(_ node: XMLIndexer) throws -> Item {
        return try Item(
            title: node["title"].value(),
            link: node["link"].value(),
            description: node["description"].value(),
            pubDate: node["pubDate"].value(),
            creator: node["dc:creator"].value(),
            guid: node["guid"].value()
        )
    }
}
