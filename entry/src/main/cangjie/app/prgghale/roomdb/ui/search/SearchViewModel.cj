package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.search

import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext
import ohos_app_cangjie_entry.app.prgghale.roomdb.domain.SubjectInteractor

public class SearchViewModel {
    private let searchUser: SearchUser

    public func searchCount(query: String): Int64 {
        return searchUser.count(query)
    }

    public func searchHint(query: String): String {
        return if (query == "") { "Showing all saved users" } else { "Query: ${query}" }
    }

    public init(searchUser: SearchUser) {
        this.searchUser = searchUser
    }

    public init() {
        this.searchUser = SearchUser()
    }
}

public class SearchUser {
    private let interactor: SubjectInteractor<String, Int64>

    public func count(query: String): Int64 {
        return interactor.invoke(query)
    }

    public init() {
        this.interactor = SubjectInteractor<String, Int64>({ value: String =>
            RoomDbContext.searchCount(value)
        })
    }
}
