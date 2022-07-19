//
//  RouterTest.swift
//  MVP PatternTests
//
//  Created by Inna Kokorina on 19.07.2022.
//

import XCTest
@testable import MVP_Pattern

class MockNavigationController: UINavigationController {
    var presenterVC: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presenterVC = viewController
        super.pushViewController(viewController, animated: true)
    }
}

class RouterTest: XCTestCase {
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly =  ModulBuilder()

    override func setUpWithError() throws {
        
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }
    func testRouter() {
        router.showDetailViewController(comment: nil)
        let detailVC = navigationController.presenterVC
        XCTAssertTrue(detailVC is DetailViewController)
    }
}
