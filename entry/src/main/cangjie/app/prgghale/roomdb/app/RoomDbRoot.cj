package ohos_app_cangjie_entry.app.prgghale.roomdb.app

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.BottomNavItems
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.bottomNavLabel
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.searchLabel
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.favorite.FavoriteScreen
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.home.HomeScreen
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading.LoadingScreen
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.profile.ProfileScreen
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.search.SearchScreen
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.userlist.UsersScreen

@Component
public class RoomDbRoot {
    @State var currentRoute: String = bottomNavLabel(BottomNavItems.Home)
    @State var title: String = bottomNavLabel(BottomNavItems.Home)

    private func navigate(label: String) {
        currentRoute = label
        title = label
        RoomDbContext.navigate(label)
    }

    func build() {
        Column(space: 0) {
            Row() {
                Blank()
                    .width(44)

                Text(title)
                    .layoutWeight(1)
                    .textAlign(TextAlign.Center)
                    .fontSize(20)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(0xFF111827)

                Row() {
                    Image(@r(app.media.ic_search))
                        .width(20)
                        .height(20)
                        .objectFit(ImageFit.Contain)
                        .fillColor(Color(0xFF111827))
                }
                .width(44)
                .height(44)
                .justifyContent(FlexAlign.Center)
                .alignItems(VerticalAlign.Center)
                .borderRadius(22)
                .onClick({ _ =>
                    navigate(searchLabel())
                })
            }
            .width(100.percent)
            .padding(left: 16, right: 16, top: 12, bottom: 10)
            .backgroundColor(Color.White)

            Column() {
                if (currentRoute == bottomNavLabel(BottomNavItems.Home)) {
                    HomeScreen()
                } else if (currentRoute == bottomNavLabel(BottomNavItems.Bookings)) {
                    UsersScreen()
                } else if (currentRoute == bottomNavLabel(BottomNavItems.Favorite)) {
                    FavoriteScreen()
                } else if (currentRoute == bottomNavLabel(BottomNavItems.Loading)) {
                    LoadingScreen()
                } else if (currentRoute == bottomNavLabel(BottomNavItems.Profile)) {
                    ProfileScreen()
                } else {
                    SearchScreen()
                }
            }
            .layoutWeight(1)
            .width(100.percent)
            .backgroundColor(0xFFF9FAFB)

            Row(space: 0) {
                Row() {
                    Column(space: 4) {
                        Row() {
                            Image(@r(app.media.ic_add)).width(22).height(22).objectFit(ImageFit.Contain).fillColor(if (currentRoute == bottomNavLabel(BottomNavItems.Home)) { Color(0xFF1D4ED8) } else { Color(0xFF6B7280) })
                        }.width(40).height(32).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center).borderRadius(18).backgroundColor(if (currentRoute == bottomNavLabel(BottomNavItems.Home)) { 0x1A2563EB } else { Color.Transparent })
                        Text(bottomNavLabel(BottomNavItems.Home)).fontSize(11).fontWeight(if (currentRoute == bottomNavLabel(BottomNavItems.Home)) { FontWeight.Medium } else { FontWeight.Normal }).fontColor(if (currentRoute == bottomNavLabel(BottomNavItems.Home)) { 0xFF1D4ED8 } else { 0xFF4B5563 }).textAlign(TextAlign.Center).maxLines(1)
                    }.width(100.percent).padding(top: 8, bottom: 8).alignItems(HorizontalAlign.Center)
                }
                .layoutWeight(1)
                .onClick({ _ =>
                    navigate(bottomNavLabel(BottomNavItems.Home))
                })

                Row() {
                    Column(space: 4) {
                        Row() {
                            Image(@r(app.media.ic_account_box)).width(22).height(22).objectFit(ImageFit.Contain).fillColor(if (currentRoute == bottomNavLabel(BottomNavItems.Bookings)) { Color(0xFF1D4ED8) } else { Color(0xFF6B7280) })
                        }.width(40).height(32).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center).borderRadius(18).backgroundColor(if (currentRoute == bottomNavLabel(BottomNavItems.Bookings)) { 0x1A2563EB } else { Color.Transparent })
                        Text(bottomNavLabel(BottomNavItems.Bookings)).fontSize(11).fontWeight(if (currentRoute == bottomNavLabel(BottomNavItems.Bookings)) { FontWeight.Medium } else { FontWeight.Normal }).fontColor(if (currentRoute == bottomNavLabel(BottomNavItems.Bookings)) { 0xFF1D4ED8 } else { 0xFF4B5563 }).textAlign(TextAlign.Center).maxLines(1)
                    }.width(100.percent).padding(top: 8, bottom: 8).alignItems(HorizontalAlign.Center)
                }
                .layoutWeight(1)
                .onClick({ _ =>
                    navigate(bottomNavLabel(BottomNavItems.Bookings))
                })

                Row() {
                    Column(space: 4) {
                        Row() {
                            Image(@r(app.media.ic_star)).width(22).height(22).objectFit(ImageFit.Contain).fillColor(if (currentRoute == bottomNavLabel(BottomNavItems.Favorite)) { Color(0xFF1D4ED8) } else { Color(0xFF6B7280) })
                        }.width(40).height(32).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center).borderRadius(18).backgroundColor(if (currentRoute == bottomNavLabel(BottomNavItems.Favorite)) { 0x1A2563EB } else { Color.Transparent })
                        Text(bottomNavLabel(BottomNavItems.Favorite)).fontSize(11).fontWeight(if (currentRoute == bottomNavLabel(BottomNavItems.Favorite)) { FontWeight.Medium } else { FontWeight.Normal }).fontColor(if (currentRoute == bottomNavLabel(BottomNavItems.Favorite)) { 0xFF1D4ED8 } else { 0xFF4B5563 }).textAlign(TextAlign.Center).maxLines(1)
                    }.width(100.percent).padding(top: 8, bottom: 8).alignItems(HorizontalAlign.Center)
                }
                .layoutWeight(1)
                .onClick({ _ =>
                    navigate(bottomNavLabel(BottomNavItems.Favorite))
                })

