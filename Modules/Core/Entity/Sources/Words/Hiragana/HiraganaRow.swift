//
//  HiraganaRow.swift
//  Entity
//
//  Created by 정진균 on 3/30/24.
//

import Foundation

public enum HiraganaRow: String, Codable {
    case w = "w"
    case r = "r"
    case y = "y"
    case m = "m"
    case h = "h"
    case n = "n"
    case t = "t"
    case s = "s"
    case k = "k"
    case a = "a"
    case nn = "nn"

    public func getHiragana() -> String {
        switch self {
        case .w:
            return "わ"
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
}
