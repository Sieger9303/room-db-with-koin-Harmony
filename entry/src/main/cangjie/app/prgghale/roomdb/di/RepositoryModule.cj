package ohos_app_cangjie_entry.app.prgghale.roomdb.di

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.database.AppDatabase
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.repository.UserRepoImpl
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.repository.UserRepository

public struct RepositoryFactory {
    public static func createUserRepository(database: AppDatabase): UserRepository {
        return UserRepoImpl(database)
    }
}
