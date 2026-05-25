package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.favorite

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.NoDataAnimation

@Component
public class FavoriteScreen {
    
    @State var refreshTick: Int64 = 0
let visibleIndexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    @State var favoriteCount: Int64 = 0

    private func refreshFavorites(): Unit {
        favoriteCount = RoomDbContext.favoriteUserCount()
    }

    private func unfavorite(index: Int64): Unit {
        if (RoomDbContext.unfavoriteAt(index)) {
            refreshFavorites()
            refreshTick += 1
        } else {
        }
    }


    func build() {
        Column(space: 12) {
            // __refreshTickUiDependency__: make refreshTick participate in the UI dependency graph.
            Text("${refreshTick}")
                .fontSize(1)
                .height(1)
                .fontColor(0x00FFFFFF)
            if (favoriteCount == 0) {
                Column(space: 12) {
                    NoDataAnimation()
                    Text("No favorite users yet")
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
                            if (item < favoriteCount) {
                                Column(space: 0) {
                                    Row() {
                                        Row() {
                                            Text(RoomDbContext.favoriteUserInitialsAt(item)).fontSize(16).fontWeight(FontWeight.Bold).fontColor(Color.White)
                                        }.width(48).height(48).borderRadius(24).backgroundColor(0xFF1D4ED8).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center)

                                        Column(space: 4) {
                                            Text(RoomDbContext.favoriteUserTitleAt(item)).fontSize(15).fontWeight(FontWeight.Medium).fontColor(0xFF111827)
                                            Text(RoomDbContext.favoriteUserProfessionAt(item)).fontSize(15).fontWeight(FontWeight.Bold).fontColor(0xFF1F2937)
                                            Text(RoomDbContext.favoriteUserAddressAt(item)).fontSize(12).fontColor(0xFF6B7280)
                                        }.layoutWeight(1).margin(left: 12)

                                        Row() {
                                            Image(@r(app.media.ic_star)).width(20).height(20).objectFit(ImageFit.Contain).fillColor(Color(0xFFF59E0B))
                                        }.width(28).height(28).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center).onClick({ _ =>
                                                unfavorite(item)
                                            })

                                        Row() {
                                            Image(@r(app.media.ic_chevron_right)).width(20).height(20).objectFit(ImageFit.Contain).fillColor(Color(0xFF6B7280))
                                        }.width(28).height(28).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center)
                                    }.width(100.percent).padding(left: 4, right: 4, top: 14, bottom: 14)

                                    Divider().strokeWidth(1).color(0xFFE5E7EB)
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
        .padding(left: 20, right: 20, top: 8, bottom: 16)
        .backgroundColor(0xFFF9FAFB)
        .onAppear({ =>
            refreshFavorites()
            refreshTick += 1
        })
    }
}
