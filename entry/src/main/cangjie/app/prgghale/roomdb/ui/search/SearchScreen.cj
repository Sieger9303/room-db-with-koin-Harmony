package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.search

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.ShowDialog
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.UserProfileImg

@Component
public class SearchScreen {
    let visibleIndexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    @State var query: String = ""
    @State var resultCount: Int64 = 0
    @State var dialogVisible: Bool = false
    @State var refreshTick: Int64 = 0

    private func refreshResults(): Unit {
        let viewModel = SearchViewModel()
        resultCount = viewModel.searchCount(query)
    }

    func build() {
        Column(space: 14) {
            Text("Search Users")
                .fontSize(22)
                .fontWeight(FontWeight.Bold)

            Text("Search by first name")
                .fontSize(14)

            TextInput(text: query)
                .onChange({ value: String =>
                    query = value
                    refreshResults()
                })

            Text(SearchViewModel().searchHint(query))
                .fontSize(14)

            Text("Matching results: ${resultCount}")
                .fontSize(14)

            if (resultCount > 0) {
                List(space: 12, initialIndex: 0) {
                    ForEach(this.visibleIndexes, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            if (item < resultCount) {
                                Column(space: 8) {
                                    Text("Result ${item + 1}")
                                        .fontSize(16)
                                        .fontWeight(FontWeight.Bold)
                                    UserProfileImg(initials: RoomDbContext.searchInitialsAt(query, item))
                                    Text(RoomDbContext.searchTitleAt(query, item))
                                        .fontSize(15)
                                    Text("Profession: ${RoomDbContext.searchProfessionAt(query, item)}")
                                        .fontSize(14)
                                    Text("Address: ${RoomDbContext.searchAddressAt(query, item)}")
                                        .fontSize(14)
                                    Text("Favorite state: ${RoomDbContext.searchFavoriteLabelAt(query, item)}")
                                        .fontSize(14)
                                    Button("Open result actions", ButtonOptions(shape: ButtonType.Normal))
                                        .onClick({ _ =>
                                            dialogVisible = true
                                        })
                                }
                            } else {
                                Column() {
                                    Text("")
                                }
                            }
                        }
                    })
                }
                .height(320)
                .width(100.percent)
                .scrollBar(BarState.Off)
            }

            Button("Recheck results", ButtonOptions(shape: ButtonType.Normal))
                .onClick({ _ =>
                    refreshResults()
                    refreshTick += 1
                })

            Text("Refreshes: ${refreshTick}")
                .fontSize(12)

            if (dialogVisible) {
                ShowDialog()
                Button("Close notice", ButtonOptions(shape: ButtonType.Normal))
                    .onClick({ _ =>
                        dialogVisible = false
                    })
            }
        }
        .padding(left: 24, right: 24, top: 32, bottom: 24)
        .onAppear({ =>
            refreshResults()
        })
    }
}
