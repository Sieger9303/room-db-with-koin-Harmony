package ohos_app_cangjie_entry

import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext

func navigateNextScreen(label: String): Unit {
    RoomDbContext.navigate(label)
}

main(): Unit {
    RoomDbContext.bootstrap()
}
