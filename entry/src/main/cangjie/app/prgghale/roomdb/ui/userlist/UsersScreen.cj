package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.userlist

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.NoDataAnimation

@Component
public class UsersScreen {
    
    @State var refreshTick: Int64 = 0
let visibleIndexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    @State var userCount: Int64 = 0
    @State var pendingDeleteIndex: Int64 = -1
    @State var expandedIndex: Int64 = -1

    private func refreshUsers(): Unit {
        userCount = RoomDbContext.userProfessionCount()
        if (expandedIndex >= userCount) {
            expandedIndex = -1
        }
    }


private func toggleFavorite(index: Int64): Unit {
        let userId = RoomDbContext.userIdAt(index)
        let currentFavorite = RoomDbContext.userIsFavoriteAt(index)

        if (userId != "" && RoomDbContext.updateFavorite(userId, !currentFavorite)) {
            refreshUsers()
            refreshTick += 1
        } else {
        }
    }

private func removeUser(index: Int64): Unit {
        let userId = RoomDbContext.userIdAt(index)

        if (userId != "" && RoomDbContext.deleteUser(userId)) {
            refreshUsers()
            refreshTick += 1
            expandedIndex = -1
            pendingDeleteIndex = -1
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
            if (userCount == 0) {
                Column(space: 12) {
                    NoDataAnimation()
                    Text("No registered users yet")
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
                            if (item < userCount) {
                                Column(space: 0) {
                                    Row() {
                                        Row() {
                                            Text(RoomDbContext.userInitialsAt(item)).fontSize(16).fontWeight(FontWeight.Bold).fontColor(Color.White)
                                        }.width(48).height(48).borderRadius(24).backgroundColor(0xFF1D4ED8).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center)

                                        Column(space: 4) {
                                            Text(RoomDbContext.userTitleAt(item))
                                                .fontSize(15)
                                                .fontWeight(FontWeight.Medium)
                                                .fontColor(0xFF111827)

                                            Text(RoomDbContext.userProfessionNameAt(item))
                                                .fontSize(15)
                                                .fontWeight(FontWeight.Bold)
                                                .fontColor(0xFF1F2937)

                                            Text(RoomDbContext.userAddressAt(item))
                                                .fontSize(12)
                                                .fontColor(0xFF6B7280)
                                        }
                                        .layoutWeight(1)
                                        .margin(left: 12)

                                        if (expandedIndex == item) {
                                            Row(space: 10) {
                                                Row() {
                                                    Image(if (RoomDbContext.userIsFavoriteAt(item)) { @r(app.media.ic_star) } else { @r(app.media.ic_favorite_border) }).width(20).height(20).objectFit(ImageFit.Contain).fillColor(if (RoomDbContext.userIsFavoriteAt(item)) { Color(0xFFF59E0B) } else { Color(0xFF6B7280) })
                                                }
                                                .width(32)
                                                .height(32)
                                                .justifyContent(FlexAlign.Center)
                                                .alignItems(VerticalAlign.Center)
                                                .borderRadius(16)
                                                .onClick({ _ =>
                                                    toggleFavorite(item)
                                                })

                                                Row() {
                                                    Image(@r(app.media.ic_delete)).width(20).height(20).objectFit(ImageFit.Contain).fillColor(Color(0xFF6B7280))
                                                }
                                                .width(32)
                                                .height(32)
                                                .justifyContent(FlexAlign.Center)
                                                .alignItems(VerticalAlign.Center)
                                                .borderRadius(16)
                                                .onClick({ _ =>
                                                    removeUser(item)
                                                })
                                            }
                                            .margin(right: 8)
                                        }

                                        Row() {
                                            Image(@r(app.media.ic_chevron_right)).width(20).height(20).objectFit(ImageFit.Contain).fillColor(Color(0xFF6B7280))
                                        }
                                        .width(28)
                                        .height(28)
                                        .justifyContent(FlexAlign.Center)
                                        .alignItems(VerticalAlign.Center)
                                        .onClick({ _ =>
                                            expandedIndex = if (expandedIndex == item) { -1 } else { item }
                                        })
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

            if (pendingDeleteIndex >= 0) {
                Column(space: 12) {
                    Text("Delete this user?")
                        .fontSize(14)
                        .fontWeight(FontWeight.Medium)
                    Row(space: 10) {
                        Button("Delete", ButtonOptions(shape: ButtonType.Normal))
                            .backgroundColor(0xFFDC2626)
                            .fontColor(Color.White)
                            .onClick({ _ =>
                                removeUser(pendingDeleteIndex)
                            })
                        Button("Cancel", ButtonOptions(shape: ButtonType.Normal))
                            .onClick({ _ =>
                                pendingDeleteIndex = -1
                            })
                    }
                }
                .width(100.percent)
                .padding(12)
                .borderRadius(16)
                .backgroundColor(Color.White)
            }
        }
        .width(100.percent)
        .height(100.percent)
        .padding(left: 20, right: 20, top: 8, bottom: 16)
        .backgroundColor(0xFFF9FAFB)
        .onAppear({ =>
            refreshUsers()
            refreshTick += 1
        })
    }
}
