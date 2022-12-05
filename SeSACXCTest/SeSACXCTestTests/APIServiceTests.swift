//
//  APIServiceTests.swift
//  SeSACXCTestTests
//
//  Created by Jooyoung Lee on 2022/12/01.
//

import XCTest
@testable import SeSACXCTest

final class APIServiceTests: XCTestCase {

    var sut: APIService!
    
    override func setUpWithError() throws {
        sut = APIService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        
        sut.number = 100 //요렇게 하면 셀프넘버는 바로 처리된다.
        
        sut.callRequest { value in // 비동기가 처리가 안되고, 동기적으로 처리한다. 아무 문제가 없다고 표시된다. 다음 메서드를 통해 동기적 문제를 해결해보자.
            XCTAssertLessThanOrEqual(value, 45) // value 값이 45보다 작거나 같은지 확인하는 것이다.
            XCTAssertGreaterThanOrEqual(value, 1)
            print("call requset")
        }
        print("test Example end")
    }
    
    //비동기: expectation, fulfill, wait
    /*
     네트워크: 아이폰 네트워크 응답 x, api 서버점검, api 지연...? >>
     효율성/속도/같은조건에서 테스트를 해야 하는데, 그 조건이 깨짐.
     테스트 대상이 외부와 격리되어 있지 않은 상황, 예측 불가능한 상황을 만들면 안된다. 외부에 영향을 받는 테스트는 좋은 테스트가 아니다.
     이 조건을 지키는 것은 어렵기 때문에
     => 어떤 개념? 실제 네트워크 동작이 되는 것처럼 보이게 별개의 객체를 만듦.
     => 테스트 더블(test double): (ex: 스턴트맨들이 연기하는 것처럼 이런 현상을 스턴트 더블이라고 한다. 거기서 따온 것이다.) 테스트 코드랑 상호작용할 수 있는 가짜 객체 생성
        => 종류: dummy, mock, fake, stub, spy...
     
     */
    // 비동기는 응답오는데 시간이 걸리니까 타임아웃을 걸어서 100번 반복을 진행한다.

    func test_APILottoResponse_AsyncCover() throws {
        print("text Example start")
        
        //1. expectation
        let promise = expectation(description: "로또 넘버 응답 올 때까지 기다리는 거임.")
        
        sut.number = 33 //요렇게 하면 셀프넘버는 바로 처리된다.

        sut.callRequest { value in // 비동기가 처리가 안되고, 동기적으로 처리한다. 아무 문제가 없다고 표시된다. 다음 메서드를 통해 동기적 문제를 해결해보자.
            XCTAssertLessThanOrEqual(value, 45) // value 값이 45보다 작거나 같은지 확인하는 것이다.
            XCTAssertGreaterThanOrEqual(value, 1)
            print("call requset")
            promise.fulfill() // expectation으로 정의된 테스트 조건을 충족한다. 만약 2초 안에 끝나면 그때 48줄의 메소드가 호출되어 끝나게 된다.
        }
        print("test Example end")
        
        wait(for: [promise], timeout: 5) // XCTestExpectation타입의 값을 넣고 5초간 기다리는 것이다. 5초간 끝나지 않기 때문에 callrequest method를 기다리는 것이다.
        
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
