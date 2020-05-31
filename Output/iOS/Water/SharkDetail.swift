// SharkDetail.swift
// Generated using Cerberus — https://github.com/StashInvest/Cerberus

import Foundation

private class SharkDetailLocalized { }

public struct SharkDetailStrings {

    static let tableName: String = "SharkDetail"

    static func localize(_ key: String) -> String {
        return NSLocalizedString(key, tableName: tableName, bundle: Bundle(for: SharkDetailLocalized.self), comment: "")
    }

    static func localizeParameter(key: Keys, parameter: SubKeys, value: CVarArg) -> String {
        let format: String = localize(key.withParameter(parameter))
        return String.localizedStringWithFormat(format, value)
    }

    enum Keys: String {
        case viewTitle = "shark.detail.view_title"
    
        func withParameter(_ parameter: SubKeys) -> String {
            return [rawValue, parameter.rawValue].joined(separator: ".")
        }
    }
    
    enum SubKeys: String {
        case parameter3
        case parameter2
        case parameter1
    }
    public static func viewTitle(parameter1: String, parameter2: String, parameter3: String) -> String {
        let format: String = localize(Keys.viewTitle.rawValue)
        let result: String = String.localizedStringWithFormat(format, parameter1, parameter2, parameter3)
        return result
    }

}
