//
//  main.swift
//  Scribe
//
//  Created by Morgan Collino on 5/30/20.
//  Copyright © 2020 Morgan Collino. All rights reserved.
//

import Foundation
import ArgumentParser
import Files

struct Scribe: ParsableCommand {

    @Option(name: .shortAndLong, help: "The input directory")
    var directory: String

    @Option(name: .shortAndLong, help: "The output directory")
    var outputDirectory: String

    func run() throws {
        guard let inputFolder = folder(for: directory),
            let _ = folder(for: outputDirectory),
            let iOSFolder = folder(for: outputDirectory + "/iOS"),
            let androidFolder = folder(for: outputDirectory + "/Android")else {
            print("The parameters are wrongly passed. Should be directory paths.")
            return
        }

        inputFolder.subfolders.forEach { (f) in
            print("--- Parsing: \(f.path) directory")

            guard let iOSSubFolder = try? iOSFolder.createSubfolder(at: f.name) else {
                print("-- Couldn't create output subfolder: \(iOSFolder.path)\(f.name)")
                return
            }

            guard let androidSubFolder = try? androidFolder.createSubfolder(at: f.name) else {
                print("-- Couldn't create output subfolder: \(androidFolder.path)\(f.name)")
                return
            }

            f.subfolders.forEach { (sf) in
                print("--- Subparsing: \(sf.path) directory")
                shell("LokaliseGenerator", args: "--directory", "\(sf.path)", "--ios-output-directory", "\(iOSSubFolder.path)", "--android-output-directory", "\(androidSubFolder.path)")
            }
        }
    }
}

private extension Scribe {

    func folder(for path: String?) -> Folder? {
        do {
            guard let path = path else {
                return Folder.current
            }

            if path.starts(with: "/") {
                return try Folder(path: path)
            }

            if let subfolder = try? Folder.current.subfolder(at: path) {
                return subfolder
            } else {
                return try Folder.current.createSubfolder(at: path)
            }
        } catch {
            return nil
        }
    }
}

@discardableResult
func shell(_ command: String, args: String...) -> Int32 {
    let task = Process()
    task.launchPath = Folder.current.path + "/\(command)"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

Scribe.main()
