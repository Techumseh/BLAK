//
//  AddLocationViewController.swift
//  BLAK
//
//  Created by Jeff Bond on 4/22/21.
//

import UIKit
import MapKit

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
        
        //let reco = UILongPressGestureRecognizer(target: self, action: #selector(chooseLoc))
        
    }
    
    @objc func chooseloc(){
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2DMake(locations[0].coordinate.latitude, locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
        
        let region = MKCoordinateRegion(center: location, span: span)
        locationMP.setRegion(region, animated: true)
        
        
    }
    
    
    @objc func openGallery(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
        
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    }
    


