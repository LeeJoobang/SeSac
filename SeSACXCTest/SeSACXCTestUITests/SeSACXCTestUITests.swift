//
//  SeSACXCTestUITests.swift
//  SeSACXCTestUITests
//
//  Created by Jooyoung Lee on 2022/11/29.
//

import XCTest

final class SeSACXCTestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication() //앱의 실행과 종료를 도와줌
        app.launch()
        
        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("jack@jack.com")
        

//        app.textFields["checkTextField"].tap()
//        app.textFields["passwordTextField"].tap()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    /*
     Code Coverage 코드 커버리지, 테스트 가치
     */
    
    func testLoginExample() throws{
        let app = XCUIApplication() //앱의 실행과 종료를 도와줌
        app.launch()
        
        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("jack@jack.com")
        
        app.textFields["passwordTextField"].tap()
        app.textFields["passwordTextField"].typeText("password")

        app.textFields["checkTextField"].tap()
        app.textFields["checkTextField"].typeText("check check check")

        app.staticTexts["로그인하기"].tap()
        
        let label = app.staticTexts.element(matching: .any, identifier: "descriptionLabel").label
        XCTAssertEqual(label, "로그인 버튼을 눌렀습니다.")

        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
