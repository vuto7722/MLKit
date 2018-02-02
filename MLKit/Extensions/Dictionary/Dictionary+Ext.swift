//
//  Dictionary+Ext.swift
//  MLAVKit
//
//  Created by Anh Vu on 1/30/18.
//

public extension Dictionary {
    func asData() throws -> Data  {
        return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}
