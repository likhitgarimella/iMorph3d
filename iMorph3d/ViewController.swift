//
//  ViewController.swift
//  iMorph3d
//
//  Created by Likhit Garimella on 03/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet var countryCode: DropDown!
    @IBOutlet var mobileNumber: UITextField!
    
    func BorderProp() {
        
        // Textfield Border Property
        let myColor = UIColor.lightGray
        countryCode.layer.borderColor = myColor.cgColor
        countryCode.layer.borderWidth = 1.0
        mobileNumber.layer.borderColor = myColor.cgColor
        mobileNumber.layer.borderWidth = 1.0
        
    }
    
    func CornerRadius() {
        
        // Textfield Corner Radius Property
        countryCode.layer.cornerRadius = 6
        mobileNumber.layer.cornerRadius = 6
        
    }
    
    func LeftPadding() {
        
        // Create a padding view for Textfields on LEFT
        countryCode.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: countryCode.frame.height))
        countryCode.leftViewMode = .always
        mobileNumber.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: mobileNumber.frame.height))
        mobileNumber.leftViewMode = .always
        
    }
    
    func DropDownOptions() {
        
        // DropDown Options For TextField
        countryCode.optionArray = ["+91", "+92", "+93", "+94", "+95"]
        countryCode.selectedRowColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        BorderProp()
        CornerRadius()
        LeftPadding()
        DropDownOptions()
        
    }
    
    @IBAction func sendTapped(_ sender: UIButton) {
        
        if (countryCode.text!.isEmpty || mobileNumber.text!.isEmpty) {
            // Alert for empty fields
            let myAlert = UIAlertController(title: "Invalid", message: "Please enter your phone number", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
        self.performSegue(withIdentifier: "goToOtp", sender: self)
        
    }
    
}

// Dismiss keyboard on tapping anywhere
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}   // #95
