package ohos_app_cangjie_entry.app.prgghale.roomdb.data.dao

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.domain.UserProfession
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.UserTable
import std.collection.*

public interface UsersStore <: BaseStore<UserTable> {
    func getUsers(): ArrayList<UserTable>
    func deleteAll(): Unit
    func getUserProfession(): ArrayList<UserProfession>
    func getFavoriteUsers(): ArrayList<UserTable>
    func search(filter: String): ArrayList<UserProfession>
    func paginatedUsers(count: Int64, offset: Int64): ArrayList<UserTable>
}
