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
    static func createDetail(comment: Comment?) -> UIViewController
}
class ModulBuilder: Builder {
   
    static func createMain() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    static func createDetail(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
    
}
