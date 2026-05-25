package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class CustomTextField {
    @State var value: String = ""
    @State var label: String = ""

    func build() {
        Column(space: 8) {
            if (label != "") {
                Text(label)
                    .fontSize(14)
            }
            TextInput(text: value)
                .onChange({ next: String =>
                    value = next
                })
        }
        .width(100.percent)
    }
}
