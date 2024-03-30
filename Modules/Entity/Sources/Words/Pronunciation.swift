//
//  Pronunciation.swift
//  Entity
//
//  Created by 정진균 on 3/30/24.
//

import Foundation

public struct Pronunciation: Codable {
    public var english: String
    public var korean: String

    public init(english: String, korean: String) {
        self.english = english
        self.korean = korean
    }
}
