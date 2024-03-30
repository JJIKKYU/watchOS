//
//  DashboardView.swift
//  WatchOSTest
//
//  Created by 정진균 on 3/23/24.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel: DashboardViewModel

    var body: some View {
        VStack {
            Text(viewModel.data.hiragana)
                .padding()
            Text(viewModel.data.lottieURL)
                .padding()
            Button("이름변경") {
                viewModel.changeData()
            }
        }
    }
}

#Preview {
    let viewModel: DashboardViewModel = .init()
    return DashboardView(viewModel: viewModel)
}
