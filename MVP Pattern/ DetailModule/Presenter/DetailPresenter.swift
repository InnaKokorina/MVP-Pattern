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
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?)
    func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol!
    let networkService: NetworkServiceProtocol!
    let comment: Comment?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    func setComment() {
        view?.showComment(comment: comment)
    }
}
