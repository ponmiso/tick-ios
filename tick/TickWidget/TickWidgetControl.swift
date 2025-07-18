import AppIntents
import SwiftUI
import WidgetKit

struct TickWidgetControl: ControlWidget {
    static let kind: String = "ponmiso.tick.TickWidget"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetButton(action: OpenTickAppIntent()) {
                Image(systemName: "clock.fill")
                Text("時計")
            }
        }
        .displayName("時計アプリ")
        .description("時計アプリを起動します")
    }
}

struct OpenTickAppIntent: AppIntent {
    static let title: LocalizedStringResource = "時計を開く"
    static let description = IntentDescription("時計アプリを開きます")
    
    static let openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
