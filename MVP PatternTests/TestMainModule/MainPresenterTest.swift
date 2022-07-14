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
        self.titleTest = error.localizedDescription
    }
    
    var titleTest: String?
    
    
}
class MainPresenterTest: XCTestCase {
    var view: MockView!
    var comment: Comment!
    var presenter: MainPresenter!
    var networkService: NetworkService!
    
    override func setUpWithError() throws {
        view = MockView()
        comment = Comment(postId: 1, id: 1, name: "Baz", email: "Bar", body: "BazBar")
        networkService = NetworkService()
        presenter = MainPresenter(view: view, networkService: networkService)
    }

    override func tearDownWithError() throws {
        view = nil
        comment = nil
        presenter = nil
    }
    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "View is not nil")
        XCTAssertNotNil(comment, "Comment is not nil")
        XCTAssertNotNil(presenter, "Presenter is not nil")
    }
//    func testView() {
//        presenter.getComments()
//        XCTAssertEqual(view.titleTest, "Hello Baz Bar")
//    }
    func testPersonModel() {
        XCTAssertEqual(comment.name, "Baz")
        XCTAssertEqual(comment.email, "Bar")
    }
}
