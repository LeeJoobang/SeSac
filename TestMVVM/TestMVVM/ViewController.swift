//
//  ViewController.swift
//  TestMVVM
//
//  Created by Jooyoung Lee on 2022/11/04.
//

import UIKit

class ViewController: UIViewController {

    private var personViewModel = ViewModel()

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameButton: UIButton!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind(){
        personViewModel.image.bind { image in
            print(image)
            self.profileImg.image = image

        }
        personViewModel.name.bind { name in
            print("change name text")
            self.nameLabel.text = name
        }
        personViewModel.age.bind { age in
            print("change age text")
            self.ageLabel.text = age
        }
    }

    @IBAction func profileButtonClicked(_ sender: UIButton) {
        personViewModel.setImage("person.fill")
    }
    
    @IBAction func nameButtonClicked(_ sender: UIButton) {
        if let name = nameTextField.text{
            personViewModel.setName(name)
        }
    }
    
    @IBAction func ageButtonClicked(_ sender: UIButton) {
        if let age = ageTextField.text {
            personViewModel.setAge(age)
        }
    }
    
}

