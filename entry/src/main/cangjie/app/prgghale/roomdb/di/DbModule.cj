package ohos_app_cangjie_entry.app.prgghale.roomdb.di

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.database.AppDatabase

public struct DatabaseFactory {
    public static func create(): AppDatabase {
        return AppDatabase()
    }
}
