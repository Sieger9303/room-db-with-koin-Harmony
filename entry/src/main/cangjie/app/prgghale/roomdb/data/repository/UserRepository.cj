package ohos_app_cangjie_entry.app.prgghale.roomdb.data.repository

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.database.AppDatabase
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.domain.UserProfession
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.ProfessionTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.UserTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.utils.*
import std.collection.*

public interface UserRepository {
    func addUser(firstName: String, lastName: String, address: String, professionId: String): UiStates<Bool>
    func getUsers(): UiStates<ArrayList<UserTable>>
    func getProfessions(): ArrayList<ProfessionTable>
    func getUserProfession(): UiStates<ArrayList<UserProfession>>
    func deleteUser(userId: String): UiStates<Bool>
    func updateFavorite(userId: String, isFavorite: Bool): UiStates<Bool>
    func getFavoriteUsers(): ArrayList<UserTable>
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

    public func getUserProfession(): UiStates<ArrayList<UserProfession>> {
        return UiSuccess<ArrayList<UserProfession>>(database.getUserProfession())
    }

    public func deleteUser(userId: String): UiStates<Bool> {
        return UiSuccess<Bool>(database.deleteUser(userId))
    }

    public func updateFavorite(userId: String, isFavorite: Bool): UiStates<Bool> {
        return UiSuccess<Bool>(database.updateFavorite(userId, isFavorite))
    }

    public func getFavoriteUsers(): ArrayList<UserTable> {
        return database.getFavoriteUsers()
    }
}
