//
//  JsonObjectModel.swift
//  NodApp
//
//  Created by Varender on 30/03/17.
//  Copyright © 2017 Varender. All rights reserved.
//

import UIKit

class Locations: NSObject {
    
    var arrayAnnotationsObject = NSMutableArray();
    var jsonResponse:NSDictionary =  [
        "data":
            [
                [
                    "type": "ex",
                    "coordinate": "19.0760,73.8777", "title": "Awesome Event 1"
                ],
                [
                    "type": "pe",
                    "coordinate": "19.0760,73.2777", "title": "Awesome Event 2"
                ],
                [
                    "type": "ev",
                    "coordinate": "19.0760,72.4777", "title": "Awesome Event 3"
                ],
                [
                    "type": "ex",
                    "coordinate": "19.0760,72.3777", "title": "Awesome Event 4"
                ],
                [
                    "type": "pe",
                    "coordinate": "19.0760,72.1777", "title": "Awesome Event 5"
                ],
                [
                    "type": "ev",
                    "coordinate": "19.0760,72.4777", "title": "Awesome Event 5"
                ],
                [
                    "type": "ex",
                    "coordinate": "19.0760,72.5777", "title": "Awesome Event 6"
                ],
                [
                    "type": "pe",
                    "coordinate": "19.0760,72.9777", "title": "Awesome Event 7"
                ],
                [
                    "type": "ev",
                    "coordinate": "19.1760,72.8777", "title": "Awesome Event 8"
                ],
                [
                    "type": "ex",
                    "coordinate": "19.4760,72.8777", "title": "Awesome Event 9"
                ],
                [
                    "type": "pe",
                    "coordinate": "19.5760,72.8777","title": "Awesome Event 10"
                ],
                [
                    "type": "ev",
                    "coordinate": "19.3760,72.8777", "title": "Awesome Event 11"
                ]
        ]
    ];
    
    
    override init() {
          let arrayData = jsonResponse.object(forKey:"data") as! NSArray;
        for dict in arrayData {
            let jsonSingleObject = Location()
            jsonSingleObject.initWithDictionary(dict: dict as! NSDictionary)
            self.arrayAnnotationsObject.add(jsonSingleObject);
        }
    }
}
