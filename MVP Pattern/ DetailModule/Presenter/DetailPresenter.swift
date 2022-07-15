//
//  DetailPresenter.swift
//  MVP Pattern
//
//  Created by Inna Kokorina on 14.07.2022.
//

import Foundation
protocol DetailViewProtocol: class {
    func showComment(comment: Comment?)
}
protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tapBack()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol!
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    let comment: Comment?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol,router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    func setComment() {
        view?.showComment(comment: comment)
    }
    
    func tapBack() {
        router?.popToRoot()
    }
}
