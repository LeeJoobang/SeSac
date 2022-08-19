import UIKit
import SnapKit

class BaseView: UIView {
    
    // code base
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
     
    //xib storyboard, protocol
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureUI(){
        
    }
    
    func setConstraints(){
        
    }
    
}


//
/*
protocol example {
    init(name: String)
}


class Mobile: example {
    let name: String
    
    required init(name: String) {
        self.name = name
    }
}

class Apple: Mobile {
    let wwdc: String
    
    init(wwdc: String){
        self.wwdc = wwdc
        
        super.init(name: "모바일")
    }
    
    required override init(name: String) { // init 구문이 protocol에 있어 required가 요구되는구나., 부모클래스에 있는 것을 override하는구나
        fatalError("init(name:) has not been implemented")
    }
}

let a = Apple(wwdc: "애플")
 
*/
