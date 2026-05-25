package ohos_app_cangjie_entry.app.prgghale.roomdb.data.dao

import ohos_app_cangjie_entry.app.prgghale.roomdb.data.table.ProfessionTable
import std.collection.*

public interface ProfessionStore <: BaseStore<ProfessionTable> {
    func getAllProfessions(): ArrayList<ProfessionTable>
}
