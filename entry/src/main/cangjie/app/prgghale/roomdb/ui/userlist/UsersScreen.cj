package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.userlist

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.NoDataAnimation
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.ShowDeleteDialog
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.UserProfileImg
import ohos_app_cangjie_entry.app.prgghale.roomdb.extesion.toastS

@Component
public class UsersScreen {
    let visibleIndexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    @State var userCount: Int64 = 0
    @State var pendingDeleteIndex: Int64 = -1
    @State var statusMessage: String = ""
    @State var refreshTick: Int64 = 0

    private func refreshUsers(): Unit {
        userCount = RoomDbContext.userProfessionCount()
    }

    private func toggleFavorite(index: Int64): Unit {
        if (RoomDbContext.toggleFavoriteAt(index)) {
            refreshUsers()
            statusMessage = toastS("Favorite updated")
        } else {
            statusMessage = toastS("Failed to update favorite")
        }
    }

    private func removeUser(index: Int64): Unit {
        if (RoomDbContext.deleteUserAt(index)) {
            refreshUsers()
            statusMessage = toastS("User deleted")
            pendingDeleteIndex = -1
        } else {
            statusMessage = toastS("Failed to delete user")
        }
    }

    func build() {
        Column(space: 14) {
            Text("Users List")
                .fontSize(22)
                .fontWeight(FontWeight.Bold)

            Text("Saved users: ${userCount}")
                .fontSize(14)

            if (userCount == 0) {
                NoDataAnimation()
            } else {
                List(space: 12, initialIndex: 0) {
                    ForEach(this.visibleIndexes, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            if (item < userCount) {
                                Column(space: 8) {
                                    Text("User ${item + 1}")
                                        .fontSize(16)
                                        .fontWeight(FontWeight.Bold)
                                    UserProfileImg(initials: RoomDbContext.userInitialsAt(item))
                                    Text(RoomDbContext.userTitleAt(item))
                                        .fontSize(15)
                                    Text("Profession: ${RoomDbContext.userProfessionNameAt(item)}")
                                        .fontSize(14)
                                    Text("Address: ${RoomDbContext.userAddressAt(item)}")
                                        .fontSize(14)
                                    Text("Favorite state: ${RoomDbContext.userFavoriteLabelAt(item)}")
                                        .fontSize(14)
                                    Button("Toggle favorite", ButtonOptions(shape: ButtonType.Normal))
                                        .onClick({ _ =>
                                            toggleFavorite(item)
                                        })
                                    Button("Delete user", ButtonOptions(shape: ButtonType.Normal))
                                        .onClick({ _ =>
                                            pendingDeleteIndex = item
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
                .height(360)
                .width(100.percent)
                .scrollBar(BarState.Off)
            }

            Button("Refresh users", ButtonOptions(shape: ButtonType.Normal))
                .onClick({ _ =>
                    refreshUsers()
                    refreshTick += 1
                })

            if (statusMessage != "") {
                Text(statusMessage)
                    .fontSize(12)
            }

            Text("Refreshes: ${refreshTick}")
                .fontSize(12)

            if (pendingDeleteIndex >= 0) {
                ShowDeleteDialog()
                Button("Confirm delete", ButtonOptions(shape: ButtonType.Normal))
                    .onClick({ _ =>
                        removeUser(pendingDeleteIndex)
                    })
                Button("Cancel delete", ButtonOptions(shape: ButtonType.Normal))
                    .onClick({ _ =>
                        pendingDeleteIndex = -1
                    })
            }
        }
        .padding(left: 24, right: 24, top: 32, bottom: 24)
        .onAppear({ =>
            refreshUsers()
        })
    }
}
