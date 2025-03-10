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
import SwiftUI

/// Using an enum for the screen allows you define the different state cases with
/// the relevant associated data for each case.
enum MockUserSessionOverviewScreenState: MockScreenState, CaseIterable {
    // A case for each state you want to represent
    // with specific, minimal associated data that will allow you
    // mock that screen.
    case currentSession
    case otherSession
    
    /// The associated screen
    var screenType: Any.Type {
        UserSessionOverview.self
    }
    
    /// A list of screen state definitions
    static var allCases: [MockUserSessionOverviewScreenState] {
        [.currentSession, .otherSession]
    }
    
    /// Generate the view struct for the screen state.
    var screenView: ([Any], AnyView) {
        let session: UserSessionInfo
        switch self {
        case .currentSession:
            session = UserSessionInfo(id: "alice",
                                      name: "iOS",
                                      deviceType: .mobile,
                                      isVerified: false,
                                      lastSeenIP: "10.0.0.10",
                                      lastSeenTimestamp: nil,
                                      applicationName: "Element iOS",
                                      applicationVersion: "1.0.0",
                                      applicationURL: nil,
                                      deviceModel: nil,
                                      deviceOS: "iOS 15.5",
                                      lastSeenIPLocation: nil,
                                      deviceName: "My iPhone",
                                      isActive: true,
                                      isCurrent: true)
        case .otherSession:
            session = UserSessionInfo(id: "1",
                                      name: "macOS",
                                      deviceType: .desktop,
                                      isVerified: true,
                                      lastSeenIP: "1.0.0.1",
                                      lastSeenTimestamp: Date().timeIntervalSince1970 - 130_000,
                                      applicationName: "Element MacOS",
                                      applicationVersion: "1.0.0",
                                      applicationURL: nil,
                                      deviceModel: nil,
                                      deviceOS: "macOS 12.5.1",
                                      lastSeenIPLocation: nil,
                                      deviceName: "My Mac",
                                      isActive: false,
                                      isCurrent: false)
        }

        let viewModel = UserSessionOverviewViewModel(session: session)
        // can simulate service and viewModel actions here if needs be.
        return ([viewModel], AnyView(UserSessionOverview(viewModel: viewModel.context)))
    }
}
