package ohos_app_cangjie_entry.app.prgghale.roomdb.data.table

public class UserTable {
    public let id: String
    public let firstName: String
    public let lastName: String
    public let address: String
    public let profession: String
    public var isFavorite: Bool

    public init(id: String, firstName: String, lastName: String, address: String, profession: String, isFavorite: Bool) {
        this.id = id
        this.firstName = firstName
        this.lastName = lastName
        this.address = address
        this.profession = profession
        this.isFavorite = isFavorite
    }

    public func displayName(): String {
        return "${firstName} ${lastName}"
    }
}
