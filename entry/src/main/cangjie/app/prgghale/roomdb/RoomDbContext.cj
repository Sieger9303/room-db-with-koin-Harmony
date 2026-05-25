package ohos_app_cangjie_entry.app.prgghale.roomdb

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.domain.UserProfession
import std.collection.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.ProfessionTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.UserTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.utils.*

public class RoomDbContext {
    private static var route: String = "Add User"
    private static var bootstrapped: Bool = false
    private static var app: ?RoomDbAppBootstrap = None

    public static func bootstrap(): Unit {
        if (bootstrapped) {
            return
        }
        app = RoomDbAppBootstrap()
        bootstrapped = true
    }

    public static func navigate(label: String): Unit {
        route = label
    }

    public static func currentRoute(): String {
        return route
    }

    public static func professions(): ArrayList<ProfessionTable> {
        match (app) {
            case Some(bootstrap) =>
                return bootstrap.userRepository.getProfessions()
            case None =>
                return ArrayList<ProfessionTable>()
        }
    }

    public static func defaultProfessionId(): String {
        let professionList = professions()
        if (professionList.size > 0) {
            return professionList[0].professionId
        }
        return ""
    }

    public static func defaultProfessionName(): String {
        let professionList = professions()
        if (professionList.size > 0) {
            return professionList[0].professionName
        }
        return ""
    }

    public static func addUser(firstName: String, lastName: String, address: String, professionId: String): Bool {
        match (app) {
            case Some(bootstrap) =>
                match (bootstrap.userRepository.addUser(firstName, lastName, address, professionId)) {
                    case _ =>
                        return true
                }
            case None =>
                return false
        }
    }

    public static func userProfession(): ArrayList<UserProfession> {
        match (app) {
            case Some(bootstrap) =>
                match (bootstrap.userRepository.getUserProfession()) {
                    case success: UiSuccess<ArrayList<UserProfession>> =>
                        return success.data
                    case _ =>
                        return ArrayList<UserProfession>()
                }
            case None =>
                return ArrayList<UserProfession>()
        }
    }

    public static func deleteUser(userId: String): Bool {
        match (app) {
            case Some(bootstrap) =>
                match (bootstrap.userRepository.deleteUser(userId)) {
                    case success: UiSuccess<Bool> =>
                        return success.data
                    case _ =>
                        return false
                }
            case None =>
                return false
        }
    }

    public static func updateFavorite(userId: String, isFavorite: Bool): Bool {
        match (app) {
            case Some(bootstrap) =>
                match (bootstrap.userRepository.updateFavorite(userId, isFavorite)) {
                    case success: UiSuccess<Bool> =>
                        return success.data
                    case _ =>
                        return false
                }
            case None =>
                return false
        }
    }

    public static func favoriteUsers(): ArrayList<UserTable> {
        match (app) {
            case Some(bootstrap) =>
                return bootstrap.userRepository.getFavoriteUsers()
            case None =>
                return ArrayList<UserTable>()
        }
    }

    public static func userProfessionCount(): Int64 {
        return userProfession().size
    }

    public static func userTitleAt(index: Int64): String {
        let users = userProfession()
        if (index >= 0 && index < users.size) {
            return users[index].user.displayName()
        }
        return ""
    }

    public static func userProfessionNameAt(index: Int64): String {
        let users = userProfession()
        if (index >= 0 && index < users.size) {
            return users[index].profession.professionName
        }
        return ""
    }

    public static func userAddressAt(index: Int64): String {
        let users = userProfession()
        if (index >= 0 && index < users.size) {
            return users[index].user.address
        }
        return ""
    }

    public static func userFavoriteLabelAt(index: Int64): String {
        let users = userProfession()
        if (index >= 0 && index < users.size) {
            return if (users[index].user.isFavorite) { "Favorite" } else { "Not favorite" }
        }
        return ""
    }

    public static func userInitialsAt(index: Int64): String {
        let users = userProfession()
        if (index >= 0 && index < users.size) {
            return initialsFor(users[index].user.firstName, users[index].user.lastName)
        }
        return ""
    }

    public static func userIdAt(index: Int64): String {
        let users = userProfession()
        if (index >= 0 && index < users.size) {
            return users[index].user.id
        }
        return ""
    }

    public static func userIsFavoriteAt(index: Int64): Bool {
        let users = userProfession()
        if (index >= 0 && index < users.size) {
            return users[index].user.isFavorite
        }
        return false
    }

    public static func toggleFavoriteAt(index: Int64): Bool {
        let users = userProfession()
        if (index >= 0 && index < users.size) {
            let user = users[index].user
            return updateFavorite(user.id, !user.isFavorite)
        }
        return false
    }

    public static func deleteUserAt(index: Int64): Bool {
        let users = userProfession()
        if (index >= 0 && index < users.size) {
            return deleteUser(users[index].user.id)
        }
        return false
    }

    public static func favoriteUserCount(): Int64 {
        return favoriteUsers().size
    }

