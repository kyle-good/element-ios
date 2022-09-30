//
// Copyright 2022 New Vector Ltd
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

import SwiftUI

struct UserOtherSessionsHeaderViewData {
    var title: String?
    var subtitle: String
    var iconName: String?
}

struct UserOtherSessionsHeaderView: View {
    
    @Environment(\.theme) private var theme
    
    let viewData: UserOtherSessionsHeaderViewData
    
    var body: some View {
        HStack (alignment: .top, spacing: 0) {
            if let iconName = viewData.iconName {
                Image(iconName)
                    .foregroundColor(.red)
            }
            VStack(alignment: .leading, spacing: 0, content: {
                if let title = viewData.title {
                    Text(title)
                        .font(.callout)
                        .textCase(.uppercase)
                        .font(theme.fonts.footnote)
                        .foregroundColor(theme.colors.primaryContent)
                        .padding(.bottom, 9.0)
                }
                Text(viewData.subtitle)
                    .font(theme.fonts.footnote)
                    .foregroundColor(theme.colors.secondaryContent)
                    .padding(.bottom, 12.0)
            })
            .padding(.leading, 16)
        }
    }
}

struct UserOtherSessionsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserOtherSessionsHeaderView(viewData: UserOtherSessionsHeaderViewData(title: nil,
                                                                               subtitle: "Verify your sessions for enhanced secure messaging or sign out from those you don’t recognize or use anymore. Learn more",
                                                                               iconName: Asset.Images.userOtherSessionsInactive.name))
            .theme(.light)
            .preferredColorScheme(.light)
        }
    }
}
