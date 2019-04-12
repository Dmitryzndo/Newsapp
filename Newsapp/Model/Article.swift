//
//  Article.swift
//  Newsapp
//
//  Created by Dmitry Belousov on 22/03/2019.
//  Copyright © 2019 Dmitry Belousov. All rights reserved.
//

import Foundation

/*
 {
 -"source": {
 "id": null,
 "name": "Coindesk.com"
 },
 "author": "Anna Baydakova",
 "title": "Crypto Lawyer Drew Hinkes Joins Firm to Help ICO Issuers Fight Back",
 "description": "Blockchain lawyer Andrew Hinkes has joined has joined legal services firm Carlton Fields, where he will focus on litigating cases for token sellers.",
 "url": "https://www.coindesk.com/blockchain-lawyer-drew-hinkes-joins-new-firm-to-help-ico-issuers-fight-back",
 "urlToImage": "https://static.coindesk.com/wp-content/uploads/2019/03/Hinkes_Andrew-e1553087378117.jpg",
 "publishedAt": "2019-03-22T12:00:31Z",
 "content": "Blockchain lawyer Andrew Hinkes is spoiling for a fight.\r\nThe general counsel at investment bank Athena Blockchain and an adjunct business and law professor at New York University, Hinkes believes token issuers will soon start pushing back against regulatory … [+3680 chars]"
 }
 */
 



struct Article {
    
    var author : String
    var title : String
    var description : String
    var url : String
    var urlToImage : String
    var publishedAt : String
    var sourceName : String
    init(dictionary : Dictionary<String, Any>) {
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        sourceName = (dictionary["sourse"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String ?? ""
        
    }
    
    
    
}
