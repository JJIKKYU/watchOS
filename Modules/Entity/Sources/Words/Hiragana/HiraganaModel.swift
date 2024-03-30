//
//  HiraganaModel.swift
//  Entity
//
//  Created by 정진균 on 3/30/24.
//

import Foundation

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
