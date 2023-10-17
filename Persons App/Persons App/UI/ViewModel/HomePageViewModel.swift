//
//  HomePageViewModel.swift
//  Persons App
//
//  Created by Ahmet Erkut on 17.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    
    let pRepo = PersonsDaoRepository()
    var personsList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    init() {
        self.personsList = pRepo.personsList
        reloadPersons()
    }
    
    func personDelete(person_id: Int) {
        pRepo.personDelete(person_id: person_id)
    }
    
    func searchTextDidChange(searchText: String) {
        pRepo.searchTextDidChange(searchText: searchText)
    }
    
    func reloadPersons() {
        pRepo.reloadPersons()
    }
}
