package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class UserProfileImg {
    @State var initials: String = "U"
    @State var size: Int64 = 48
    @State var textColor: Color = Color(0xFF374151)
    @State var backgroundColor: Color = Color(0xFFE5E7EB)

    func build() {
        Row() {
            Text(initials)
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(textColor)
        }
        .width(size)
        .height(size)
        .borderRadius(size / 2)
        .backgroundColor(backgroundColor)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
    }
}
