//
//  HiraganaStudyFeature.swift
//  HiraganaFeature
//
//  Created by 정진균 on 4/12/24.
//

import ComposableArchitecture
import Foundation

@Reducer
public struct HiraganaDetailFeature {
    @ObservableState
    public struct State: Equatable {
        public var test: String?

        public init(test: String? = nil) {
            self.test = test
        }
    }

    public enum Action {
        case testAction
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .testAction:
                print("TestAction!")
                return .none
            }
        }
    }

    public init() {}
}
