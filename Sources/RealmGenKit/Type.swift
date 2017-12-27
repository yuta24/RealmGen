//
//  Type.swift
//  RealmGenPackageDescription
//
//  Created by yuta24 on 2017/12/27.
//

import Foundation
import SourceKittenFramework

struct Property {
    private let structure: Structure
    let name: String
    let typeName: String

    init?(_ structure: Structure) {
        self.structure = structure
        guard let kind = structure.kind, kind == .varInstance, let name = structure.name, let typeName = structure.typeName else {
            return nil
        }
        self.name = name
        self.typeName = typeName
    }
}

struct Type {
    private static var declarationKinds: [SwiftDeclarationKind] {
        return [.struct, .class, .enum, .protocol, .extension]
    }

    private let structure: Structure
    let kind: SwiftDeclarationKind
    let typeName: String
    let properties: [Property]
    let nested: [Type]

    init?(_ structure: Structure) {
        self.structure = structure
        guard let kind = structure.kind, Type.declarationKinds.contains(kind), let typeName = structure.name else {
            return nil
        }
        self.kind = kind
        self.typeName = typeName
        self.properties = structure.substructures.flatMap { Property($0) }
        self.nested = structure.substructures.flatMap { Type($0) }
    }
}
