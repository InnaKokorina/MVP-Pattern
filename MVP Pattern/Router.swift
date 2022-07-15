//
//  RouterProtocol.swift
//  MVP Pattern
//
//  Created by Inna Kokorina on 14.07.2022.
//

import Foundation
import UIKit
protocol RouterMain {
    var navigationController : UINavigationController? {get set}
    var assemblyBuilder: AssemblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetailViewController(comment: Comment?)
    func popToRoot()
}
class Router: RouterProtocol {
    var navigationController : UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol ) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMain(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetailViewController(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetail(comment: comment, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
     
}
