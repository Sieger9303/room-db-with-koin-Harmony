package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class AppScaffold {
    func build() {
        Column(space: 0) {
            Row() {
                Text("Room DB")
                    .fontSize(24)
                    .fontWeight(FontWeight.Bold)

                Blank()
                    .layoutWeight(1)

                Button("Search", ButtonOptions(shape: ButtonType.Capsule))
                    .enabled(false)
            }
            .padding(left: 20, right: 20, top: 18, bottom: 16)
        }
        .width(100.percent)
        .height(100.percent)
    }
}
