package ohos_app_cangjie_entry.app.prgghale.roomdb.data.dao

public interface BaseStore<T> {
    func insert(value: T): Unit
    func update(value: T): Unit
    func delete(value: T): Unit
}
