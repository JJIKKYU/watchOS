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
        ScrollView(.horizontal) {
            LazyHStack(content: {
                ForEach(viewModel.hiraganaModels, id: \.self) { model in
                    Text("\(model.word)")
                        .containerRelativeFrame(.horizontal)
                        .font(.system(size: 48))
                        .opacity(1.0)
                }
            })
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .safeAreaPadding(.horizontal)
    }
}

#Preview {
    let viewModel: HiraganaStudyViewModel = .init(dependency: nil)
    return HiraganaStudyView(viewModel: viewModel)
}
