//
//  HiraganaStudyView.swift
//  HiraganaService
//
//  Created by 정진균 on 3/30/24.
//

import SDWebImageSwiftUI
import SwiftUI
import Entity

public struct HiraganaStudyView: View {
    @StateObject var viewModel: HiraganaStudyViewModel

    public var body: some View {
        ScrollView(.horizontal) {
            ScrollViewReader(content: { proxy in
                LazyHStack(content: {
                    ForEach(viewModel.hiraganaModels.indices, id: \.self) { index in
                        let model: HiraganaModel = viewModel.hiraganaModels[index]
                        VStack() {
                            WebImage(url: model.getLottieURL() ?? URL(string: ""), isAnimating: $viewModel.isAnimating)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100, maxHeight: 100)
                            HStack(alignment: .bottom, spacing: 4, content: {
                                Text(model.pronunciation.korean)
                                    .font(.system(size: 20, weight: .bold, design: .none))
                                    .font(.subheadline)
                                Text(model.pronunciation.english)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            })
                            Spacer(minLength: 7)
                            HStack(content: {
                                HStack(alignment: .center, spacing: 10, content: {
                                    Text("\(model.getRow()) 행")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.gray)
                                    Text("\(model.getColumn()) 단")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.gray)
                                })
                            })
                            .containerRelativeFrame(.horizontal)
                        }
                        .padding(.init(top: 5, leading: 5, bottom: 5, trailing: 5))
                        .containerRelativeFrame(.horizontal)
                    }
                })
                .scrollTargetLayout()
            })
        }
//        .overlay(alignment: .topLeading, content: {
//            Text("1/10")
//                .font(.system(size: 10))
//                .foregroundStyle(.gray)
//        })
        .scrollTargetBehavior(.paging)
        .safeAreaPadding(.horizontal)
    }
}

/*
#Preview {
    let viewModel: HiraganaStudyViewModel = .init(dependency: nil)
    return HiraganaStudyView(viewModel: viewModel)
}
*/
