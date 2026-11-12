import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Deskland — Forest Prototype").font(.title2).bold()
            Text("This first prototype draws an aerial forest scene behind the desktop. It does not yet read Finder icon positions or rearrange the landscape around files.")
                .fixedSize(horizontal: false, vertical: true)
            Text("Next development step: test desktop layering on macOS Tahoe, then investigate safe Finder icon-position access.")
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .frame(width: 440)
    }
}
