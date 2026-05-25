package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.home

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class HomeScreen {
    @State var firstName: String = ""
    @State var statusMessage: String = ""

    func build() {
        Column(space: 14) {
            Text("Add User")
                .fontSize(26)

            TextInput(text: firstName)
                .onChange({ value: String =>
                    firstName = value
                })

            Button("Add User", ButtonOptions(shape: ButtonType.Normal))
                .enabled(firstName != "")
                .onClick({ _ =>
                    statusMessage = "User added locally"
                    firstName = ""
                })

            if (statusMessage != "") {
                Text(statusMessage)
                    .fontSize(14)
            }
        }
        .padding(left: 24, right: 24, top: 32, bottom: 24)
        .width(100.percent)
        .height(100.percent)
    }
}
