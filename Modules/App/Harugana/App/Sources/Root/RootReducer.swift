//
//  RootReducer.swift
//  HaruganaApp
//
//  Created by 정진균 on 4/21/24.
//

/*
import ComposableArchitecture
import DependencyContainer
import Foundation

@Reducer
struct RootReducer {
    @ObservableState
    struct State: Equatable {
        
    }

    enum Action {

    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            }
        }
    }
}

// MARK: - Destination

extension RootReducer {
    @Reducer
    struct Path {
        @ObservableState
        enum State: Equatable {
            case homeReducer(HomeFeature.State = .init())
        }

        enum Action {
            case
        }

        var body: some ReducerOf<Self> {
            Scope(state: \.homeReducer, action: \.never) {
                HomeFeature()
            }
        }
    }
}
*/
