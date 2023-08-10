//
//  LoadingXIBBasedVCTests.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/9/23.
//

import XCTest
@testable import DI_SuiteCraft

final class LoadingXIBBasedVCTests: XCTestCase {

    var sut: XIBBasedVC!
    
    override func setUpWithError() throws {
        sut = XIBBasedVC()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSMT() { }
}
