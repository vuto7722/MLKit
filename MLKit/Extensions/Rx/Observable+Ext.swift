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

public extension Observable where Element: OptionalType {
    /// Returns an Observable where the nil values from the original Observable are
    /// skipped
    func unwrappedOptional() -> Observable<Element.Wrapped> {
        return self.filter { $0.asOptional != nil }.map { $0.asOptional! }
    }
}

/// Represent an optional value
///
/// This is needed to restrict our Observable extension to Observable that generate
/// .Next events with Optional payload
public protocol OptionalType {
    associatedtype Wrapped
    var asOptional:  Wrapped? { get }
}

/// Implementation of the OptionalType protocol by the Optional type
extension Optional: OptionalType {
    public var asOptional: Wrapped? { return self }
}


