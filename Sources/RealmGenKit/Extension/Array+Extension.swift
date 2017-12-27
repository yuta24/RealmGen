//
//  Array+Extension.swift
//  RealmGenPackageDescription
//
//  Created by yuta24 on 2017/12/27.
//

import Foundation

extension Array {
    var second: Element? {
        if count > 1 {
            return self[1]
        } else {
            return nil
        }
    }
}
