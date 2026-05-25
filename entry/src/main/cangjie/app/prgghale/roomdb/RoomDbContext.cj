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
}
