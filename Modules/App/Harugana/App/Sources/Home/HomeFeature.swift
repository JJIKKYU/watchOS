//
//  HomeTCA.swift
//  HaruganaApp
//
//  Created by 정진균 on 4/6/24.
//

import ComposableArchitecture
import Dependencies
import DependencyContainer
import Entity
import Foundation
import HiraganaFeature
import Repository

@Reducer
struct HomeFeature {
    @ObservableState
    struct State: Equatable {
        static func == (lhs: HomeFeature.State, rhs: HomeFeature.State) -> Bool {
            return lhs.dailyWord == rhs.dailyWord && lhs.hiraganaRows == rhs.hiraganaRows
        }
        
        var hiraganaRows: [String] = []
        var dailyWord: DailyWord?

        var path: StackState<HomeFeature.Path.State> = .init()
    }

    enum Action {
        case pressedHiraganaSection(String)
        case path(StackAction<Path.State, Path.Action>)

        case getHiraganaRows
        case hiraganaRowsResponse(TaskResult<[String]>)

        case getDailyWord
        case dailyWordResponse(TaskResult<DailyWord>)
    }

    @Dependency(\.jsonRepositoryProtocol) var jsonRepositoryProtocol
    @Dependency(\.openAIRepositoryProtocol) var openAIRepositoryProtocol

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .pressedHiraganaSection(row):
                print("PressedHiraganaSection! row = \(row)")
                return .none

            case let .path(action):
                switch action {
                case .element(id: _, action: .pushHiraganaDetailFeature):
                    print("!")
                    return .none

                case let .popFrom(id: id):
                    print("popFrom :: id = \(id)")
                    return .none

                case let .push(id: id, state: state):
                    print("push :: id = \(id), state = \(state)")
                    return .none
                }

            case .getHiraganaRows:
                return .run { send in
                    guard let models: [HiraganaModel] = jsonRepositoryProtocol.fetchHiraganaDataModels() else { return }
                    let rows: [String] = Set(models.map { $0.row.getHiragana() }).map { $0 }
                    await send(.hiraganaRowsResponse(.success(rows)))
                }

            case let .hiraganaRowsResponse(.success(response)):
                state.hiraganaRows = response
                return .none

            case let .hiraganaRowsResponse(.failure(error)):
                state.hiraganaRows = []
                return .none

            case .getDailyWord:
                return .run { send in
                    guard let model: DailyWord = await openAIRepositoryProtocol.getDailyWord() else { return }
                    await send(.dailyWordResponse(.success(model)))
                }

            case let .dailyWordResponse(.success(response)):
                state.dailyWord = response
                return .none

            case let .dailyWordResponse(.failure(error)):
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
}

// MARK: - Destination

extension HomeFeature {
    @Reducer
    struct Path {
        @ObservableState
        enum State: Equatable {
            case hiraganaDetailFeature(HiraganaDetailFeature.State = .init())
        }

        enum Action {
            case pushHiraganaDetailFeature(HiraganaDetailFeature.Action)
        }

        var body: some ReducerOf<Self> {
            Scope(state: \.hiraganaDetailFeature, action: \.pushHiraganaDetailFeature) {
                AppContainer.resolve(HiraganaDetailFeature.self)!
            }
        }
    }
}
