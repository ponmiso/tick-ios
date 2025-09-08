import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()
    @StateObject private var orientationManager = OrientationManager()
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentTime.formatted(.dateTime.hour().minute().second()))
                .font(
                    // 最大のシステムフォントサイズである512ptを使用
                    .system(
                        size: 512,
                        weight: .bold,
                        design: .monospaced
                    )
                )
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .foregroundStyle(.primary)

            Text(currentTime.formatted(.dateTime.year().month().day()))
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.secondary)

            Button(action: {
                orientationManager.rotate()
            }) {
                Image(systemName: "arrow.clockwise")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.blue)
            }
            .padding(.top, 20)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onReceive(timer) { time in
            currentTime = time
        }
        .onAppear {
            // iOSでスリープを無効化（アイドルタイマーを無効化）
            UIApplication.shared.isIdleTimerDisabled = true
        }
        .onDisappear {
            // iOSでスリープを再有効化
            UIApplication.shared.isIdleTimerDisabled = false
        }
    }
}

#Preview {
    ContentView()
}
