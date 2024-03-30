//
//  DashboardViewModel.swift
//  WatchOSTest
//
//  Created by 정진균 on 3/23/24.
//

import Foundation
import Entity

class DashboardViewModel: ObservableObject {
    @Published var data: JapaneseWord = .init(hiragana: "あ", lottieURL: "")

    func changeData() {
        data.hiragana = "짜잔"
    }
}
