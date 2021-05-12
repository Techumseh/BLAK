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
    


