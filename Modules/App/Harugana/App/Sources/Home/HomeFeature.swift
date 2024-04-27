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
            return lhs.dailyWord == rhs.dailyWord && lhs.hiraganaRowModels == rhs.hiraganaRowModels
        }
        
        var hiraganaRowModels: [HiraganaModel] = []
        var hiraganaRows: [String] = []
        var dailyWord: DailyWord?

        // var hiraganaStudyFeature: AppHiraganaStudyFeature.State?
        var path: StackState<HomeFeature.Path.State> = .init()
    }

    enum Action {
        case path(StackAction<Path.State, Path.Action>)

        case getHiraganaRows
        case hiraganaRowsResponse(TaskResult<(hiraganaModels: [HiraganaModel], hiraganaRows: [String])>)

        case getDailyWord
        case dailyWordResponse(TaskResult<DailyWord>)
    }

    @Dependency(\.jsonRepositoryProtocol) var jsonRepositoryProtocol
    @Dependency(\.openAIRepositoryProtocol) var openAIRepositoryProtocol

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .path(action):
                switch action {
                case .element(id: _, action: .pushHiraganaStudyFeature(.testAction)):
                    print("testAction!")
                    return .none

                case .element(id: _, action: .pushHiraganaStudyFeature):
                    print("!")
                    return .none

                case let .popFrom(id: id):
                    print("popFrom :: id = \(id)")
                    return .none

                case let .push(id, state):
                    print("push :: id = \(id), state = \(state), \(state)")
                    return .none
                }

            case .getHiraganaRows:
                return .run { send in
                    guard let models: [HiraganaModel] = jsonRepositoryProtocol.fetchHiraganaDataModels() else {
                        await send(.hiraganaRowsResponse(.failure(NSError()) ))
                        return
                    }
                    let rows: [String] = Set(models.map { $0.row.getHiragana() }).map { $0 }
                    await send(.hiraganaRowsResponse(.success((models, rows))))
//                    await send(.hiraganaRowsResponse(.success(rows)))
                }

            case let .hiraganaRowsResponse(.success(response)):
                state.hiraganaRowModels = response.hiraganaModels
                state.hiraganaRows = response.hiraganaRows
                return .none

            case let .hiraganaRowsResponse(.failure(error)):
                state.hiraganaRowModels = []
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
        var hiraganaStudyFeatureState = AppContainer.resolve(AppHiraganaStudyFeature.self)

        @ObservableState
        enum State: Equatable {
            case hiraganaStudyFeature(AppHiraganaStudyFeature.State = .init())
        }

        enum Action {
            case pushHiraganaStudyFeature(AppHiraganaStudyFeature.Action)
        }

        var body: some ReducerOf<Self> {
            Scope(state: \.hiraganaStudyFeature, action: \.pushHiraganaStudyFeature) {
                AppContainer.resolve(AppHiraganaStudyFeature.self)
            }
        }
    }
}
