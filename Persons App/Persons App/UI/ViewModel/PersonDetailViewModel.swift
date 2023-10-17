//
//  PersonDetailViewModel.swift
//  Persons App
//
//  Created by Ahmet Erkut on 17.10.2023.
//

import Foundation

class PersonDetailViewModel {
    
    let pRepo = PersonsDaoRepository()
    
    func personDetailUpdate(person_id: Int, person_name: String, person_phone: String){
        pRepo.personDetailUpdate(person_id: person_id, person_name: person_name, person_phone: person_phone)
    }
    
}
