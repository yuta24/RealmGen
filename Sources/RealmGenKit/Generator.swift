//
//  Generator.swift
//  RealmGenPackageDescription
//
//  Created by yuta24 on 2017/12/27.
//

import Foundation
import SourceKittenFramework
import Stencil

public enum GeneratorError: Error {
    case filePathNotFound
}

public final class Generator {
    let arguments: [String]

    public init(arguments: [String]) {
        self.arguments = arguments
    }

    public func execute(with templateString: String) throws -> String {
        guard let aFiles = (arguments.second.flatMap { files(at: $0) }) else {
            throw GeneratorError.filePathNotFound
        }
        let types = aFiles.map { Structure(file: $0).substructures }.flatMap { $0 }.flatMap { Type($0) }.filter(isRealmConvertible)
        return try generate(with: types, templateString: templateString)
    }

    private func generate(with types: [Type], templateString: String) throws -> String {
        let template = Template(templateString: templateString)
        let context = ["types": types.map { $0.toDictionary() }]
        return try template.render(context)
    }
}

private func isRealmConvertible(_ type: Type) -> Bool {
    return type.inheritedtypes.contains("RealmConvertible") || type.inheritedtypes.contains("RealmGenKit.RealmConvertible")
}

private func files(at path: String, fileManager: FileManager = FileManager.default) -> [File] {
    let url = URL(fileURLWithPath: path)
    var files = [File]()
    var isDirectory = ObjCBool(false)
    if fileManager.fileExists(atPath: path, isDirectory: &isDirectory) {
        if isDirectory.boolValue {
            let enumerator = fileManager.enumerator(atPath: path)
            while let subPath = enumerator?.nextObject() as? String {
                let url = url.appendingPathComponent(subPath)
                if url.pathExtension == "swift", let file = File(path: url.path) {
                    files.append(file)
                }
            }
        }
    } else if let file = File(path: url.path) {
        files.append(file)
    }

    return files
}
