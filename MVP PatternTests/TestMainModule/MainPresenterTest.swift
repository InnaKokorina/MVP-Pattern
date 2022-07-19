//
//  MainPresenterTest.swift
//  MVP PatternTests
//
//  Created by Inna Kokorina on 13.07.2022.
//

import XCTest
@testable import MVP_Pattern

class MockView: MainViewProtocol {
    func success() {
    }
    
    func failure(error: Error) {
    }

}
class MockNetworkService: NetworkServiceProtocol {
    var comments: [Comment]!
    init() {}
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    func getComments(completion: @escaping (Result<[Comment], Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
    
}
class MainPresenterTest: XCTestCase {
    var view: MockView!
    var comments = [Comment]()
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    
    override func setUpWithError() throws {
        let nav = UINavigationController()
        let assambly = ModulBuilder()
        router = Router(navigationController: nav, assemblyBuilder: assambly)
    }

    override func tearDownWithError() throws {
        view = nil
        networkService = nil
        presenter = nil
    }
    func testGetSuccessComment() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        comments.append(comment)
        view = MockView()
        networkService = MockNetworkService(comments: [comment])
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        var catchComment: [Comment]?
        networkService.getComments { result in
            switch result {
            case .success(let comments) :
                catchComment = comments
            case.failure(let error):
                print(error)
            }
        }
        XCTAssertNotEqual(catchComment?.count, 0 )
        XCTAssertEqual(catchComment?.count, comments.count)
    }
    
}
