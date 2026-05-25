package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading

public class LoadingViewState {
    public let userCount: Int64
    public let professionCount: Int64
    public let userProfessionCount: Int64
    public let refreshing: Bool

    public init(userCount: Int64, professionCount: Int64, userProfessionCount: Int64, refreshing: Bool) {
        this.userCount = userCount
        this.professionCount = professionCount
        this.userProfessionCount = userProfessionCount
        this.refreshing = refreshing
    }

    public func isLoading(): Bool {
        return refreshing
    }
}
