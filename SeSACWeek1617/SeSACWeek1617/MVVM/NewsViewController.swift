//
//  NewsViewController.swift
//  SeSACWeek1617
//
//  Created by Jooyoung Lee on 2022/10/20.
//

import UIKit

class NewsViewController: UIViewController {

    
    @IBOutlet weak var numberTextField: UITextField!
    
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.pageNumber.bind { value in
            print("bind == \(value)")
            self.numberTextField.text = value
        }
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
    }
    
    @objc func numberTextFieldChanged(){
        print(#function)
        guard let text = numberTextField.text else { return }
        viewModel.changePageNumberFormat(text: text)
        
    }
    
}
