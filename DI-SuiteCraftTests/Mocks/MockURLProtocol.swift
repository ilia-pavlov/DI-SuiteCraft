//
//  MockURLProtocol.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/1/23.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let requestError = MockURLProtocol.error {
            if let errorDescription = (requestError as? LocalizedError)?.errorDescription {
                let nsError = NSError(domain: "MockURLProtocol", code: 1,
                                      userInfo: [NSLocalizedDescriptionKey: errorDescription])
                self.client?.urlProtocol(self, didFailWithError: nsError)
            }
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
            
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
