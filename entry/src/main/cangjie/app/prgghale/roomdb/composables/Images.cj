package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class UserProfileImg {
    @State var initials: String = "U"

    func build() {
        Column() {
            Text(initials)
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
        }
        .padding(left: 14, right: 14, top: 14, bottom: 14)
    }
}
