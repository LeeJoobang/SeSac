import UIKit
import SnapKit

class CodeSnapViewController: UIViewController {

    let photoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .lightGray
        return view
    }()
    
    let titleTextField: UITextField = { // 뷰 객체를 클로져 형태로 반환하는 것을 많이 사용하고 있다.
        print("TEXTFIELD")
        let view = UITextField()
        view.borderStyle = .line
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요."
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let dateTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "날짜를 입력해주세요."
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let contentTextField: UITextField = {
        let view = UITextField()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        configureUI()
    }
    
    func configureUI(){
        /*
         view.addSubview(photoImageView)
         view.addSubview(titleTextField)
         view.addSubview(dateTextField)
         view.addSubview(contentTextField)
         */
        
        // for -in vs. foreach
        // collection type을 순회하는 기능은 동일하지만, 구현원리나 동작구조가 다르고 따라서 차이점이 존재하낟. 어떤 차이점ㄴ이 있을까?
        [photoImageView, titleTextField, dateTextField, contentTextField].forEach { view.addSubview($0) }
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(view).multipliedBy(0.4)//비율로 잡아주는 방법, 뷰의 높이의 0.4정도로 주겠다는 뜻이다.
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        contentTextField.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    

}
