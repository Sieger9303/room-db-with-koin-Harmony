package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.search

import ohos_app_cangjie_entry.app.prgghale.roomdb.RoomDbContext

public class SearchViewModel {
    public init() {}

    public func searchCount(query: String): Int64 {
        return RoomDbContext.searchCount(query)
    }

    public func searchHint(query: String): String {
        return if (query == "") { "Showing all saved users" } else { "Query: ${query}" }
    }
}

public class SearchUser {
    public init() {}

    public func count(query: String): Int64 {
        return RoomDbContext.searchCount(query)
    }
}
