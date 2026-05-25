package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.profile

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class ProfileScreen {
    func build() {
        Column(space: 12) {
            Text("Prachan Ghale")
                .fontSize(22)
                .fontWeight(FontWeight.Bold)

            Text("Hello, I am Prachan Ghale. I'm Mobile Application Developer based in kathmandu. I have been developing mobile application for over a year now.")
                .fontSize(14)

            Text("Technologies I Worked With")
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
            Text("Android App Development")
            Text("Flutter (Android, iOS and Web)")
            Text("Rest APIs")
            Text("Firebase")
            Text("Jetpack Compose")
            Text("Kotlin")
            Text("Room Database")

            Text("Tech That Interest's me")
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
            Text("Blockchain Technology")
            Text("Node.js")
            Text("KMM")
            Text("React")
            Text("Machine Learning and AI")
            Text("SQL")
            Text("Unity")
        }
        .padding(left: 24, right: 24, top: 32, bottom: 24)
    }
}
