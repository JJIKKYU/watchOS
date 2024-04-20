//
//  OpenAIRepository.swift
//  Repository
//
//  Created by 정진균 on 4/13/24.
//

import Dependencies
import DependencyContainer
import Entity
import Foundation
import OpenAI

// MARK: - OpenAIRepositoryProtocol

public protocol OpenAIRepositoryProtocol {
    func getDailyWord() async -> DailyWord?
}

public enum OpenAIRepositoryProtocolKey: DependencyKey {
    public static var liveValue: OpenAIRepositoryProtocol {
        AppContainer
            .resolve(OpenAIRepositoryProtocol.self)!
    }
}

public extension DependencyValues {
    var openAIRepositoryProtocol: OpenAIRepositoryProtocol {
        get { self[OpenAIRepositoryProtocolKey.self] }
        set { self[OpenAIRepositoryProtocolKey.self] = newValue }
    }
}

// MARK: - OpenAIRepository

public struct OpenAIRepository: OpenAIRepositoryProtocol {
    let openAI: OpenAI

    public init() {
        self.openAI = OpenAI(apiToken: "")
    }

    public func getDailyWord() async -> DailyWord? {
        let query = ChatQuery(messages: [
            .system(.init(content: "일상생활에서 자주 쓰이는 일본어 단어를 랜덤하게 한 개 알려줘")),
            .system(.init(content: "앱에서 사용할 수 있도록 json 형태로 알려줘")),
            .system(.init(content: "word: 단어를 일본어로 알려줘")),
            .system(.init(content: "meaning: 그 단어의 뜻을 알려줘")),
            .system(.init(content: "pronunciation: 그 단어의 발음 방법을 알파벳으로 알려줘")),

        ], model: .gpt3_5Turbo_16k)

        guard let result: String = try? await openAI.chats(query: query)
            .choices
            .first?
            .message
            .content?
            .string
        else { return nil }

        let jsonData = Data(result.utf8)
        guard let dailyWord: DailyWord = try? JSONDecoder().decode(DailyWord.self, from: jsonData) else { return nil }

        print("dailyWord = \(dailyWord)")

        return dailyWord
    }
}
