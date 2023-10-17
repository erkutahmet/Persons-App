//
//  RegisterPersonViewModel.swift
//  Persons App
//
//  Created by Ahmet Erkut on 17.10.2023.
//

import Foundation

class RegisterPersonViewModel {
    
    let pRepo = PersonsDaoRepository()
    
    func personRegister(person_name: String, person_phone: String){
        pRepo.personRegister(person_name: person_name, person_phone: person_phone)
    }
    
}
