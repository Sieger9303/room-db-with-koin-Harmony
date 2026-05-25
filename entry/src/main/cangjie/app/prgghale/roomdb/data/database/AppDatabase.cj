package ohos_app_cangjie_entry.app.prgghale.roomdb.data.database

import kit.AbilityKit.UIAbilityContext
import kit.ArkData.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.domain.UserProfession
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.ProfessionTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.UserTable
import std.collection.*

public class AppDatabase {
    private static var storageContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None

    private var professions: ArrayList<ProfessionTable> = ArrayList<ProfessionTable>()
    private var users: ArrayList<UserTable> = ArrayList<UserTable>()
    private var nextUserId: Int64 = 1
    private var loadedUsers: Bool = false

    public static func configureContext(context: UIAbilityContext): Unit {
        AppDatabase.storageContext = Option<UIAbilityContext>.Some(context)
    }

    public init() {
        seedProfessions()
        loadUsers()
    }

    private func getStore(): Option<Preferences> {
        match (AppDatabase.storageContext) {
            case Some(context) => Option<Preferences>.Some(Preferences.getPreferences(context, PreferencesOptions("room_db_store")))
            case None => Option<Preferences>.None
        }
    }

    private func ensureUsersLoaded(): Unit {
        if (!loadedUsers) {
            loadUsers()
        }
    }

    private func loadUsers(): Unit {
        match (this.getStore()) {
            case Some(store) =>
                var ids: Array<String> = []
                var firstNames: Array<String> = []
                var lastNames: Array<String> = []
                var addresses: Array<String> = []
                var professionIds: Array<String> = []
                var favorites: Array<String> = []

                match (store.get("user_ids", PreferencesValueType.StringArray([]))) {
                    case PreferencesValueType.StringArray(values) => ids = values
                    case _ => ()
                }
                match (store.get("user_first_names", PreferencesValueType.StringArray([]))) {
                    case PreferencesValueType.StringArray(values) => firstNames = values
                    case _ => ()
                }
                match (store.get("user_last_names", PreferencesValueType.StringArray([]))) {
                    case PreferencesValueType.StringArray(values) => lastNames = values
                    case _ => ()
                }
                match (store.get("user_addresses", PreferencesValueType.StringArray([]))) {
                    case PreferencesValueType.StringArray(values) => addresses = values
                    case _ => ()
                }
                match (store.get("user_profession_ids", PreferencesValueType.StringArray([]))) {
                    case PreferencesValueType.StringArray(values) => professionIds = values
                    case _ => ()
                }
                match (store.get("user_favorites", PreferencesValueType.StringArray([]))) {
                    case PreferencesValueType.StringArray(values) => favorites = values
                    case _ => ()
                }

                users = ArrayList<UserTable>()
                let count = min(min(min(ids.size, firstNames.size), min(lastNames.size, addresses.size)), min(professionIds.size, favorites.size))
                for (index in 0..count) {
                    users.add(UserTable(ids[index], firstNames[index], lastNames[index], addresses[index], professionIds[index], favorites[index] == "true"))
                }
                nextUserId = users.size + 1
                loadedUsers = true
            case None =>
                loadedUsers = false
        }
    }

    private func saveUsers(): Unit {
        match (this.getStore()) {
            case Some(store) =>
                let ids = ArrayList<String>()
                let firstNames = ArrayList<String>()
                let lastNames = ArrayList<String>()
                let addresses = ArrayList<String>()
                let professionIds = ArrayList<String>()
                let favorites = ArrayList<String>()

                for (index in 0..users.size) {
                    ids.add(users[index].id)
                    firstNames.add(users[index].firstName)
                    lastNames.add(users[index].lastName)
                    addresses.add(users[index].address)
                    professionIds.add(users[index].profession)
                    favorites.add(if (users[index].isFavorite) { "true" } else { "false" })
                }

                store.put("user_ids", PreferencesValueType.StringArray(ids.toArray()))
                store.put("user_first_names", PreferencesValueType.StringArray(firstNames.toArray()))
                store.put("user_last_names", PreferencesValueType.StringArray(lastNames.toArray()))
                store.put("user_addresses", PreferencesValueType.StringArray(addresses.toArray()))
                store.put("user_profession_ids", PreferencesValueType.StringArray(professionIds.toArray()))
                store.put("user_favorites", PreferencesValueType.StringArray(favorites.toArray()))
                store.flush()
            case None => ()
        }
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
        ensureUsersLoaded()
        return users
    }

    public func getProfessions(): ArrayList<ProfessionTable> {
        return professions
    }

    public func addUser(firstName: String, lastName: String, address: String, professionId: String): UserTable {
        ensureUsersLoaded()
        let user = UserTable("user-${nextUserId}", firstName, lastName, address, professionId, false)
        nextUserId += 1
        users.add(user)
        saveUsers()
        return user
    }

    public func getUserProfession(): ArrayList<UserProfession> {
        ensureUsersLoaded()
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
        ensureUsersLoaded()
        let kept = ArrayList<UserTable>()
        var removed: Bool = false

        for (user in users) {
            if (user.id == userId) {
                removed = true
            } else {
                kept.add(user)
            }
        }

        if (removed) {
            users = kept
            saveUsers()
            return true
        }

        return false
    }

    public func updateFavorite(userId: String, isFavorite: Bool): Bool {
        ensureUsersLoaded()
        var index: Int64 = 0
        while (index < users.size) {
            if (users[index].id == userId) {
                users[index].isFavorite = isFavorite
                saveUsers()
                return true
            }
            index += 1
        }
        return false
    }

    public func getFavoriteUsers(): ArrayList<UserTable> {
        ensureUsersLoaded()
        var favorites = ArrayList<UserTable>()
        for (user in users) {
            if (user.isFavorite) {
                favorites.add(user)
            }
        }
        return favorites
    }
}
