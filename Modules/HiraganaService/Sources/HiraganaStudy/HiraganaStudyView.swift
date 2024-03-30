//
//  HiraganaStudyView.swift
//  HiraganaService
//
//  Created by 정진균 on 3/30/24.
//

import SwiftUI

public struct HiraganaStudyView: View {
    @StateObject var viewModel: HiraganaStudyViewModel

    public var body: some View {
        VStack {
            Text(viewModel.hiraganaModels[viewModel.index].word)
                .padding()
            Text(viewModel.hiraganaModels[viewModel.index].pronunciation.korean)
                .padding()
            Button("다음") {
                viewModel.changeData()
            }
        }
    }
}

#Preview {
    let viewModel: HiraganaStudyViewModel = .init(dependency: nil)
    return HiraganaStudyView(viewModel: viewModel)
}
