package ohos_app_cangjie_entry.app.prgghale.roomdb

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.database.AppDatabase
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.repository.UserRepository
import ohos_app_cangjie_entry.app.prgghale.roomdb.di.AppServicesFactory
import ohos_app_cangjie_entry.app.prgghale.roomdb.di.DatabaseFactory
import ohos_app_cangjie_entry.app.prgghale.roomdb.di.RepositoryFactory

public class RoomDbAppBootstrap {
    public let database: AppDatabase
    public let userRepository: UserRepository
    public let mainScope: String
    public let backgroundScope: String

    public init() {
        this.mainScope = AppServicesFactory.mainScopeLabel()
        this.backgroundScope = AppServicesFactory.backgroundScopeLabel()
        this.database = DatabaseFactory.create()
        this.userRepository = RepositoryFactory.createUserRepository(database)
    }
}
