package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class UserProfileImg {
    @State var initials: String = "U"

    func build() {
        Row() {
            Text(initials)
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
        }
        .width(48)
        .height(48)
        .borderRadius(24)
        .backgroundColor(0xFF1D4ED8)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
    }
}
