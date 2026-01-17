import UIKit
import Capacitor
import WebKit
import WidgetKit // REQUIRED for reloading widget

class ViewController: CAPBridgeViewController, WKScriptMessageHandler {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("------------- CUSTOM VIEW CONTROLLER LOADED - Bypassing Capacitor Plugin -------------")
        
        // Direct WebKit Bridge (The Final Fix)
        // Bypass Capacitor's hidden plugin registration totally.
        // We attach directly to the WebView.
        self.webView?.configuration.userContentController.add(self, name: "widgetBridge")
    }
    
    // Handle specific messages from JS
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "widgetBridge" {
            if let jsonString = message.body as? String {
                print("🔵 NATIVE BRIDGE RECEIVED DATA: \(jsonString)") // DEBUG Log
                
                // Write to App Group
                if let userDefaults = UserDefaults(suiteName: "group.com.budgetpro.data") {
                    userDefaults.set(jsonString, forKey: "widgetData")
                    userDefaults.synchronize() // Called on the unwrapped instance
                    print("✅ Data Written to App Group 'group.com.budgetpro.data'")
                } else {
                    print("❌ FAILED to access App Group 'group.com.budgetpro.data'")
                }
                
                // Reload Widget
                if #available(iOS 14.0, *) {
                    WidgetCenter.shared.reloadAllTimelines()
                    print("🔄 Widget Timeline Reload Requested")
                }
            } else {
                print("⚠️ Native Bridge Received non-string body: \(message.body)")
            }
        }
    }
}
