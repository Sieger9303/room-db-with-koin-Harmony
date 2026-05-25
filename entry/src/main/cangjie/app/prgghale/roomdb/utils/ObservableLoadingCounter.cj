package ohos_app_cangjie_entry.app.prgghale.roomdb.utils

public class ObservableLoadingCounter {
    private var count: Int64 = 0

    public init() {}

    public func addLoader(): Unit {
        count += 1
    }

    public func removeLoader(): Unit {
        if (count > 0) {
            count -= 1
        }
    }

    public func isLoading(): Bool {
        return count > 0
    }

    public func value(): Int64 {
        return count
    }
}
