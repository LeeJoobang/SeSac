//
//  ViewController.swift
//  TestMVVM
//
//  Created by Jooyoung Lee on 2022/11/04.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameButton: UIButton!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageButton: UIButton!
    
    private var personViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personViewModel.image.bind { image in
            self.profileImg.image = image
        }
        personViewModel.name.bind { name in
            self.nameLabel.text = name
        }
        personViewModel.age.bind { age in
            self.ageLabel.text = age
        }

    }

    @IBAction func profileButtonClicked(_ sender: UIButton) {
        personViewModel.setImage("Person.fill")
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

