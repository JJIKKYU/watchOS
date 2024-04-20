//
//  DailyWord.swift
//  Entity
//
//  Created by 정진균 on 4/13/24.
//

import Foundation

public struct DailyWord: Codable, Hashable {
    public let word: String
    public let meaning: String
    public let pronunciation: String

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.word = try container.decode(String.self, forKey: .word)
        self.meaning = try container.decode(String.self, forKey: .meaning)
        self.pronunciation = try container.decode(String.self, forKey: .pronunciation)
    }
}
