//
//  ValidatorTests.swift
//  SeSACXCTestTests
//
//  Created by Jooyoung Lee on 2022/11/30.
//

import XCTest
@testable import SeSACXCTest

final class ValidatorTests: XCTestCase {
    var sut: Validator!

    override func setUpWithError() throws {
        sut = Validator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // 뷰컨과 상관없이!
    // 빨리, 다른 테스트에 영향 주면 안되어 '고립'시킨다. 항상 같은 결과가 나와야 한다.(repeatable)
    //네트워크 비동기 테스트...서버가 꺼졌어....
    
    //
    func testValidator_validEmail_returnTrue() throws {
        let user = User(email: "jack@jack.com", password: "1234", check: "1234")
        let valid = sut.isValidEmail(email: user.email)
        XCTAssertTrue(valid)
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
