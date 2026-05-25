package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

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

public func bottomNavIcon(item: BottomNavItems): String {
    match (item) {
        case BottomNavItems.Home => "add"
        case BottomNavItems.Bookings => "users"
        case BottomNavItems.Favorite => "star"
        case BottomNavItems.Loading => "downloading"
        case BottomNavItems.Profile => "person"
    }
}

public func searchLabel(): String {
    return "Search"
}

@Component
public class BottomNavItemView {
    @State var label: String = "Add User"
    @State var iconName: String = "add"
    @State var selected: Bool = false

    func build() {
        Column(space: 4) {
            Row() {
                AppIcon(
                    iconName: iconName,
                    size: 22,
                    tint: if (selected) { Color(0xFF1D4ED8) } else { Color(0xFF6B7280) }
                )
            }
            .width(40)
            .height(32)
            .justifyContent(FlexAlign.Center)
            .alignItems(VerticalAlign.Center)
            .borderRadius(18)
            .backgroundColor(if (selected) { 0x1A2563EB } else { Color.Transparent })

            Text(label)
                .fontSize(11)
                .fontWeight(if (selected) { FontWeight.Medium } else { FontWeight.Normal })
                .fontColor(if (selected) { 0xFF1D4ED8 } else { 0xFF4B5563 })
                .maxLines(1)
                .textAlign(TextAlign.Center)
        }
        .width(100.percent)
        .padding(top: 8, bottom: 8)
        .alignItems(HorizontalAlign.Center)
    }
}

@Component
public class BottomBar {
    @State var currentRoute: String = bottomNavLabel(BottomNavItems.Home)

    func build() {
        Row(space: 0) {
            Row() {
                BottomNavItemView(label: bottomNavLabel(BottomNavItems.Home), iconName: bottomNavIcon(BottomNavItems.Home), selected: currentRoute == bottomNavLabel(BottomNavItems.Home))
            }
            .layoutWeight(1)
            Row() {
                BottomNavItemView(label: bottomNavLabel(BottomNavItems.Bookings), iconName: bottomNavIcon(BottomNavItems.Bookings), selected: currentRoute == bottomNavLabel(BottomNavItems.Bookings))
            }
            .layoutWeight(1)
            Row() {
                BottomNavItemView(label: bottomNavLabel(BottomNavItems.Favorite), iconName: bottomNavIcon(BottomNavItems.Favorite), selected: currentRoute == bottomNavLabel(BottomNavItems.Favorite))
            }
            .layoutWeight(1)
            Row() {
                BottomNavItemView(label: bottomNavLabel(BottomNavItems.Loading), iconName: bottomNavIcon(BottomNavItems.Loading), selected: currentRoute == bottomNavLabel(BottomNavItems.Loading))
            }
            .layoutWeight(1)
            Row() {
                BottomNavItemView(label: bottomNavLabel(BottomNavItems.Profile), iconName: bottomNavIcon(BottomNavItems.Profile), selected: currentRoute == bottomNavLabel(BottomNavItems.Profile))
            }
            .layoutWeight(1)
        }
        .width(100.percent)
        .padding(left: 8, right: 8, top: 6, bottom: 10)
        .backgroundColor(Color.White)
    }
}
