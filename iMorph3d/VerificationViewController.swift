//
//  VerificationViewController.swift
//  iMorph3d
//
//  Created by Likhit Garimella on 03/12/20.
//

import UIKit
import OTPFieldView

class VerificationViewController: UIViewController, OTPFieldViewDelegate {
    
    @IBOutlet var otpTextFieldView: OTPFieldView!
    
    func setupOtpView() {
        
        self.otpTextFieldView.fieldsCount = 4
        self.otpTextFieldView.fieldBorderWidth = 1
        self.otpTextFieldView.defaultBorderColor = UIColor.white
        self.otpTextFieldView.filledBorderColor = UIColor.darkGray
        self.otpTextFieldView.cursorColor = UIColor.red
        self.otpTextFieldView.displayType = .roundedCorner
        self.otpTextFieldView.fieldSize = 40
        self.otpTextFieldView.separatorSpace = 8
        self.otpTextFieldView.shouldAllowIntermediateEditing = false
        self.otpTextFieldView.delegate = self
        self.otpTextFieldView.initializeUI()
        
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
    }
    
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        hideKeyboardWhenTappedAround()
        setupOtpView()
        
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}   // #62
