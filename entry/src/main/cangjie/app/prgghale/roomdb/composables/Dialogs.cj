package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class ShowDialog {
    @State var message: String = "Feature not available at the moment."

    func build() {
        Column(space: 10) {
            Text("Room DB")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
            Text(message)
                .fontSize(14)
            Text("Ok")
                .fontSize(12)
        }
        .padding(left: 20, right: 20, top: 16, bottom: 16)
    }
}

@Component
public class ShowDeleteDialog {
    func build() {
        Column(space: 10) {
            Text("Delete User")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
            Text("Do you want to delete user?")
                .fontSize(14)
            Text("Delete / Cancel")
                .fontSize(12)
        }
        .padding(left: 20, right: 20, top: 16, bottom: 16)
    }
}
