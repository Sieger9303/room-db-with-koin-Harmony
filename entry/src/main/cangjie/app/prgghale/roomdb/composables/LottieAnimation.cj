package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.*

@Component
public class NoDataAnimation {
    func build() {
        Column(space: 12) {
            Image(@r(app.media.no_data_placeholder))
                .width(220)
                .height(165)
                .objectFit(ImageFit.Contain)

            Text("No Data")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .fontColor(0xFF374151)

            Text("No saved records are available yet.")
                .fontSize(14)
                .fontColor(0xFF6B7280)
                .textAlign(TextAlign.Center)
        }
        .width(100.percent)
        .padding(left: 24, right: 24, top: 32, bottom: 24)
        .alignItems(HorizontalAlign.Center)
    }
}
