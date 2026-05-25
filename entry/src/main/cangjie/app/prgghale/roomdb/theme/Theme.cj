package ohos_app_cangjie_entry.app.prgghale.roomdb.theme

public struct ThemePalette {
    public let primary: Int64
    public let onPrimary: Int64
    public let background: Int64
    public let onBackground: Int64
    public let surface: Int64
    public let outline: Int64

    public init(primary: Int64, onPrimary: Int64, background: Int64, onBackground: Int64, surface: Int64, outline: Int64) {
        this.primary = primary
        this.onPrimary = onPrimary
        this.background = background
        this.onBackground = onBackground
        this.surface = surface
        this.outline = outline
    }
}

public let LightPalette: ThemePalette = ThemePalette(Blue40, Grey99, Grey99, Grey10, Grey99, BlueGrey50)
public let DarkPalette: ThemePalette = ThemePalette(Blue80, Blue20, Grey10, Grey90, Grey10, BlueGrey60)

public func roomDbThemeName(): String {
    return "RoomDbTheme"
}

public func roomDbPalette(darkTheme: Bool): ThemePalette {
    if (darkTheme) {
        return DarkPalette
    }
    return LightPalette
}
