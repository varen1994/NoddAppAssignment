//
//  JsonObjectModel.swift
//  NodApp
//
//  Created by Varender on 30/03/17.
//  Copyright © 2017 Varender. All rights reserved.
//

import UIKit

class Location: NSObject {

    
    var longitude:CGFloat = 0.0;
    var lattitude:CGFloat = 0.0;
    var type:String = "";
    var title:String = "";
    
    func initWithDictionary(dict:NSDictionary){
        self.type = self.parseAndStoreData(data: dict, key: "type");
        self.title = self.parseAndStoreData(data: dict, key: "title");
        let coordinates = self.parseAndStoreData(data: dict,key: "coordinate")
        let array = coordinates.components(separatedBy: ",") as NSArray
        self.longitude = CGFloat((array[0] as! NSString).doubleValue)
        self.lattitude = CGFloat((array[1] as! NSString).doubleValue)
    }

    func parseAndStoreData(data:NSDictionary,key:String)->String  {
        guard let value = data.value(forKey: key)  else {
            return "";
        }
        return value as! String
    }
    
    
    
}
