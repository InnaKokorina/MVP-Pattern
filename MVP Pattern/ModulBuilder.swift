//
//  ModulBuilder.swift
//  MVP Pattern
//
//  Created by Inna Kokorina on 13.07.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}
class ModulBuilder: Builder {
    static func createMain() -> UIViewController {
        let model = Person(firstName: "David", lastName: "Blaine")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
