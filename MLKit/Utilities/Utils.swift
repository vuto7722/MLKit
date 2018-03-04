//
//  Utils.swift
//  Alamofire
//
//  Created by Anh Vu on 1/25/18.
//

public func downloadImage(url: String) -> Observable<Data> {
    guard let urlDownload = URL(string: url) else { return Observable.empty() }
    return downloadImage(url: urlDownload)
}

public func downloadImage(url: URL) -> Observable<Data> {
    return Observable.deferred({ () -> Observable<Data> in
        return Observable.create({ (observer) -> Disposable in
            ImageDownloader.default.downloadImage(with: url, completionHandler: { (img, error, _, _) in
                if let err = error {
                    observer.onError(err)
                } else {
                    if let img = img, let data = UIImageJPEGRepresentation(img, 1.0) {
                        observer.onNext(data)
                    }
                    observer.onCompleted()
                }
            })
            return Disposables.create()
        })
    })
}

public func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}
