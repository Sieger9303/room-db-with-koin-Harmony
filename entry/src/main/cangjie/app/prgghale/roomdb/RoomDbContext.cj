package ohos_app_cangjie_entry.app.prgghale.roomdb

import std.collection.*
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.ProfessionTable

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
}
