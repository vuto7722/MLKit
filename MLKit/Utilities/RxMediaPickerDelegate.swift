//
//  RxMediaPickerDelegate.swift
//  MLKit
//
//  Created by Anh Vu on 3/2/18.
//  Copyright © 2018 Mobytelab. All rights reserved.
//


extension RxMediaPickerDelegate where Self: UIViewController {
    
    func presentPicker(picker: UIImagePickerController) {
        self.present(picker, animated: true, completion: .none)
    }
    
    func dismissPicker(picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: .none)
    }
    
}
