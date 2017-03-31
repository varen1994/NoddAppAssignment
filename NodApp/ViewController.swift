//
//  ViewController.swift
//  NodApp
//
//  Created by Varender on 30/03/17.
//  Copyright © 2017 Varender. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    var objJson = Locations();
    @IBOutlet  var mapView: UIView!
    var objGooglmap:GMSMapView? = nil
  
    override func viewDidLoad() {
        super.viewDidLoad()
            let objJsonObject = objJson.arrayAnnotationsObject[0] as! Location
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(objJsonObject.lattitude), longitude: CLLocationDegrees(objJsonObject.longitude), zoom: 6.0)
        objGooglmap = GMSMapView.map(withFrame:self.mapView.bounds, camera: camera)
        self.mapView.addSubview(objGooglmap!)
        self.parseAndAddNewAnnotation(stringType: "");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

    @IBAction func filterButtonClicked(_ sender: Any) {
        let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet);
        let alertActionExclusiveEvents = UIAlertAction.init(title: "Exclusive Events", style: .default) { (true) in
              self.parseAndAddNewAnnotation(stringType: "ex");
        }
        
        let alertActionNormalEvents = UIAlertAction.init(title: "Normal Events", style: .default) { (true) in
              self.parseAndAddNewAnnotation(stringType: "ev");
        }
        
        let alertActionPeople = UIAlertAction.init(title: "People", style: .default) { (true) in
              self.parseAndAddNewAnnotation(stringType: "pe");
        }
        
        let alertActionAll = UIAlertAction.init(title: "All", style: .default) { (true) in
             self.parseAndAddNewAnnotation(stringType: "");
        }
       alertController.addAction(alertActionExclusiveEvents)
       alertController.addAction(alertActionPeople)
       alertController.addAction(alertActionNormalEvents)
       alertController.addAction(alertActionAll)
       self.present(alertController, animated: true, completion: nil);
    }
    
    
    
    func parseAndAddNewAnnotation(stringType:String) {
        var predicate:NSPredicate? = nil
        var filteredArray = NSArray();
        if(stringType.characters.count != 0)  {
           predicate = NSPredicate.init(format: "type MATCHES[cd] %@", stringType);
          filteredArray = objJson.arrayAnnotationsObject.filtered(using: predicate!) as NSArray;
        }
        else {
            filteredArray = self.objJson.arrayAnnotationsObject
        }
        
        objGooglmap?.clear()
        for obj  in filteredArray  {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees((obj as AnyObject).lattitude), longitude: CLLocationDegrees((obj as AnyObject).longitude))
            marker.title = (obj as AnyObject).title
            marker.snippet = (obj as AnyObject).type
            switch marker.snippet! {
            case "ev":
                marker.icon = UIImage.init(named:"ic_qu_direction_mylocation");
                break
                
            case "pe":
                  marker.icon = UIImage.init(named:"ic_compass_needle");
                break
                
            default:
                
                break;
            }
            marker.map = objGooglmap
        }
    }
}








