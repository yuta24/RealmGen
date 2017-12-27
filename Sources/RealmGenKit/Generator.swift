//
//  Generator.swift
//  RealmGenPackageDescription
//
//  Created by yuta24 on 2017/12/27.
//

import Foundation
import SourceKittenFramework

public enum GeneratorError: Error {
    case filePathNotFound
}

public final class Generator {
    private let arguments: [String]

    public init(arguments: [String]) {
        self.arguments = arguments
    }

    public func execute() throws {
        guard let aFiles = (arguments.first.flatMap { files(at: $0) }) else {
            throw GeneratorError.filePathNotFound
        }
        print(aFiles)
    }
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
                if url.pathExtension == "swift", let file = File(path: url.path), file.contents.contains("RealmGen") {
                    files.append(file)
                }
            }
        }
    } else if let file = File(path: url.path) {
        files.append(file)
    }

    return files
}
