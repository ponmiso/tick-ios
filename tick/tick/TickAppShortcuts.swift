import AppIntents

struct TickAppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: OpenTickAppIntent(),
            phrases: [
                "\(.applicationName)を開く",
                "\(.applicationName)で時計を見る",
                "\(.applicationName)を起動する"
            ],
            shortTitle: "時計を開く",
            systemImageName: "clock.fill"
        )
    }
}
