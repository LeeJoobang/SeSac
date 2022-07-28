import Foundation
import UIKit
/*
 ~~~~~Protocol
 ~~~~~Delegate
 */
// 보통 중괄호 안에 기능을 작성하는데? 공통적으로 사용할 네이밍만 사용한다. 목차를 사용하는 것이다. 실질적인 구현부는 각 뷰컨에서 작성한다.
// 프로토콜을 채택, 준수한 타입이 구현한다. (뷰 컨트롤러)
// 클래스, 구조체, 익스텐션, 열거형....사용가능하다.
// 클래스는 단일 상속, 프로토콜은 채택할수 있는 갯수의 제한이 없다.
// @objc optional -> 선택적 요청(optional requirement)
// 프로토콜(프로퍼티, 메소드)
// 프로토콜 프로퍼티: 연산 프로퍼티, 저장 프로퍼티 상관하지 않는다. didset getset 을 쓰던 상관없다.
// 무조건 var로 선언해야 한다.
// 만약에 get을 명시했다면, get기능만 최소한 구현이 되어 있으면 된다. +a 로 set이 되는 것은 상관없다. 그래서 필요하다면 set도 구현해도 괜찮다.


@objc
protocol ViewPresentableProtocol{
    
    var navigationTitleString: String { get set }
    var backgroundColor: UIColor { get }
    static var identifier: String { get }


    func configureView()
    @objc optional func configureLabel()
    @objc optional func configureTextField()
    
}

/*
 ex) tableview
 */

@objc
protocol JackTableViewProtocol {
    func numberOfRowsInSection() -> Int
    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell
    @objc optional func didSelectRowAt()
}

