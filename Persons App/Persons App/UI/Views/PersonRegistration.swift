//
//  PersonRegistrationViewController.swift
//  Persons App
//
//  Created by Ahmet Erkut on 14.10.2023.
//

import UIKit

class PersonRegistration: UIViewController {

    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var personPhoneTextField: UITextField!
    
    let registerPersonVM = RegisterPersonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        if let personName = personNameTextField.text, let personPhone = personPhoneTextField.text {
            let person_name = personName.replacingOccurrences(of: " ", with: "")
            let person_phone = personPhone.replacingOccurrences(of: " ", with: "")
            
            if person_name != String() && person_phone != String() {
                let pName = personName.trimmingCharacters(in: .whitespaces)
                let pPhone = personPhone.trimmingCharacters(in: .whitespaces)
                registerPersonVM.personRegister(person_name: pName,
                                                person_phone: pPhone)
                navigationController?.popToRootViewController(animated: true)
            } else {
                let alertController = UIAlertController(title: "Error", message: "Please check fields!", preferredStyle: .alert)
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                    alertController.dismiss(animated: true, completion: nil)
                }
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
