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
        self.lottieURL = lottieURL
        self.pronunciation = pronunciation
        self.column = column
        self.row = row
    }

    public func getLottieURL() -> URL? {
        // LottieURL이 비어있지 않을 경우
        if !lottieURL.isEmpty {
            return Bundle(identifier: "com.jjikkyu.Repository")?.url(forResource: lottieURL, withExtension: "json")
        }
        return nil
    }

    public func getRow() -> String {
        switch row {
        case .w:
            return "あ"

        case .r:
            return "ら"

        case .y:
            return "や"

        case .m:
            return "ま"

        case .h:
            return "は"

        case .n:
            return "な"

        case .t:
            return "た"

        case .s:
            return "さ"

        case .k:
            return "か"

        case .a:
            return "あ"

        case .nn:
            return "ん"
        }
    }

    public func getColumn() -> String {
        switch column {
        case .a:
            return "あ"

        case .i:
            return "い"

        case .u:
            return "う"

        case .e:
            return "え"

        case .o:
            return "お"

        case .nn:
            return "ん"
        }
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
