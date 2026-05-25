package ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading

import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading.observers.ProfessionObserver
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading.observers.UserObserver
import ohos_app_cangjie_entry.app.prgghale.roomdb.ui.loading.observers.UserProfessionObserver
import ohos_app_cangjie_entry.app.prgghale.roomdb.utils.ObservableLoadingCounter

public class LoadingViewModel {
    private var refreshCount: Int64 = 0
    private let userObserver: UserObserver
    private let professionObserver: ProfessionObserver
    private let userProfessionObserver: UserProfessionObserver
    private let loadingCounter: ObservableLoadingCounter

    public init() {
        userObserver = UserObserver()
        professionObserver = ProfessionObserver()
        userProfessionObserver = UserProfessionObserver()
        loadingCounter = ObservableLoadingCounter()
    }

    public func refresh(): LoadingViewState {
        loadingCounter.addLoader()
        refreshCount += 1
        let state = snapshot(loadingCounter.isLoading())
        loadingCounter.removeLoader()
        return state
    }

    public func snapshot(refreshing: Bool): LoadingViewState {
        return LoadingViewState(
            userObserver.count(),
            professionObserver.count(),
            userProfessionObserver.count(),
            refreshing
        )
    }

    public func refreshCountValue(): Int64 {
        return refreshCount
    }

    public func activeLoaders(): Int64 {
        return loadingCounter.value()
    }
}
