package ohos_app_cangjie_entry.app.prgghale.roomdb.data.repository

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.database.AppDatabase
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.ProfessionTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.UserTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.utils.*
import std.collection.*

public interface UserRepository {
    func addUser(firstName: String, lastName: String, address: String, professionId: String): UiStates<Bool>
    func getUsers(): UiStates<ArrayList<UserTable>>
    func getProfessions(): ArrayList<ProfessionTable>
}

public class UserRepoImpl <: UserRepository {
    private let database: AppDatabase

    public init(database: AppDatabase) {
        this.database = database
    }

    public func addUser(firstName: String, lastName: String, address: String, professionId: String): UiStates<Bool> {
        database.addUser(firstName, lastName, address, professionId)
        return UiSuccess<Bool>(true)
    }

    public func getUsers(): UiStates<ArrayList<UserTable>> {
        return UiSuccess<ArrayList<UserTable>>(database.getUsers())
    }

    public func getProfessions(): ArrayList<ProfessionTable> {
        return database.getProfessions()
    }
}
