package ohos_app_cangjie_entry.app.prgghale.roomdb.app

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.BottomBar
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.BottomNavItems
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.bottomNavLabel
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.searchLabel
import ohos_app_cangjie_entry.app.prgghale.roomdb.composables.AppScaffold
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.favorite.FavoriteScreen
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.home.HomeScreen
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
            AppScaffold()

            if (currentRoute == bottomNavLabel(BottomNavItems.Home)) {
                HomeScreen()
            } else if (currentRoute == searchLabel()) {
                SearchScreen()
            } else if (currentRoute == bottomNavLabel(BottomNavItems.Bookings)) {
                UsersScreen()
            } else if (currentRoute == bottomNavLabel(BottomNavItems.Favorite)) {
                FavoriteScreen()
            } else if (currentRoute == bottomNavLabel(BottomNavItems.Loading)) {
                Column(space: 12) {
                    Text(bottomNavLabel(BottomNavItems.Loading))
                        .fontSize(22)
                        .fontWeight(FontWeight.Bold)
                    Text("Translated screen batch pending")
                        .fontSize(14)
                }
                .padding(left: 24, right: 24, top: 32, bottom: 24)
                .width(100.percent)
                .layoutWeight(1)
            } else {
                ProfileScreen()
            }

            BottomBar()
        }
        .width(100.percent)
        .height(100.percent)
    }
}
