//
//  DecodeFactory.swift
//  OneDollar
//
//  Created by Anh Vu on 1/24/18.
//

public struct DecodeFactory {
    
    public static func decode <T: Codable>(type: T.Type = T.self, data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
    
    public static func decodeToObservable<T: Codable>(type: T.Type = T.self, data: Data?) -> Observable<T> {
        return Observable.deferred { () -> Observable<T> in
            return Observable.create({ (observer) -> Disposable in
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let value = try decoder.decode(T.self, from: data)
                        observer.onNext(value)
                        observer.onCompleted()
                    } catch let ex {
                        print(ex)
                        observer.onError(ex)
                    }
                } else {
                    observer.onError(NSError(domain: "Data nil when decode", code: -1, userInfo: nil))
                }
                
                return Disposables.create()
            })
        }
    }
}
