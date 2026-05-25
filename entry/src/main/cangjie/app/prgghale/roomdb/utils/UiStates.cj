package ohos_app_cangjie_entry.app.prgghale.roomdb.utils

public open class UiStates<T> {}

public class UiNone<T> <: UiStates<T> {}

public class UiLoading<T> <: UiStates<T> {}

public class UiSuccess<T> <: UiStates<T> {
    public let data: T

    public init(data: T) {
        this.data = data
    }
}

public class UiError<T> <: UiStates<T> {
    public let message: String

    public init(message: String) {
        this.message = message
    }
}
