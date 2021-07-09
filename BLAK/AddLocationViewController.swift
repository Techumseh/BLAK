//
//  AddLocationViewController.swift
//  BLAK
//
//  Created by Jeff Bond on 4/22/21.
//

import UIKit
import MapKit
import Parse

class AddLocationViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var locationMP: MKMapView!
    @IBOutlet weak var locationName: UITextField!
    @IBOutlet weak var locationOwner: UITextField!
    @IBOutlet weak var locationNB: UITextField!
    @IBOutlet weak var locationAddress: UITextField!
    @IBOutlet weak var locationWebsite: UITextField!
    @IBOutlet weak var locationInsta: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let locationManager = CLLocationManager ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    imageView.isUserInteractionEnabled = true
    let gestureReco = UITapGestureRecognizer (target: self, action: #selector(openGallery))

        imageView.addGestureRecognizer(gestureReco)
        
        locationMP.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let reco = UILongPressGestureRecognizer(target: self, action: #selector(chooseLoc))
        reco.minimumPressDuration = 3
       locationMP.addGestureRecognizer(reco)
        
    }
    
    @IBAction func saveDataBTN(_ sender: Any) {
        let locModel = LocationModel(id: UUID(), name: "", owner: "", neighborhood: "", address: "", website: "", instagram: "", lat: 0.0, long: 0.0)
        
        let obj = PFObject(className: "Location")
        obj["name"] = locModel.name
        obj["owner"] = locModel.owner
        obj["neighborhood"] = locModel.neighborhood
        obj["address"] = locModel.address
        obj["website"] = locModel.website
        obj["instagram"] = locModel.instagram
        obj["long"] = locModel.long
        obj["lat"] = locModel.lat
    }
        
    @objc func chooseLoc(gestureReco:UIGestureRecognizer)
    {
        if gestureReco.state == UIGestureRecognizer.State.began{
            let touches = gestureReco.location(in: self.locationMP)
            let coor = self.locationMP.convert(touches, toCoordinateFrom: self.locationMP)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coor
            annotation.title = locationName.text
            annotation.subtitle = locationAddress.text
            self.locationMP.addAnnotation(annotation)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2DMake(locations[0].coordinate.latitude, locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
        
        let region = MKCoordinateRegion(center: location, span: span)
        locationMP.setRegion(region, animated: true)
        
        locationMP.setRegion(region, animated: true)
        
        
    }
    
    
    @objc func openGallery(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker,animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
        
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    }
    


