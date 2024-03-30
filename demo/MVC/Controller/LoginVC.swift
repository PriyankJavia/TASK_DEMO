//
//  ViewController.swift
//  demo
//
//  Created by Priyank Javia on 30/03/24.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    //MARK: Outlets
    @IBOutlet weak var txtFieldPhoneNo: UITextField!
    
    @IBOutlet weak var txtFieldPwd: UITextField!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldPwd.delegate = self
        txtFieldPhoneNo.delegate = self
        velidateTextField()
        // Do any additional setup after loading the view.
    }
    
    //MARK: IBActions
    @IBAction func btnSubmitTapped(_ sender: Any) {
        let listVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListingVC") as! ListingVC
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    //MARK: Other functions
    func velidateTextField(){
        self.txtFieldPhoneNo.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.txtFieldPwd.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == "" || txtFieldPwd.text == "" || txtFieldPhoneNo.text == ""{
            btnSubmit.isEnabled = false
            btnSubmit.alpha = 0.5
        }else if ((textField.text?.isValidPassword) != nil) && ((textField.text?.isPhoneNumber) != nil){
            btnSubmit.isEnabled = ((textField.text?.isValidPassword) != nil)
            btnSubmit.alpha = ((textField.text?.isValidPassword) != nil) ? 1 : 0.5
        }
    }
}
