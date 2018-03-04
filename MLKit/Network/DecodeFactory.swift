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
    
    public static func decodeToObservable<T: Codable>(type: T.Type = T.self, content: String?) -> Observable<T> {
        return Observable.deferred { () -> Observable<T> in
            return Observable.create({ (observer) -> Disposable in
                let decoder = JSONDecoder()
                let dict = convertToDictionary(text: content.unwrapEmpty)
                if let dict = dict {
                    do {
                        let value = try decoder.decode(T.self, from: dict.asData())
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

public func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}
