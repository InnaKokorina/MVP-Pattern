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
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
