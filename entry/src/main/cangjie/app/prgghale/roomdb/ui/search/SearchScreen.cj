package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.search

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.NoDataAnimation

@Component
public class SearchScreen {
    let visibleIndexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    @State var query: String = ""
    @State var resultCount: Int64 = 0

    private func refreshResults(): Unit {
        resultCount = RoomDbContext.searchCount(query)
    }

    func build() {
        Column(space: 16) {
            Row(space: 10) {
                Row() {
                    Image(@r(app.media.ic_search)).width(18).height(18).objectFit(ImageFit.Contain).fillColor(Color(0xFF6B7280))
                }
                .width(20)
                .height(48)
                .justifyContent(FlexAlign.Center)
                .alignItems(VerticalAlign.Center)

                TextInput(text: query)
                    .layoutWeight(1)
                    .height(48)
                    .backgroundColor(0xFFF3F4F6)
                    .borderRadius(24)
                    .padding(left: 14, right: 14)
                    .onChange({ value: String =>
                        query = value
                        refreshResults()
                    })
            }
            .width(100.percent)
            .padding(left: 4, right: 4)

            if (resultCount == 0) {
                Column(space: 12) {
                    NoDataAnimation()
                    Text(if (query == "") { "Search users" } else { "No users found" })
                        .fontSize(14)
                        .fontColor(0xFF6B7280)
                }
                .width(100.percent)
                .padding(top: 40)
                .alignItems(HorizontalAlign.Center)
            } else {
                List(space: 0, initialIndex: 0) {
                    ForEach(this.visibleIndexes, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            if (item < resultCount) {
                                Column(space: 0) {
                                    Row() {
                                        Row() {
                                            Text(RoomDbContext.searchInitialsAt(query, item)).fontSize(16).fontWeight(FontWeight.Bold).fontColor(Color.White)
                                        }.width(48).height(48).borderRadius(24).backgroundColor(0xFF1D4ED8).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center)

                                        Column(space: 4) {
                                            Text(RoomDbContext.searchTitleAt(query, item))
                                                .fontSize(15)
                                                .fontWeight(FontWeight.Medium)
                                                .fontColor(0xFF111827)

                                            Text(RoomDbContext.searchProfessionAt(query, item))
                                                .fontSize(15)
                                                .fontWeight(FontWeight.Bold)
                                                .fontColor(0xFF1F2937)

                                            Text(RoomDbContext.searchAddressAt(query, item))
                                                .fontSize(12)
                                                .fontColor(0xFF6B7280)
                                        }
                                        .layoutWeight(1)
                                        .margin(left: 12)

                                        Row() {
                                            Image(if (RoomDbContext.searchFavoriteLabelAt(query, item) == "Favorite") { @r(app.media.ic_star) } else { @r(app.media.ic_favorite_border) }).width(20).height(20).objectFit(ImageFit.Contain).fillColor(if (RoomDbContext.searchFavoriteLabelAt(query, item) == "Favorite") { Color(0xFFF59E0B) } else { Color(0xFF6B7280) })
                                        }
                                        .width(28)
                                        .height(28)
                                        .justifyContent(FlexAlign.Center)
                                        .alignItems(VerticalAlign.Center)
                                    }
                                    .width(100.percent)
                                    .padding(left: 4, right: 4, top: 14, bottom: 14)

                                    Divider()
                                        .strokeWidth(1)
                                        .color(0xFFE5E7EB)
                                }
                            }
                        }
                    })
                }
                .width(100.percent)
                .layoutWeight(1)
                .scrollBar(BarState.Off)
            }
        }
        .width(100.percent)
        .height(100.percent)
        .padding(left: 20, right: 20, top: 16, bottom: 16)
        .backgroundColor(0xFFF9FAFB)
        .onAppear({ =>
            refreshResults()
        })
    }
}
