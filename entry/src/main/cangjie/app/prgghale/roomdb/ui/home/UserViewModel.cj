package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.home

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.repository.UserRepository
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.ProfessionTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.utils.*
import std.collection.*

public class UserViewModel {
    private let repository: UserRepository
    public var professions: ArrayList<ProfessionTable> = ArrayList<ProfessionTable>()

    public init(repository: UserRepository) {
        this.repository = repository
        this.professions = repository.getProfessions()
    }

    public func addUser(firstName: String, lastName: String, address: String, professionId: String): UiStates<Bool> {
        return repository.addUser(firstName, lastName, address, professionId)
    }
}
