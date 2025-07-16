import SwiftUI
import UIKit

@MainActor
class OrientationManager: ObservableObject {
    @Published var orientation: UIInterfaceOrientation = .portrait
    
    init() {
        updateCurrentOrientation()
    }
    
    func rotate() {
        let newOrientation: UIInterfaceOrientation
        
        switch orientation {
        case .portrait, .portraitUpsideDown:
            newOrientation = .landscapeRight
        case .landscapeLeft, .landscapeRight:
            newOrientation = .portrait
        default:
            newOrientation = .portrait
        }
        
        setOrientation(newOrientation)
    }
    
    private func updateCurrentOrientation() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        orientation = windowScene.interfaceOrientation
    }
    
    private func setOrientation(_ orientation: UIInterfaceOrientation) {
        self.orientation = orientation
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        
        let geometryPreferences = UIWindowScene.GeometryPreferences.iOS(interfaceOrientations: UIInterfaceOrientationMask(orientation))
        windowScene.requestGeometryUpdate(geometryPreferences) { error in
            print("Orientation change error: \(error)")
        }
    }
}

extension UIInterfaceOrientationMask {
    init(_ orientation: UIInterfaceOrientation) {
        switch orientation {
        case .portrait:
            self = .portrait
        case .portraitUpsideDown:
            self = .portraitUpsideDown
        case .landscapeLeft:
            self = .landscapeLeft
        case .landscapeRight:
            self = .landscapeRight
        default:
            self = .portrait
        }
    }
}
