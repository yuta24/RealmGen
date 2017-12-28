//
//  Converter.swift
//  RealmGenPackageDescription
//
//  Created by yuta24 on 2017/12/28.
//

import Foundation
import SourceKittenFramework

struct Converter {
    init?(type: Type) {
        guard type.inheritedtypes.contains("RealmConvertible"), type.inheritedtypes.contains("RealmGen.RealmConvertible") else {
            return nil
        }
    }
}
