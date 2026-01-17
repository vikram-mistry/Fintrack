import Capacitor

@objc(FintrackWidgetBridge)
public class FintrackWidgetBridge: CAPPlugin {
    
    override public func load() {
        print("------------- WIDGET DATA BRIDGE LOADED -------------")
    }

    @objc func saveData(_ call: CAPPluginCall) {
        guard let data = call.getString("json") else {
            call.reject("Must provide json string")
            return
        }
        
        // IMPORTANT: replace with your actual App Group ID from Xcode
        let userDefaults = UserDefaults(suiteName: "group.com.budgetpro.data")
        userDefaults?.set(data, forKey: "widgetData")
        userDefaults?.synchronize()
        
        call.resolve()
    }
}
