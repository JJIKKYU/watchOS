//
//  AppHiraganaStudyFeature.swift
//  HiraganaFeature
//
//  Created by 정진균 on 4/27/24.
//

import ComposableArchitecture
import Entity
import Foundation

@Reducer
public struct AppHiraganaStudyFeature {
    @ObservableState
    public struct State: Equatable {
        public var selectedHiragana: String?

        public init(selectedHiragana: String? = nil) {
            self.selectedHiragana = selectedHiragana
        }
    }

    public enum Action {
        case testAction
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .testAction:
                print("testAction!")
                return .none
            }
        }
    }

    public init() {
        print("AppHiraganaStudyFeature :: init!")
    }
}