    public static func favoriteUserIdAt(index: Int64): String {
        let users = favoriteUsers()
        if (index >= 0 && index < users.size) {
            return users[index].id
        }
        return ""
    }

    public static func unfavoriteAt(index: Int64): Bool {
        let userId = favoriteUserIdAt(index)
        if (userId != "") {
            return updateFavorite(userId, false)
        }
        return false
    }

    public static func favoriteUserTitleAt(index: Int64): String {
        let users = favoriteUsers()
        if (index >= 0 && index < users.size) {
            return users[index].displayName()
        }
        return ""
    }

    public static func favoriteUserAddressAt(index: Int64): String {
        let users = favoriteUsers()
        if (index >= 0 && index < users.size) {
            return users[index].address
        }
        return ""
    }

    public static func favoriteUserProfessionAt(index: Int64): String {
        let users = favoriteUsers()
        if (index >= 0 && index < users.size) {
            return users[index].profession
        }
        return ""
    }

    public static func favoriteUserInitialsAt(index: Int64): String {
        let users = favoriteUsers()
        if (index >= 0 && index < users.size) {
            return initialsFor(users[index].firstName, users[index].lastName)
        }
        return ""
    }

    public static func searchCount(query: String): Int64 {
        let users = userProfession()
        if (query == "") {
            return users.size
        }

        var count: Int64 = 0
        for (item in users) {
            if (item.user.firstName.contains(query)) {
                count += 1
            }
        }
        return count
    }

    public static func searchTitleAt(query: String, targetIndex: Int64): String {
        let users = userProfession()
        var index: Int64 = 0
        for (item in users) {
            if (query == "" || item.user.firstName.contains(query)) {
                if (index == targetIndex) {
                    return item.user.displayName()
                }
                index += 1
            }
        }
        return ""
    }

    public static func searchProfessionAt(query: String, targetIndex: Int64): String {
        let users = userProfession()
        var index: Int64 = 0
        for (item in users) {
            if (query == "" || item.user.firstName.contains(query)) {
                if (index == targetIndex) {
                    return item.profession.professionName
                }
                index += 1
            }
        }
        return ""
    }

    public static func searchAddressAt(query: String, targetIndex: Int64): String {
        let users = userProfession()
        var index: Int64 = 0
        for (item in users) {
            if (query == "" || item.user.firstName.contains(query)) {
                if (index == targetIndex) {
                    return item.user.address
                }
                index += 1
            }
        }
        return ""
    }

    public static func searchFavoriteLabelAt(query: String, targetIndex: Int64): String {
        let users = userProfession()
        var index: Int64 = 0
        for (item in users) {
            if (query == "" || item.user.firstName.contains(query)) {
                if (index == targetIndex) {
                    return if (item.user.isFavorite) { "Favorite" } else { "Not favorite" }
                }
                index += 1
            }
        }
        return ""
    }

    public static func searchInitialsAt(query: String, targetIndex: Int64): String {
        let users = userProfession()
        var index: Int64 = 0
        for (item in users) {
            if (query == "" || item.user.firstName.contains(query)) {
                if (index == targetIndex) {
                    return initialsFor(item.user.firstName, item.user.lastName)
                }
                index += 1
            }
        }
        return ""
    }

    private static func initialForName(name: String): String {
        if (name.size <= 0) {
            return "?"
        }

        let ch = name[0]

        if (ch == 65 || ch == 97) { return "A" }
        if (ch == 66 || ch == 98) { return "B" }
        if (ch == 67 || ch == 99) { return "C" }
        if (ch == 68 || ch == 100) { return "D" }
        if (ch == 69 || ch == 101) { return "E" }
        if (ch == 70 || ch == 102) { return "F" }
        if (ch == 71 || ch == 103) { return "G" }
        if (ch == 72 || ch == 104) { return "H" }
        if (ch == 73 || ch == 105) { return "I" }
        if (ch == 74 || ch == 106) { return "J" }
        if (ch == 75 || ch == 107) { return "K" }
        if (ch == 76 || ch == 108) { return "L" }
        if (ch == 77 || ch == 109) { return "M" }
        if (ch == 78 || ch == 110) { return "N" }
        if (ch == 79 || ch == 111) { return "O" }
        if (ch == 80 || ch == 112) { return "P" }
        if (ch == 81 || ch == 113) { return "Q" }
        if (ch == 82 || ch == 114) { return "R" }
        if (ch == 83 || ch == 115) { return "S" }
        if (ch == 84 || ch == 116) { return "T" }
        if (ch == 85 || ch == 117) { return "U" }
        if (ch == 86 || ch == 118) { return "V" }
        if (ch == 87 || ch == 119) { return "W" }
        if (ch == 88 || ch == 120) { return "X" }
        if (ch == 89 || ch == 121) { return "Y" }
        if (ch == 90 || ch == 122) { return "Z" }

        return "?"
    }

    private static func initialsFor(firstName: String, lastName: String): String {
        return "${initialForName(firstName)}${initialForName(lastName)}"
    }
}
