//
//  HiraganaModel.swift
//  Entity
//
//  Created by 정진균 on 3/30/24.
//

import Foundation

// MARK: HiraganaModel

public struct HiraganaModel: Codable {
    // 히라가나
    public var word: String
    // 발음 (a, e, i, o, u..)
    public var pronunciation: Pronunciation
    // localURL
    public var lottieURL: String
    // 단
    public var column: HiraganaColumn
    // 행
    public var row: HiraganaRow

    public init(
        word: String,
        pronunciation: Pronunciation,
        lottieURL: String,
        column: HiraganaColumn,
        row: HiraganaRow
    ) {
        self.word = word
        self.pronunciation = pronunciation
        self.lottieURL = lottieURL
        self.column = column
        self.row = row
    }
}

// MARK: HiraganaModel Extension

extension HiraganaModel: Identifiable, Equatable, Hashable {
    public var id: String {
        self.word
    }

    public static func == (lhs: HiraganaModel, rhs: HiraganaModel) -> Bool {
        return lhs.word == rhs.word
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(word)
        hasher.combine(pronunciation)
        hasher.combine(lottieURL)
        hasher.combine(column)
        hasher.combine(row)
    }
}
