//
//  ViewModel.swift
//  TestMVVM
//
//  Created by Jooyoung Lee on 2022/11/04.
//

import Foundation
import UIKit

class ViewModel{
    let defaultName = "이주방"
    let defaultAge = "34"
    let defaultImage = "person"
    
    let name = Observable("")
    let age = Observable("")
    let image: Observable<UIImage?> = Observable(nil)
    
    init(){
        setName(defaultName)
        setAge(defaultAge)
        setImage(defaultImage)
    }
    
    func setName(_ name: String){
        self.name.value = name
    }
    func setAge(_ age: String){
        self.age.value = age
    }
    func setImage(_ image: String){
        if let image = UIImage(systemName: image){
            self.image.value = image
        }
    }
    
    
    
}
