//
//  SeSACXCTestTests.swift
//  SeSACXCTestTests
//
//  Created by Jooyoung Lee on 2022/11/29.
//

import XCTest
@testable import SeSACXCTest // target이 다르니까 가져와 사용한다. 접근제어를 public으로 풀어야 사용할 수 있다!!(매우 중요) @testable 어트리뷰트를 사용하면 굳이 접근제어를 풀지 않아도 사용할 수 있다!!!

final class SeSACXCTestTests: XCTestCase {

    var sut: LoginViewController! //system under test 테스트를 하고자 하는 클래스를 정의할 때 사용!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        sut.loadViewIfNeeded() // 스토리보드 및 @iboutlet 시에 필요
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil // instance 값이 남아있지 않고 영향을 주지 않도록, tearDown에서 nil, 초기화 시켜줘야 한다.
    }
    //이메일 유효성 테스트, snakeCase를 쓴다.
    //TDD - Arrange, Act, Assert
    //BDD = Given, When, Then
    func testLoginViewController_validEmail_returnTrue() throws {
        // 테스트 객체: given, Arrange
        sut.emailTextField.text = "jack@jack.com"
        // 테스트 조건 / 행동: when, Act
        let valid = sut.isValidEmail()
        // 테스트 결과: then, Assert
        XCTAssertTrue(valid) // test 성공
    }
    
    func testLoginViewController_inValidPassword_returnFalse() throws {
        sut.passwordTextField.text = "1234"
        let valid = sut.isValidPassword()
        XCTAssertFalse(valid) // false라고 해서 테스트 실패하는 건 아니다.
    }
    
    func testLoginViewController_emailTextField_returnNil() throws {
        sut.emailTextField = nil
        let value = sut.emailTextField
        XCTAssertNil(value)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
