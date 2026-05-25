package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading

public func combine3<T1, T2, T3, R>(first: T1, second: T2, third: T3, transform: (T1, T2, T3) -> R): R {
    return transform(first, second, third)
}
