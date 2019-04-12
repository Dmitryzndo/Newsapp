//
//  Model.swift
//  Newsapp
//
//  Created by Dmitry Belousov on 22/03/2019.
//  Copyright © 2019 Dmitry Belousov. All rights reserved.
//

import Foundation



var articles : [Article] = []
var urlData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) [0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}




func loadNews (completionHandler: (()->Void)?) {
    
    
    let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-03-11&sortBy=publishedAt&apiKey=0ec813e80fba4ad8b933e6a9024609e7")
    let session = URLSession(configuration : .default)
    
    let downloadTask = session.downloadTask(with: url!) { (urFile, responce, error) in
        if urFile != nil {
          
            //try? FileManager.default.copyItem(at: urFile!, to: urlData)
            try? FileManager.default.replaceItemAt(urlData, withItemAt: urFile!)
            
            parseNews()
            completionHandler?()
           
            
            
            
        }
    }
    
    downloadTask.resume()
}






func parseNews() {
    
    let data = try? Data(contentsOf: urlData)
    if data == nil {
        return
    }
   
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String, Any>
    if rootDictionaryAny == nil {
        return
    }
   
     let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return
    }
    
    
    
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        
        var returnArray: [Article] = []
        
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
            
        }
        
        articles = returnArray
    }
    
   
    
}















