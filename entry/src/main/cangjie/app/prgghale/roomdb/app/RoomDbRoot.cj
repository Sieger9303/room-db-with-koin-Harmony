package ohos_app_cangjie_entry.app.prgghale.roomdb.app

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.home.HomeScreen

@Component
public class RoomDbRoot {
    func build() {
        Column() {
            Text("Room DB")
                .fontSize(24)
                .fontWeight(FontWeight.Bold)
                .margin(top: 18, left: 20, right: 20, bottom: 16)
            HomeScreen()
        }
        .width(100.percent)
        .height(100.percent)
    }
}
