package ohos_app_cangjie_entry.app.prgghale.roomdb.app

import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbAppBootstrap

public struct RoomDbAppBootstrapProvider {
    public static func create(): RoomDbAppBootstrap {
        return RoomDbAppBootstrap()
    }
}

public func createRoomDbAppBootstrap(): RoomDbAppBootstrap {
    return RoomDbAppBootstrapProvider.create()
}
