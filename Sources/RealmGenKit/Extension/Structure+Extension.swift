//
//  Structure+Extension.swift
//  RealmGenPackageDescription
//
//  Created by yuta24 on 2017/12/27.
//

import Foundation
import SourceKittenFramework

extension Structure {
    var substructures: [Structure] {
        guard let substructures = dictionary[SwiftDocKey.substructure.rawValue] as? [[String: SourceKitRepresentable]] else {
            return []
        }
        return substructures.map { Structure(sourceKitResponse: $0) }
    }

    var name: String? {
        return dictionary[SwiftDocKey.name.rawValue] as? String
    }

    var kind: SwiftDeclarationKind? {
        return (dictionary[SwiftDocKey.kind.rawValue] as? String).flatMap(SwiftDeclarationKind.init)
    }

    var typeName: String? {
        return dictionary[SwiftDocKey.typeName.rawValue] as? String
    }

    var inheritedtypes: [String] {
        return (dictionary[SwiftDocKey.inheritedtypes.rawValue] as? [String]) ?? []
    }
}
