package ohos_app_cangjie_entry.app.prgghale.roomdb.data.domain

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.ProfessionTable
import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.UserTable

public class UserProfession {
    public let user: UserTable
    public let profession: ProfessionTable

    public init(user: UserTable, profession: ProfessionTable) {
        this.user = user
        this.profession = profession
    }
}
