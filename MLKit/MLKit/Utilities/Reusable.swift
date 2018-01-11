//
//  Reusable.swift
//  MLKit
//
//  Created by Anh Vu on 12/13/17.
//  Copyright © 2017 Mobytelab. All rights reserved.
//

import UIKit

public protocol Reusable {
    static var reuseID: String {get}
}

extension Reusable {
    public static var reuseID: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

extension UIViewController: Reusable {}

extension UITableView {
    public func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID,
                                             for: indexPath) as? T else {
                                                fatalError()
        }
        return cell
    }
    
    public func registerCell<T>(ofType cellType: T.Type = T.self) where T: UITableViewCell {
        self.register(UINib(nibName: cellType.reuseID, bundle: nil), forCellReuseIdentifier: cellType.reuseID)
    }
}

extension UIStoryboard {
    public func instantiateViewController<T>(ofType type: T.Type = T.self) -> T where T: UIViewController {
        guard let viewController = instantiateViewController(withIdentifier: type.reuseID) as? T else {
            fatalError()
            
        }
        return viewController
    }
}

