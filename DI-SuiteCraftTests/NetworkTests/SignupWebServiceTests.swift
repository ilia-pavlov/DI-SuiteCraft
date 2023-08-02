//
//  SignupWebServiceTests.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/1/23.
//

import XCTest
@testable import DI_SuiteCraft

class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestMockModel: SignupFormRequestModel!
    
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlMockSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlSession: urlMockSession,
                               urlString: SignupMockUrl.signupURLString.value)
        
        signupFormRequestMockModel = SignupFormRequestModel(firstName: "Bob",
                                                            lastName: "Dylan",
                                                            email: "test@test.com",
                                                            password: "123456")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        signupFormRequestMockModel = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func testGivenSuccessFullResponse() {
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Response expectation")
        
        sut.signup(withForm: signupFormRequestMockModel) { signupResponseModel, error in
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testGivenDifferentJSONResponse() {
        let jsonString = """
        {
          "message": "Data retrieved successfully.",
          "data": {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "isSubscribed": true
          }
        }
        """
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Response contain diff structure")
        
        sut.signup(withForm: signupFormRequestMockModel) { signupResponseModel, error in
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, SignupError.invalidResponseModel)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testEmptyURL() {
        let expectation = self.expectation(description: "An empty URL")
        
        sut = SignupWebService(urlString: "")
        
        sut.signup(withForm: signupFormRequestMockModel) { signupFormResponseModel, error in
            XCTAssertEqual(error, SignupError.invalidRequestURL)
            XCTAssertNil(signupFormResponseModel)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }

}
