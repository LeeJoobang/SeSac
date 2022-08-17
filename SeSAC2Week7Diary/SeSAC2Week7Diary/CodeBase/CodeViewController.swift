import UIKit

/*
 공통
 1. 뷰객체 프로퍼티 선언, 클래스의 인스턴스 생성
 2. 명시적으로 루트뷰에 추가
 3. 크기와 위치 및 속성 정리
    => Frame 기반(iphone 5)
        => AutoResizingMask, AutoLayout 등장!
        => NSLayoutConstrains 제약조건을 설정했었군?
 */


class CodeViewController: UIViewController {

    //1. 뷰객체 프로퍼티 선언. 클래스의 인스턴스를 생성
    let emailTextField = UITextField()
    
    //4. uitextfiled 패스워드
    let passwordTextField = UITextField()
    
    //8. signButton추가
    let signButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2. 명시적으로 루트뷰에 추가한다.
        view.addSubview(emailTextField)
        //5. password 루트뷰 추가
        view.addSubview(passwordTextField)
        //9. add subView = button
        view.addSubview(signButton)
        
        //3. 크기와 위치 및 속성 정의, frame 기반
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        emailTextField.borderStyle = .line
        emailTextField.backgroundColor = .lightGray
        
        //6. NSLayoutConstraints, .isActive = true는 활성화이다.
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .lightGray
        
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
        
        //7. NSLayoutConstraints - addConstraints, 6번에서 적용한 isActive를 해제한다.
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100)
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50)
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        view.addConstraints([top, leading, trailing, height])
         
        //10. NSlayoutAnchor - constraint말고, anchor로 사용해야 한다.
        signButton.translatesAutoresizingMaskIntoConstraints = false // autoresizing이 default, true가 들어가 있으니 autolayout을 쓰기 위해서 애를 false로 바꿔야 한다.
        signButton.backgroundColor = .red
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        //11. snapkit - 사용
        
    }

}


