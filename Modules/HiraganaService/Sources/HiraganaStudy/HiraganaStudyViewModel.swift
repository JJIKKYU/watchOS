//
//  HiraganaStudyViewModel.swift
//  HiraganaService
//
//  Created by 정진균 on 3/30/24.
//

import Foundation
import Entity

public class HiraganaStudyViewModel: ObservableObject {
    var dependency: HiraganaStudyDependencyProtocol?

    @Published public var hiraganaModels: [HiraganaModel] = []
    @Published var index: Int = 0

    init(
        dependency: HiraganaStudyDependencyProtocol?
    ) {
        self.dependency = dependency
        if let hiraganaModels: [HiraganaModel] = dependency?.jsonRepository?.fetchHiraganaDataModels() {
            self.hiraganaModels = hiraganaModels
        }
    }

    func changeData() {
        index += 1
    }
}
