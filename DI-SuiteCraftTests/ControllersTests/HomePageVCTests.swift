//
//  HomePageVCTests.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/9/23.
//

import XCTest
@testable import DI_SuiteCraft

final class HomePageVCTests: XCTestCase {

    var sut: HomePageVC!
    
    override func setUpWithError() throws {
        sut = HomePageVC()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {}
}
