//
//  Presenter.swift
//  MVP Pattern
//
//  Created by Inna Kokorina on 12.07.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}
protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Hello" + " " + person.firstName + " " + person.lastName
        view.setGreeting(greeting: greeting)
    }
    
}
