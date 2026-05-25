package ohos_app_cangjie_entry.app.prgghale.roomdb.composables

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.*

@Component
public class AppIcon {
    @State var iconName: String = "search"
    @State var size: Int64 = 22
    @State var tint: Color = Color.Black

    func build() {
        if (iconName == "add") {
            Image(@r(app.media.ic_add))
                .width(size)
                .height(size)
                .objectFit(ImageFit.Contain)
                .fillColor(tint)
        } else if (iconName == "users") {
            Image(@r(app.media.ic_account_box))
                .width(size)
                .height(size)
                .objectFit(ImageFit.Contain)
                .fillColor(tint)
        } else if (iconName == "star") {
            Image(@r(app.media.ic_star))
                .width(size)
                .height(size)
                .objectFit(ImageFit.Contain)
                .fillColor(tint)
        } else if (iconName == "person") {
            Image(@r(app.media.ic_person))
                .width(size)
                .height(size)
                .objectFit(ImageFit.Contain)
                .fillColor(tint)
        } else if (iconName == "favorite_border") {
            Image(@r(app.media.ic_favorite_border))
                .width(size)
                .height(size)
                .objectFit(ImageFit.Contain)
                .fillColor(tint)
        } else if (iconName == "delete") {
            Image(@r(app.media.ic_delete))
                .width(size)
                .height(size)
                .objectFit(ImageFit.Contain)
                .fillColor(tint)
        } else if (iconName == "chevron_right") {
            Image(@r(app.media.ic_chevron_right))
                .width(size)
                .height(size)
                .objectFit(ImageFit.Contain)
                .fillColor(tint)
        } else if (iconName == "downloading") {
            Image(@r(app.media.ic_downloading))
                .width(size)
                .height(size)
                .objectFit(ImageFit.Contain)
                .fillColor(tint)
        } else {
            Image(@r(app.media.ic_search))
                .width(size)
                .height(size)
                .objectFit(ImageFit.Contain)
                .fillColor(tint)
        }
    }
}

@Component
public class TopAppBar {
    @State var title: String = "Add User"

    func build() {
        Row() {
            Blank()
                .width(44)

            Text(title)
                .layoutWeight(1)
                .textAlign(TextAlign.Center)
                .fontSize(20)
                .fontWeight(FontWeight.Medium)
                .fontColor(0xFF1F2937)

            Row() {
                AppIcon(iconName: "search", size: 20, tint: Color(0xFF111827))
            }
            .width(44)
            .height(44)
            .justifyContent(FlexAlign.Center)
            .alignItems(VerticalAlign.Center)
        }
        .width(100.percent)
        .padding(left: 16, right: 16, top: 14, bottom: 10)
        .backgroundColor(Color.White)
    }
}
