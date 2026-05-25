package ohos_app_cangjie_entry

import kit.AbilityKit.LaunchParam
import kit.AbilityKit.UIAbility
import kit.AbilityKit.Want
import kit.ArkUI.WindowStage
import kit.PerformanceAnalysisKit.Hilog

class MainAbility <: UIAbility {
    public init() {
        super()
        registerSelf()
    }

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        Hilog.info(1, "RoomDb", "MainAbility onCreate")
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        Hilog.info(1, "RoomDb", "MainAbility onWindowStageCreate")
        windowStage.loadContent("EntryView")
    }
}
