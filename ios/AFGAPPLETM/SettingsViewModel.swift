import SwiftUI
import Observation

@Observable
final class SettingsViewModel {
    var isEnabled: Bool = false
    var espBox: Bool = true
    var espLine: Bool = true
    var espHealth: Bool = true
    var espDistance: Bool = true
    var espName: Bool = true
    var espSkeleton: Bool = false
    var espHead: Bool = false
    var fov: Double = 90.0
    var aimbot: Bool = false
    var noRecoil: Bool = false

    init() {
        let defaults = UserDefaults.standard
        isEnabled = defaults.bool(forKey: "afg_enabled")
        espBox = defaults.object(forKey: "afg_esp_box") as? Bool ?? true
        espLine = defaults.object(forKey: "afg_esp_line") as? Bool ?? true
        espHealth = defaults.object(forKey: "afg_esp_health") as? Bool ?? true
        espDistance = defaults.object(forKey: "afg_esp_distance") as? Bool ?? true
        espName = defaults.object(forKey: "afg_esp_name") as? Bool ?? true
        espSkeleton = defaults.bool(forKey: "afg_esp_skeleton")
        espHead = defaults.bool(forKey: "afg_esp_head")
        fov = defaults.object(forKey: "afg_fov") as? Double ?? 90.0
        aimbot = defaults.bool(forKey: "afg_aimbot")
        noRecoil = defaults.bool(forKey: "afg_no_recoil")
    }

    func save() {
        let defaults = UserDefaults.standard
        defaults.set(isEnabled, forKey: "afg_enabled")
        defaults.set(espBox, forKey: "afg_esp_box")
        defaults.set(espLine, forKey: "afg_esp_line")
        defaults.set(espHealth, forKey: "afg_esp_health")
        defaults.set(espDistance, forKey: "afg_esp_distance")
        defaults.set(espName, forKey: "afg_esp_name")
        defaults.set(espSkeleton, forKey: "afg_esp_skeleton")
        defaults.set(espHead, forKey: "afg_esp_head")
        defaults.set(fov, forKey: "afg_fov")
        defaults.set(aimbot, forKey: "afg_aimbot")
        defaults.set(noRecoil, forKey: "afg_no_recoil")
    }
}
