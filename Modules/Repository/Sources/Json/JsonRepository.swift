//
//  JsonRepository.swift
//  Repository
//
//  Created by 정진균 on 3/30/24.
//

import Foundation
import Entity

// MARK: - JsonRepositoryProtocol

public protocol JsonRepositoryProtocol {
    func fetchHiraganaDataModels() -> [HiraganaModel]?
}

// MARK: - JsonRepository

public struct JsonRepository: JsonRepositoryProtocol {
    private let decoder: JSONDecoder

    public init() {
        self.decoder = JSONDecoder()
    }

    public func fetchHiraganaDataModels() -> [HiraganaModel]? {
        // File URL 가져오기
        guard let fileURL: URL = Bundle.main.url(forResource: "HiraganaData", withExtension: "json") else {
            return nil
        }

        // Json 파일 데이터 변환
        guard let jsonData: Data = try? Data(contentsOf: fileURL),
              let hiraganaModels: [HiraganaModel] = try? decoder.decode([HiraganaModel].self, from: jsonData)
        else { return nil }

        return hiraganaModels
    }
}
