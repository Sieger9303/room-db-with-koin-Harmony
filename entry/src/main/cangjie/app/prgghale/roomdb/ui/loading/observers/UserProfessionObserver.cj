package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading.observers

import ohos_app_cangjie_entry.app.prgghale.roomdb.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.utils.UiStates
import ohos_app_cangjie_entry.app.prgghale.roomdb.utils.UiSuccess
import std.collection.*

public class UserProfessionObserverParams {
    public let action: String

    public init(action: String) {
        this.action = action
    }
}

public class UserProfessionObserver {
    public init() {}

    public func observe(): UiStates<ArrayList<String>> {
        return observeWith(UserProfessionObserverParams(ActionFetch))
    }

    public func observeWith(params: UserProfessionObserverParams): UiStates<ArrayList<String>> {
        let items = ArrayList<String>()
        if (params.action == ActionFetch) {
            let total = RoomDbContext.userProfessionCount()
            for (index in 0..total) {
                if (index < total) {
                    items.add("${RoomDbContext.userTitleAt(index)} - ${RoomDbContext.userProfessionNameAt(index)}")
                }
            }
        }
        return UiSuccess<ArrayList<String>>(items)
    }

    public func count(): Int64 {
        match (observe()) {
            case success: UiSuccess<ArrayList<String>> =>
                return success.data.size
            case _ =>
                return 0
        }
    }
}
