//
//  PersonsDaoRepository.swift
//  Persons App
//
//  Created by Ahmet Erkut on 17.10.2023.
//

import Foundation
import RxSwift

class PersonsDaoRepository {
    
    var personsList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    func personRegister(person_name: String, person_phone: String){
        print("Save Person: \(person_name) - \(person_phone)")
    }
    
    func personDetailUpdate(person_id: Int, person_name: String, person_phone: String){
        print("Update Person: \(person_id) - \(person_name) - \(person_phone)")
    }
    
    func personDelete(person_id: Int) {
        print("Delete Person: \(person_id)")
        reloadPersons()
    }
    
    func searchTextDidChange(searchText: String) {
        print("Search: \(searchText)")
    }
    
    func reloadPersons() {
        var list = [Persons]()
        let p1 = Persons(person_id: 1, person_name: "Erkut", person_phone: "1111111")
        let p2 = Persons(person_id: 2, person_name: "Zeynep", person_phone: "2222222")
        let p3 = Persons(person_id: 3, person_name: "Kübra", person_phone: "3333333")
        list.append(p1)
        list.append(p2)
        list.append(p3)
        personsList.onNext(list) //trigger
    }
}
