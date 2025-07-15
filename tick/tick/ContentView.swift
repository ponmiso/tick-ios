import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentTime.formatted(.dateTime.hour().minute().second()))
                .font(.system(size: 48, weight: .bold, design: .monospaced))
                .foregroundStyle(.primary)
            
            Text(currentTime.formatted(.dateTime.year().month().day()))
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.secondary)
        }
        .padding()
        .onReceive(timer) { time in
            currentTime = time
        }
    }
}

#Preview {
    ContentView()
}