                Row() {
                    Column(space: 4) {
                        Row() {
                            Image(@r(app.media.ic_downloading)).width(22).height(22).objectFit(ImageFit.Contain).fillColor(if (currentRoute == bottomNavLabel(BottomNavItems.Loading)) { Color(0xFF1D4ED8) } else { Color(0xFF6B7280) })
                        }.width(40).height(32).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center).borderRadius(18).backgroundColor(if (currentRoute == bottomNavLabel(BottomNavItems.Loading)) { 0x1A2563EB } else { Color.Transparent })
                        Text(bottomNavLabel(BottomNavItems.Loading)).fontSize(11).fontWeight(if (currentRoute == bottomNavLabel(BottomNavItems.Loading)) { FontWeight.Medium } else { FontWeight.Normal }).fontColor(if (currentRoute == bottomNavLabel(BottomNavItems.Loading)) { 0xFF1D4ED8 } else { 0xFF4B5563 }).textAlign(TextAlign.Center).maxLines(1)
                    }.width(100.percent).padding(top: 8, bottom: 8).alignItems(HorizontalAlign.Center)
                }
                .layoutWeight(1)
                .onClick({ _ =>
                    navigate(bottomNavLabel(BottomNavItems.Loading))
                })

                Row() {
                    Column(space: 4) {
                        Row() {
                            Image(@r(app.media.ic_person)).width(22).height(22).objectFit(ImageFit.Contain).fillColor(if (currentRoute == bottomNavLabel(BottomNavItems.Profile)) { Color(0xFF1D4ED8) } else { Color(0xFF6B7280) })
                        }.width(40).height(32).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center).borderRadius(18).backgroundColor(if (currentRoute == bottomNavLabel(BottomNavItems.Profile)) { 0x1A2563EB } else { Color.Transparent })
                        Text(bottomNavLabel(BottomNavItems.Profile)).fontSize(11).fontWeight(if (currentRoute == bottomNavLabel(BottomNavItems.Profile)) { FontWeight.Medium } else { FontWeight.Normal }).fontColor(if (currentRoute == bottomNavLabel(BottomNavItems.Profile)) { 0xFF1D4ED8 } else { 0xFF4B5563 }).textAlign(TextAlign.Center).maxLines(1)
                    }.width(100.percent).padding(top: 8, bottom: 8).alignItems(HorizontalAlign.Center)
                }
                .layoutWeight(1)
                .onClick({ _ =>
                    navigate(bottomNavLabel(BottomNavItems.Profile))
                })
            }
            .width(100.percent)
            .padding(left: 8, right: 8, top: 6, bottom: 10)
            .backgroundColor(Color.White)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xFFF9FAFB)
        .onAppear({ =>
            RoomDbContext.bootstrap()
            currentRoute = RoomDbContext.currentRoute()
            title = currentRoute
        })
    }
}
