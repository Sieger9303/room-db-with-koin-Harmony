package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.profile

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.UserProfileImg

@Component
public class ProfileScreen {
    let workedWith: Array<String> = [
        "Android App Development",
        "Flutter (Android, iOS and Web)",
        "Rest APIs",
        "Firebase",
        "Jetpack Compose",
        "Kotlin",
        "Dart",
        "Java",
        "Google Map Services and APIs",
        "Room Database"
    ]
    let interestedIn: Array<String> = [
        "Blockchain Technology",
        ".Net 6",
        "Node.js",
        "Kotlin/js",
        "KMM",
        "c#",
        "Solidity",
        "React",
        "Machine Learning and AI",
        "Jetpack compose for web",
        "Kotlin for Blockchain",
        "Kotlin for server side",
        "SQL",
        "Blazor",
        "Unity",
        "Kotlin for Desktop",
        "Blockchain Technology",
        ".Net 6",
        "Node.js",
        "Kotlin/js",
        "KMM",
        "c#",
        "Solidity",
        "React",
        "Machine Learning and AI",
        "Jetpack compose for web",
        "Kotlin for Blockchain",
        "Kotlin for server side",
        "SQL",
        "Blazor",
        "Unity",
        "Kotlin for Desktop"
    ]

    func build() {
        Column(space: 12) {
            Row() {
                UserProfileImg(initials: "PG")
                Column(space: 8) {
                    Text("Prachan Ghale")
                        .fontSize(22)
                        .fontWeight(FontWeight.Bold)

                    Text("Hello, I am Prachan Ghale. I'm Mobile Application Developer based in kathmandu. I have been developing mobile application for over a year now. I have worked on project which has potential to become very important in user's life which I'm really proud of.")
                        .fontSize(12)
                }
            }

            Text("Technologies I Worked With")
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
            List(space: 8, initialIndex: 0) {
                ForEach(this.workedWith, itemGeneratorFunc: { item: String, _: Int64 =>
                    ListItem() {
                        Text(item)
                            .fontSize(14)
                    }
                })
            }
            .height(240)
            .width(100.percent)
            .scrollBar(BarState.Off)

            Text("Tech That Interest's me")
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
            List(space: 8, initialIndex: 0) {
                ForEach(this.interestedIn, itemGeneratorFunc: { item: String, _: Int64 =>
                    ListItem() {
                        Text(item)
                            .fontSize(14)
                    }
                })
            }
            .height(320)
            .width(100.percent)
            .scrollBar(BarState.Off)
        }
        .padding(left: 24, right: 24, top: 32, bottom: 24)
    }
}
