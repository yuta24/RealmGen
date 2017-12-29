//
//  Type.swift
//  RealmGenPackageDescription
//
//  Created by yuta24 on 2017/12/27.
//

import Foundation
import SourceKittenFramework

struct Property {
    let name: String
    let typeName: String

    init?(_ structure: Structure) {
        guard let kind = structure.kind, kind == .varInstance, let name = structure.name, let typeName = structure.typeName else {
            return nil
        }
        self.name = name
        self.typeName = typeName
    }

    func toDictionary() -> [String: Any] {
        if let initialValue = initialValue() {
            return [
                "name": name,
                "typeName": typeName,
                "initialValue": initialValue,
            ]
        } else {
            return [
                "name": name,
                "typeName": typeName,
            ]
        }
    }

    func initialValue() -> String? {
        if typeName.contains("?") {
            return ""
        }
        switch typeName {
        case "Int", "Int8", "Int16", "Int32", "Int64":
            return "= 0"
        case "Bool":
            return "= false"
        case "Double", "Float":
            return "= 0.0"
        case "String":
            return "= \"\""
        default:
            return ""
        }
    }
}

struct Type {
    private static var declarationKinds: [SwiftDeclarationKind] {
        return [.struct, .class, .enum, .protocol]
    }

    let kind: SwiftDeclarationKind
    let name: String
    let properties: [Property]
    let nested: [Type]
    let inheritedtypes: [String]

    init?(_ structure: Structure) {
        guard let kind = structure.kind, Type.declarationKinds.contains(kind), let name = structure.name else {
            return nil
        }
        self.kind = kind
        self.name = name
        self.properties = structure.substructures.flatMap { Property($0) }
        self.nested = structure.substructures.flatMap { Type($0) }
        self.inheritedtypes = structure.inheritedtypes
    }

    func toDictionary() -> [String: Any] {
        return [
            "name": name.replacingOccurrences(of: ".", with: ""),
            "realmName": name.replacingOccurrences(of: ".", with: "") + "Realm",
            "properties": properties.map { $0.toDictionary() },
        ]
    }
}
