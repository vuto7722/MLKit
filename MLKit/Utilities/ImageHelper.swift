//
//  ImageHelper.swift
//  MLAVKit
//
//  Created by Anh Vu on 3/2/18.
//


public class ImageHelper: NSObject {
    
    fileprivate var viewController: UIViewController!
    fileprivate let picker = UIImagePickerController()
    fileprivate let imagePickingSubject = PublishSubject<Data>()
    
    public func setViewController(vc: UIViewController) {
        self.viewController = vc
    }
    
    public func showPickAlert() {
        assert(viewController != nil)
        showSelectPhotoAlert()
    }
    
    public func getPickPhoto() -> Observable<Data> {
        return self.imagePickingSubject.asObserver()
    }
    
    fileprivate func showSelectPhotoAlert() {
        let alert = UIAlertController(title: "Choose photos", message: "Please select photo from", preferredStyle: UIAlertControllerStyle.actionSheet)
        let takePhotoAction = UIAlertAction(title: "Capture from camera", style: .default) { [weak self](_) in
            guard let `self` = self else {return}
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.picker.sourceType = .camera
                self.viewController.present(self.picker, animated: true, completion: nil)
            } else {
                print("Don't have camera!")
            }
        }
        
        let photosAction = UIAlertAction(title: "Choose from photos", style: .default) { [weak self](_) in
            guard let `self` = self else {return}
            self.picker.sourceType = .photoLibrary
            self.viewController.present(self.picker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.viewController.view
            popoverController.sourceRect = self.viewController.view.bounds
        }
        
        alert.addAction(takePhotoAction)
        alert.addAction(photosAction)
        alert.addAction(cancelAction)
        viewController.present(alert, animated: true, completion: nil)
    }

    
}

extension ImageHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage,
            let data = UIImageJPEGRepresentation(chosenImage, 1.0) {
            imagePickingSubject.onNext(data)
        }
        
    }
}
