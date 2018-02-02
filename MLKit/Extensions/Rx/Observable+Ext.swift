import Foundation
import RxSwift
import RxCocoa

public extension ObservableType where E == Bool {
    /// Boolean not operator
    public func not() -> Observable<Bool> {
        return self.map(!)
    }
}

public extension ObservableType where E == String {
    func filterEmptyString() -> Observable<E> {
        return flatMap({ (value) -> Observable<E> in
            if value.isEmpty {
                return Observable.empty()
            } else {
                return Observable.just(value)
            }
        })
    }
    
    func mapToNone() -> Observable<String> {
        return map({ (value) -> String in
            return value.isEmpty ? "N/A" : value
        })
    }
}

public extension ObservableType where E == String? {
    
    func unwrap() -> Observable<String> {
        return map({ (value) -> String in
            return value ?? ""
        })
    }
}



public extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}

public extension ObservableType {
    
     func catchErrorJustComplete() -> Observable<E> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
     func asDriverOnErrorJustComplete() -> Driver<E> {
        return asDriver { error in
//            assertionFailure("Error \(error)")
            return Driver.empty()
        }
    }
    
     func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
