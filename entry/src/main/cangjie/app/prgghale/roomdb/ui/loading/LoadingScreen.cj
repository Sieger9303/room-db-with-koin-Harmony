package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class LoadingScreen {
    @State var userCount: Int64 = 0
    @State var professionCount: Int64 = 0
    @State var userProfessionCount: Int64 = 0
    @State var refreshCount: Int64 = 0
    @State var activeLoaders: Int64 = 0
    @State var isLoading: Bool = false
    @State var statusMessage: String = "Press Refresh"

    private func refreshState(): Unit {
        let viewModel = LoadingViewModel()
        isLoading = true
        activeLoaders = 1
        statusMessage = "Loading observers..."
        let state = viewModel.refresh()
        userCount = state.userCount
        professionCount = state.professionCount
        userProfessionCount = state.userProfessionCount
        refreshCount += 1
        activeLoaders = viewModel.activeLoaders()
        isLoading = false
        statusMessage = if (state.userCount + state.professionCount + state.userProfessionCount > 0) { "Refresh completed" } else { "No data available" }
    }

    func build() {
        Scroll() {
            Column(space: 16) {
                Row() {
                    Button("Refresh", ButtonOptions(shape: ButtonType.Capsule))
                        .fontSize(14)
                        .fontWeight(FontWeight.Medium)
                        .backgroundColor(0xFFE5E7EB)
                        .fontColor(0xFF111827)
                        .onClick({ _ =>
                            refreshState()
                        })
                }
                .width(100.percent)
                .justifyContent(FlexAlign.Start)

                Column(space: 8) {
                    Text("Loading state")
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .fontColor(0xFF111827)

                    Text(statusMessage)
                        .fontSize(14)
                        .fontColor(0xFF6B7280)

                    if (isLoading) {
                        Row(space: 10) {
                            Row() {
                                Blank()
                            }
                            .width(18)
                            .height(18)
                            .borderRadius(9)
                            .backgroundColor(0xFF2563EB)

                            Text("Loading...")
                                .fontSize(14)
                                .fontColor(0xFF374151)
                        }
                        .width(100.percent)
                        .alignItems(VerticalAlign.Center)
                    } else {
                        Column(space: 4) {
                            Text("Completed")
                                .fontSize(12)
                                .fontColor(0xFF6B7280)

                            Text("${refreshCount} refreshes")
                                .fontSize(16)
                                .fontWeight(FontWeight.Medium)
                                .fontColor(0xFF111827)
                        }
                        .width(100.percent)
                        .padding(14)
                        .borderRadius(16)
                        .backgroundColor(0xFFF9FAFB)
                    }

                    Row(space: 12) {
                        Column(space: 4) {
                            Text("Active loaders")
                                .fontSize(12)
                                .fontColor(0xFF6B7280)

                            Text("${activeLoaders}")
                                .fontSize(16)
                                .fontWeight(FontWeight.Medium)
                                .fontColor(0xFF111827)
                        }
                        .layoutWeight(1)
                        .padding(14)
                        .borderRadius(16)
                        .backgroundColor(0xFFF9FAFB)

                        Column(space: 4) {
                            Text("Observed count")
                                .fontSize(12)
                                .fontColor(0xFF6B7280)

                            Text("${userCount + professionCount + userProfessionCount}")
                                .fontSize(16)
                                .fontWeight(FontWeight.Medium)
                                .fontColor(0xFF111827)
                        }
                        .layoutWeight(1)
                        .padding(14)
                        .borderRadius(16)
                        .backgroundColor(0xFFF9FAFB)
                    }
                    .width(100.percent)
                }
                .width(100.percent)
                .padding(16)
                .borderRadius(18)
                .backgroundColor(Color.White)

                Text("User observer")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(0xFF111827)
                    .width(100.percent)
                    .padding(left: 4, right: 4, top: 6, bottom: 2)

                Column(space: 6) {
                    Text("Users")
                        .fontSize(16)
                        .fontWeight(FontWeight.Medium)
                        .fontColor(0xFF111827)

                    Text("Count: ${userCount}")
                        .fontSize(14)
                        .fontColor(0xFF2563EB)

                    Text("User rows loaded from repository")
                        .fontSize(12)
                        .fontColor(0xFF6B7280)
                }
                .width(100.percent)
                .padding(16)
                .borderRadius(18)
                .backgroundColor(Color.White)

                Text("Profession observer")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(0xFF111827)
                    .width(100.percent)
                    .padding(left: 4, right: 4, top: 6, bottom: 2)

                Column(space: 6) {
                    Text("Professions")
                        .fontSize(16)
                        .fontWeight(FontWeight.Medium)
                        .fontColor(0xFF111827)

                    Text("Count: ${professionCount}")
                        .fontSize(14)
                        .fontColor(0xFF2563EB)

                    Text("Profession rows loaded from repository")
                        .fontSize(12)
                        .fontColor(0xFF6B7280)
                }
                .width(100.percent)
                .padding(16)
                .borderRadius(18)
                .backgroundColor(Color.White)

                Text("User profession observer")
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(0xFF111827)
                    .width(100.percent)
                    .padding(left: 4, right: 4, top: 6, bottom: 2)

                Column(space: 6) {
                    Text("User Profession")
                        .fontSize(16)
                        .fontWeight(FontWeight.Medium)
                        .fontColor(0xFF111827)

                    Text("Count: ${userProfessionCount}")
                        .fontSize(14)
                        .fontColor(0xFF2563EB)

                    Text("Joined user and profession rows")
                        .fontSize(12)
                        .fontColor(0xFF6B7280)
                }
                .width(100.percent)
                .padding(16)
                .borderRadius(18)
                .backgroundColor(Color.White)

                Row(space: 12) {
                    Column(space: 4) {
                        Text("Users")
                            .fontSize(12)
                            .fontColor(0xFF6B7280)

                        Text("${userCount}")
                            .fontSize(16)
                            .fontWeight(FontWeight.Medium)
                            .fontColor(0xFF111827)
                    }
                    .layoutWeight(1)
                    .padding(14)
                    .borderRadius(16)
                    .backgroundColor(Color.White)

                    Column(space: 4) {
                        Text("Professions")
                            .fontSize(12)
                            .fontColor(0xFF6B7280)

                        Text("${professionCount}")
                            .fontSize(16)
                            .fontWeight(FontWeight.Medium)
                            .fontColor(0xFF111827)
                    }
                    .layoutWeight(1)
                    .padding(14)
                    .borderRadius(16)
                    .backgroundColor(Color.White)
                }
                .width(100.percent)

                Column(space: 4) {
                    Text("User Profession")
                        .fontSize(12)
                        .fontColor(0xFF6B7280)

                    Text("${userProfessionCount}")
                        .fontSize(16)
                        .fontWeight(FontWeight.Medium)
                        .fontColor(0xFF111827)
                }
                .width(100.percent)
                .padding(14)
                .borderRadius(16)
                .backgroundColor(Color.White)

                Blank()
                    .height(96)
            }
            .width(100.percent)
            .padding(left: 20, right: 20, top: 16, bottom: 0)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xFFF9FAFB)
        .onAppear({ =>
            refreshState()
        })
    }
}
