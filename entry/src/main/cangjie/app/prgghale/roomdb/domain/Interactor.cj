package ohos_app_cangjie_entry.app.prgghale.roomdb.domain

public class SubjectInteractor<P, T> {
    private let worker: (P) -> T
    private var lastParams: ?P = None
    private var lastValue: ?T = None

    public init(worker: (P) -> T) {
        this.worker = worker
    }

    public func invoke(params: P): T {
        lastParams = params
        let value = worker(params)
        lastValue = value
        return value
    }

    public func latest(): ?T {
        return lastValue
    }

    public func latestParams(): ?P {
        return lastParams
    }
}
