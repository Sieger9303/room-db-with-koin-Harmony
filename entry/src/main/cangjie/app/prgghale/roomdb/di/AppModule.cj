package ohos_app_cangjie_entry.app.prgghale.roomdb.di

public struct AppServicesFactory {
    public static func mainScopeLabel(): String {
        return "roomdb-main-scope"
    }

    public static func backgroundScopeLabel(): String {
        return "roomdb-background-scope"
    }
}
