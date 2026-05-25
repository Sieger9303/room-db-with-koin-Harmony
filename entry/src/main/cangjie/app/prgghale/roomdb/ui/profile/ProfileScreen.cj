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
        Scroll() {
            Column(space: 0) {
                Column(space: 0) {
                    Row() {
                        UserProfileImg(
                            initials: "PG",
                            size: 50,
                            textColor: Color(0xFF374151),
                            backgroundColor: Color(0xFFE5E7EB)
                        )

                        Column(space: 8) {
                            Text("Prachan Ghale")
                                .fontSize(18)
                                .fontWeight(FontWeight.Bold)
                                .fontColor(0xFF111827)

                            Text("Hello, I am Prachan Ghale. I'm Mobile Application Developer based in kathmandu. I have been developing mobile application for over a year now. I have worked on project which has potential to become very important in user's life which I'm really proud of.")
                                .fontSize(12)
                                .fontColor(0xFF6B7280)
                                .maxLines(20)
                        }
                        .layoutWeight(1)
                        .alignItems(HorizontalAlign.Start)
                        .margin(left: 12)
                    }
                    .width(100.percent)
                    .alignItems(VerticalAlign.Top)
                    .padding(left: 24, right: 24, top: 12, bottom: 12)
                }
                .width(100.percent)

                Blank()
                    .height(16)

                Text("Technologies I Worked With")
                    .width(100.percent)
                    .padding(left: 24, right: 24, top: 16, bottom: 16)
                    .backgroundColor(Color.White)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(0xFF111827)

                ForEach(this.workedWith, itemGeneratorFunc: { item: String, _: Int64 =>
                    Text(item)
                        .width(100.percent)
                        .padding(left: 24, right: 24, top: 12, bottom: 12)
                        .fontSize(14)
                        .fontColor(0xFF6B7280)
                })

                Text("Teach That Interest's me")
                    .width(100.percent)
                    .padding(left: 24, right: 24, top: 16, bottom: 16)
                    .backgroundColor(Color.White)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(0xFF111827)

                ForEach(this.interestedIn, itemGeneratorFunc: { item: String, _: Int64 =>
                    Text(item)
                        .width(100.percent)
                        .padding(left: 24, right: 24, top: 12, bottom: 12)
                        .fontSize(14)
                        .fontColor(0xFF6B7280)
                })

                Blank()
                    .height(96)
            }
            .width(100.percent)
            .backgroundColor(0xFFF9FAFB)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xFFF9FAFB)
    }
}
