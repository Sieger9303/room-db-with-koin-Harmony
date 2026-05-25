package ohos_app_cangjie_entry.app.prgghale.roomdb.utils

public func handleTryCatch<T>(task: () -> UiStates<T>): UiStates<T> {
    try {
        return task()
    } catch (e: Exception) {
        return UiError<T>(e.toString())
    }
}

public func handleTryCatchBool(task: () -> Bool): UiStates<Bool> {
    try {
        return UiSuccess<Bool>(task())
    } catch (e: Exception) {
        return UiError<Bool>(e.toString())
    }
}
