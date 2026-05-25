package ohos_app_cangjie_entry

import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.app.createRoomDbAppBootstrap

func navigateNextScreen(label: String): Unit {
    RoomDbContext.navigate(label)
}

main(): Unit {
    let _bootstrap = createRoomDbAppBootstrap()
    RoomDbContext.bootstrap()
}
