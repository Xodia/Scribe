// FishDetail.swift
// Generated using Cerberus — https://github.com/StashInvest/Cerberus

import Foundation

private class FishDetailLocalized { }

public struct FishDetailStrings {

    static let tableName: String = "FishDetail"

    static func localize(_ key: String) -> String {
        return NSLocalizedString(key, tableName: tableName, bundle: Bundle(for: FishDetailLocalized.self), comment: "")
    }

    enum Keys: String {
        case viewTitle = "fish.detail.view_title"
    }
    
    public static let viewTitle: String = localize(Keys.viewTitle.rawValue)
}
