package ohos_app_cangjie_entry.app.prgghale.roomdb

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.database.AppDatabase
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.repository.UserRepository
import ohos_app_cangjie_entry.app.prgghale.roomdb.di.DatabaseFactory
import ohos_app_cangjie_entry.app.prgghale.roomdb.di.RepositoryFactory

public class RoomDbAppBootstrap {
    public let database: AppDatabase
    public let userRepository: UserRepository

    public init() {
        this.database = DatabaseFactory.create()
        this.userRepository = RepositoryFactory.createUserRepository(database)
    }
}
