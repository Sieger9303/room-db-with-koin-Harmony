package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.favorite

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.NoDataAnimation
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.UserProfileImg

@Component
public class FavoriteScreen {
    let visibleIndexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    @State var favoriteCount: Int64 = 0
    @State var statusMessage: String = "Tap refresh to load favorites"
    @State var refreshTick: Int64 = 0

    private func refreshFavorites(): Unit {
        favoriteCount = RoomDbContext.favoriteUserCount()
        statusMessage = if (favoriteCount == 0) { "No favorite users saved" } else { "Showing up to two favorite users" }
    }

    func build() {
        Column(space: 14) {
            Text("Favorite Users")
                .fontSize(22)
                .fontWeight(FontWeight.Bold)

            Text("Saved favorites: ${favoriteCount}")
                .fontSize(14)

            Text(statusMessage)
                .fontSize(12)

            if (favoriteCount == 0) {
                NoDataAnimation()
            } else {
                List(space: 12, initialIndex: 0) {
                    ForEach(this.visibleIndexes, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            if (item < favoriteCount) {
                                Column(space: 8) {
                                    Text("Favorite ${item + 1}")
                                        .fontSize(16)
                                        .fontWeight(FontWeight.Bold)
                                    UserProfileImg(initials: RoomDbContext.favoriteUserInitialsAt(item))
                                    Text(RoomDbContext.favoriteUserTitleAt(item))
                                        .fontSize(15)
                                    Text("Profession: ${RoomDbContext.favoriteUserProfessionAt(item)}")
                                        .fontSize(14)
                                    Text("Address: ${RoomDbContext.favoriteUserAddressAt(item)}")
                                        .fontSize(14)
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

            Button("Refresh favorites", ButtonOptions(shape: ButtonType.Normal))
                .onClick({ _ =>
                    refreshFavorites()
                    refreshTick += 1
                })

            Text("Refreshes: ${refreshTick}")
                .fontSize(12)
        }
        .padding(left: 24, right: 24, top: 32, bottom: 24)
        .onAppear({ =>
            refreshFavorites()
        })
    }
}
