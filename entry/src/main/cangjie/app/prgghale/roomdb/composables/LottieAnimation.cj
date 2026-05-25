package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class NoDataAnimation {
    func build() {
        Column(space: 8) {
            Text("No Data")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
            Text("No saved records are available yet.")
                .fontSize(14)
        }
        .padding(left: 24, right: 24, top: 32, bottom: 24)
    }
}
