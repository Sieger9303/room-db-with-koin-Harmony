package ohos_app_cangjie_entry.app.prgghale.roomdb.data.database

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.domain.UserProfession
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.ProfessionTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.UserTable
import std.collection.*

public class AppDatabase {
    private var professions: ArrayList<ProfessionTable> = ArrayList<ProfessionTable>()
    private var users: ArrayList<UserTable> = ArrayList<UserTable>()
    private var nextUserId: Int64 = 1

    public init() {
        seedProfessions()
    }

    public func seedProfessions(): Unit {
        if (professions.size != 0) {
            return
        }

        professions.add(ProfessionTable("profession-1", "Ui/Ux Designer"))
        professions.add(ProfessionTable("profession-2", "Android Developer"))
        professions.add(ProfessionTable("profession-3", "Node Developer"))
        professions.add(ProfessionTable("profession-4", "React Developer"))
        professions.add(ProfessionTable("profession-5", "Laravel Developer"))
        professions.add(ProfessionTable("profession-6", "Django Developer"))
        professions.add(ProfessionTable("profession-7", "QA Engineer"))
    }

    public func getUsers(): ArrayList<UserTable> {
        return users
    }

    public func getProfessions(): ArrayList<ProfessionTable> {
        return professions
    }

    public func addUser(firstName: String, lastName: String, address: String, professionId: String): UserTable {
        let user = UserTable("user-${nextUserId}", firstName, lastName, address, professionId, false)
        nextUserId += 1
        users.add(user)
        return user
    }

    public func getUserProfession(): ArrayList<UserProfession> {
        var joined = ArrayList<UserProfession>()
        for (user in users) {
            for (profession in professions) {
                if (user.profession == profession.professionId) {
                    joined.add(UserProfession(user, profession))
                }
            }
        }
        return joined
    }

    public func deleteUser(userId: String): Bool {
        var index: Int64 = 0
        while (index < users.size) {
            if (users[index].id == userId) {
                users.remove(index .. index)
                return true
            }
            index += 1
        }
        return false
    }

    public func updateFavorite(userId: String, isFavorite: Bool): Bool {
        var index: Int64 = 0
        while (index < users.size) {
            if (users[index].id == userId) {
                users[index].isFavorite = isFavorite
                return true
            }
            index += 1
        }
        return false
    }

    public func getFavoriteUsers(): ArrayList<UserTable> {
        var favorites = ArrayList<UserTable>()
        for (user in users) {
            if (user.isFavorite) {
                favorites.add(user)
            }
        }
        return favorites
    }
}
