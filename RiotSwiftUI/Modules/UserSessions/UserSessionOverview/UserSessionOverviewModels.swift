//
// Copyright 2021 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

// MARK: - Coordinator

enum UserSessionOverviewCoordinatorResult {
    case openSessionDetails(session: UserSessionInfo)
}

// MARK: View model

enum UserSessionOverviewViewModelResult: Equatable {
    case showSessionDetails(session: UserSessionInfo)
    case verifyCurrentSession
}

// MARK: View

struct UserSessionOverviewViewState: BindableState {
    let cardViewData: UserSessionCardViewData
    let isCurrentSession: Bool
}

enum UserSessionOverviewViewAction {
    case verifyCurrentSession
    case viewSessionDetails
}
