package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext

public enum BottomNavItems {
    Home | Bookings | Favorite | Loading | Profile
}

public enum Screens {
    Search
}

public func bottomNavLabel(item: BottomNavItems): String {
    match (item) {
        case BottomNavItems.Home => "Add User"
        case BottomNavItems.Bookings => "Users List"
        case BottomNavItems.Favorite => "Favorite"
        case BottomNavItems.Loading => "Loading"
        case BottomNavItems.Profile => "Profile"
    }
}

public func searchLabel(): String {
    return "Search"
}

@Component
public class BottomBar {
    func build() {
        Row(space: 8) {
            Button(bottomNavLabel(BottomNavItems.Home), ButtonOptions(shape: ButtonType.Capsule))
                .onClick({ _ =>
                    RoomDbContext.navigate(bottomNavLabel(BottomNavItems.Home))
                })
            Button(bottomNavLabel(BottomNavItems.Bookings), ButtonOptions(shape: ButtonType.Capsule))
                .onClick({ _ =>
                    RoomDbContext.navigate(bottomNavLabel(BottomNavItems.Bookings))
                })
            Button(bottomNavLabel(BottomNavItems.Favorite), ButtonOptions(shape: ButtonType.Capsule))
                .onClick({ _ =>
                    RoomDbContext.navigate(bottomNavLabel(BottomNavItems.Favorite))
                })
            Button(bottomNavLabel(BottomNavItems.Loading), ButtonOptions(shape: ButtonType.Capsule))
                .onClick({ _ =>
                    RoomDbContext.navigate(bottomNavLabel(BottomNavItems.Loading))
                })
            Button(bottomNavLabel(BottomNavItems.Profile), ButtonOptions(shape: ButtonType.Capsule))
                .onClick({ _ =>
                    RoomDbContext.navigate(bottomNavLabel(BottomNavItems.Profile))
                })
        }
        .padding(left: 12, right: 12, top: 12, bottom: 12)
    }
}
