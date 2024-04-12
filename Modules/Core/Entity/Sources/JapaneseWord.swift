//
//  JapaneseWord.swift
//  Entity
//
//  Created by 정진균 on 3/23/24.
//

import Foundation

public struct JapaneseWord {
    public var hiragana: String
    public var lottieURL: String

    public init(hiragana: String, lottieURL: String) {
        self.hiragana = hiragana
        self.lottieURL = lottieURL
    }
}
