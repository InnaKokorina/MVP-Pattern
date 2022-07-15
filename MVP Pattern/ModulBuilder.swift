//
//  ModulBuilder.swift
//  MVP Pattern
//
//  Created by Inna Kokorina on 13.07.2022.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol ) -> UIViewController
    func createDetail(comment: Comment?, router: RouterProtocol) -> UIViewController
}
class ModulBuilder: AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    func createDetail(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
}
