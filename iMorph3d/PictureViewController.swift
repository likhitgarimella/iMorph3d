//
//  PictureViewController.swift
//  iMorph3d
//
//  Created by Likhit Garimella on 03/12/20.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet var picture: UIImageView!
    
    // global variable for selected image
    var selectedImage: UIImage?
    
    // image that appears on screen
    var image: UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image properties
        picture.layer.borderWidth = 1
        picture.layer.borderColor = UIColor.darkGray.cgColor
        picture.layer.masksToBounds = true
        
        // Add gesture for profile image present in screen
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSelectImageView))
        picture.addGestureRecognizer(tapGesture)
        picture.isUserInteractionEnabled = true
        
    }
    
    @objc func handleSelectImageView() {
        
        let pickerController = UIImagePickerController()
        // To get access to selected media files, add delegate
        pickerController.delegate = self
        /// presenting it in full screen bcuz...
        /// i want the view to change...
        /// so that viewWillAppear will work...
        pickerController.modalPresentationStyle = .fullScreen
        // present photo library
        present(pickerController, animated: true, completion: nil)
        
    }
    
}

extension PictureViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Selected image to display it in our profile image
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            // set profile image's imageView to selected image
            picture.image = imageSelected
            // Store this img in an instance variable
            image = imageSelected
        }
        // Original image
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // set profile image's imageView to original image
            picture.image = imageOriginal
            // Store this img in an instance variable
            image = imageOriginal
        }
        
        print("Image selected from library")
        dismiss(animated: true, completion: nil)
        
    }
    
}   // #76
