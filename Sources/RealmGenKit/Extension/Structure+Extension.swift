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
        let substructures: [[String: SourceKitRepresentable]]? = get(.substructure, dictionary)
        guard let structures = substructures else { return [] }
        return structures.map { Structure(sourceKitResponse: $0) }
    }

    var name: String? {
        return get(.name, dictionary)
    }

    var kind: SwiftDeclarationKind? {
        return get(.kind, dictionary).flatMap(SwiftDeclarationKind.init)
    }

    var typeName: String? {
        return get(.typeName, dictionary)
    }

    var inheritedtypes: [String] {
        return get(.inheritedtypes, dictionary) ?? []
    }
}

private func get<T>(_ key: SwiftDocKey, _ dictionary: [String: SourceKitRepresentable]) -> T? {
    return dictionary[key.rawValue] as? T
}
