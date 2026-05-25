package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading

public open class InvokeStatus {}

public class InvokeStarted <: InvokeStatus {}

public class InvokeSuccess <: InvokeStatus {}

public class InvokeError <: InvokeStatus {
    public let throwable: String

    public init(throwable: String) {
        this.throwable = throwable
    }
}
