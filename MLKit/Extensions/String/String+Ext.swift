//
//  String+Ext.swift
//  Alamofire
//
//  Created by Anh Vu on 1/28/18.
//

public extension Optional where Wrapped == String {
    var unwrapEmpty: String {
        return self ?? ""
    }
    
    var isBlank: Bool {
        return self.unwrapEmpty.isEmpty
    }
}
