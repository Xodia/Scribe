// DolphinDetail.swift
// Generated using Cerberus — https://github.com/StashInvest/Cerberus

import Foundation

private class DolphinDetailLocalized { }

public struct DolphinDetailStrings {

    static let tableName: String = "DolphinDetail"

    static func localize(_ key: String) -> String {
        return NSLocalizedString(key, tableName: tableName, bundle: Bundle(for: DolphinDetailLocalized.self), comment: "")
    }

    enum Keys: String {
        case viewTitle = "dolphin.detail.view_title"
    }
    
    public static let viewTitle: String = localize(Keys.viewTitle.rawValue)
}
