import AppIntents

struct OpenTickAppIntent: AppIntent {
    static let title: LocalizedStringResource = "時計を開く"
    static let description = IntentDescription("時計アプリを開きます")
    
    static let openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}