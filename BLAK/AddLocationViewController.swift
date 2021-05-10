//
//  AddLocationViewController.swift
//  BLAK
//
//  Created by Jeff Bond on 4/22/21.
//

import UIKit
import MapKit

class AddLocationViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var locationMP: MKMapView!
    @IBOutlet weak var locationName: UITextField!
    @IBOutlet weak var locationOwner: UITextField!
    @IBOutlet weak var locationNB: UITextField!
    @IBOutlet weak var locationAddress: UITextField!
    @IBOutlet weak var locationWebsite: UITextField!
    @IBOutlet weak var locationInsta: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    imageView.isUserInteractionEnabled = true
    let gestureReco = UITapGestureRecognizer (target: self, action: #selector(openGallery))
    

       
    }
    @objc func openGallery(){
        
    }
    }
    


