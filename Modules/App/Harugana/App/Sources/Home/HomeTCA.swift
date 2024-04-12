//
//  HomeTCA.swift
//  HaruganaApp
//
//  Created by 정진균 on 4/6/24.
//

import ComposableArchitecture
import Foundation
import HiraganaFeature

@Reducer
struct HomeFeature {
    @ObservableState
    struct State: Equatable {
        static func == (lhs: HomeFeature.State, rhs: HomeFeature.State) -> Bool {
            return lhs.numberFact == rhs.numberFact && lhs.numberFact == rhs.numberFact
        }
        
        var count: Int = 0
        var numberFact: String?
        @Presents var destination: Destination.State?
        var path = StackState<HiraganaDetailFeature.State>()
    }

    enum Action {
        case pressedHiraganaSection(String)
        case destination(PresentationAction<Destination.Action>)
        case path(StackAction<HiraganaDetailFeature.State, HiraganaDetailFeature.Action>)
        case decrementButtonTapped
        case incrementButtonTapped
        case numberFactButtonTapped
        case numberFactResponse(String)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .pressedHiraganaSection(row):
                print("PressedHiraganaSection! row = \(row)")
                return .none

            case .decrementButtonTapped:
                state.count -= 1
                return .none

            case let .destination(.presented(.prssed(.testAction))):
                return .none

            case let .destination(.dismiss):
                return .none

            case .path:
                return .none

            case .incrementButtonTapped:
                state.count += 1
                return .none

            case .numberFactButtonTapped:
                return .run { [count = state.count] send in
                    let (data, _) = try await URLSession.shared.data(
                        from: URL(string: "http://numbersapi.com/\(count)/trivia")!
                    )

                    await send(
                        .numberFactResponse(String(decoding: data, as: UTF8.self)
                        ))
                }

            case let .numberFactResponse(fact):
                state.numberFact = fact
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
        .forEach(\.path, action: \.path) {
            HiraganaDetailFeature()
        }
    }
}

// MARK: - Destination

extension HomeFeature {
    @Reducer
    enum Destination {
        case prssed(HiraganaDetailFeature)
    }
}
