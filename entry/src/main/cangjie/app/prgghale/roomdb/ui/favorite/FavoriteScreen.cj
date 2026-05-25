package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.favorite

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.NoDataAnimation
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.UserProfileImg

@Component
public class FavoriteScreen {
    @State var refreshTick: Int64 = 0
    let visibleIndexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    @State var favoriteCount: Int64 = 0

    private func refreshFavorites(): Unit {
        favoriteCount = RoomDbContext.favoriteUserCount()
    }

    func build() {
        Column(space: 0) {
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
                        .textAlign(TextAlign.Center)
                }
                .width(100.percent)
                .layoutWeight(1)
                .padding(top: 36, bottom: 88)
                .alignItems(HorizontalAlign.Center)
                .justifyContent(FlexAlign.Center)
            } else {
                List(space: 14, initialIndex: 0) {
                    ForEach(this.visibleIndexes, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            if (item < favoriteCount) {
                                Column(space: 0) {
                                    Row(space: 12) {
                                        UserProfileImg(
                                            initials: RoomDbContext.favoriteUserInitialsAt(item),
                                            size: 50,
                                            textColor: Color(0xFF4B5563),
                                            backgroundColor: Color(0xFFE5E7EB)
                                        )

                                        Text(RoomDbContext.favoriteUserTitleAt(item))
                                            .layoutWeight(1)
                                            .fontSize(16)
                                            .fontWeight(FontWeight.Medium)
                                            .fontColor(0xFF374151)
                                            .maxLines(1)
                                    }
                                    .width(100.percent)
                                    .padding(left: 16, right: 16, top: 16, bottom: 16)
                                    .backgroundColor(Color.White)
                                    .borderRadius(16)
                                    .alignItems(VerticalAlign.Center)
                                    .margin(left: 2, right: 2)
                                }
                            }
                        }
                    })
                }
                .width(100.percent)
                .layoutWeight(1)
                .scrollBar(BarState.Off)
                .padding(top: 12, bottom: 88)
            }
        }
        .width(100.percent)
        .height(100.percent)
        .padding(left: 16, right: 16, top: 8, bottom: 0)
        .backgroundColor(0xFFF9FAFB)
        .onAppear({ =>
            refreshFavorites()
            refreshTick += 1
        })
    }
}
