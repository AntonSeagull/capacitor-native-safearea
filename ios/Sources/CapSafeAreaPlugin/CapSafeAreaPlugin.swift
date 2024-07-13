import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapSafeAreaPlugin)
public class CapSafeAreaPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "CapSafeAreaPlugin"
    public let jsName = "CapSafeArea"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "showTopSafeArea", returnType: CAPPluginReturnPromise),
         CAPPluginMethod(name: "showBottomSafeArea", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = CapSafeArea()

   
     
    @objc func showTopSafeArea(color: String) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }

            let topSafeAreaView = UIView(frame: window.safeAreaLayoutGuide.layoutFrame)
            topSafeAreaView.backgroundColor = UIColor(hexString: color)
            topSafeAreaView.translatesAutoresizingMaskIntoConstraints = false
            window.addSubview(topSafeAreaView)

            NSLayoutConstraint.activate([
                topSafeAreaView.topAnchor.constraint(equalTo: window.topAnchor),
                topSafeAreaView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
                topSafeAreaView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
                topSafeAreaView.bottomAnchor.constraint(equalTo: window.safeAreaLayoutGuide.topAnchor)
            ])
        }
    }

    @objc func showBottomSafeArea(color: String) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }

            let bottomSafeAreaView = UIView(frame: window.safeAreaLayoutGuide.layoutFrame)
            bottomSafeAreaView.backgroundColor = UIColor(hexString: color)
            bottomSafeAreaView.translatesAutoresizingMaskIntoConstraints = false
            window.addSubview(bottomSafeAreaView)

            NSLayoutConstraint.activate([
                bottomSafeAreaView.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.bottomAnchor),
                bottomSafeAreaView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
                bottomSafeAreaView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
                bottomSafeAreaView.bottomAnchor.constraint(equalTo: window.bottomAnchor)
            ])
        }
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

}
