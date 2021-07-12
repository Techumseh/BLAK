//
//  LocationDetailsViewController.swift
//  BLAK
//
//  Created by Jeff Bond on 4/22/21.
//

import UIKit
import MapKit
import Parse

class LocationDetailsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var locationMap: MKMapView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var locationType: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var selectionLocation:LocationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}
