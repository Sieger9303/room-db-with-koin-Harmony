package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Component
public class LoadingScreen {
    let summaryLabels: Array<String> = ["Users", "Professions", "Joined rows", "Active loaders"]
    @State var userCount: Int64 = 0
    @State var professionCount: Int64 = 0
    @State var userProfessionCount: Int64 = 0
    @State var refreshCount: Int64 = 0
    @State var activeLoaders: Int64 = 0
    @State var statusMessage: String = "Press refresh to sync counters"

    private func refreshState(): Unit {
        let viewModel = LoadingViewModel()
        let state = viewModel.refresh()
        userCount = state.userCount
        professionCount = state.professionCount
        userProfessionCount = state.userProfessionCount
        refreshCount += 1
        activeLoaders = viewModel.activeLoaders()
        statusMessage = if (state.isLoading()) { "Refresh completed" } else { "Idle" }
    }

    func build() {
        Column(space: 14) {
            Text("Loading Demo")
                .fontSize(22)
                .fontWeight(FontWeight.Bold)

            Text(statusMessage)
                .fontSize(14)

            List(space: 10, initialIndex: 0) {
                ForEach(this.summaryLabels, itemGeneratorFunc: { item: String, _: Int64 =>
                    ListItem() {
                        Column(space: 6) {
                            Text(item)
                                .fontSize(14)
                            if (item == "Users") {
                                Text("Count: ${userCount}")
                                    .fontSize(12)
                            } else if (item == "Professions") {
                                Text("Count: ${professionCount}")
                                    .fontSize(12)
                            } else if (item == "Joined rows") {
                                Text("Count: ${userProfessionCount}")
                                    .fontSize(12)
                            } else {
                                Text("Count: ${activeLoaders}")
                                    .fontSize(12)
                            }
                        }
                    }
                })
            }
            .height(180)
            .width(100.percent)
            .scrollBar(BarState.Off)

            Button("Refresh", ButtonOptions(shape: ButtonType.Normal))
                .onClick({ _ =>
                    refreshState()
                })

            Text("Refreshes: ${refreshCount}")
                .fontSize(12)

            Text("Users=${userCount}, Professions=${professionCount}, Joined=${userProfessionCount}")
                .fontSize(12)
        }
        .padding(left: 24, right: 24, top: 32, bottom: 24)
        .onAppear({ =>
            refreshState()
        })
    }
}
