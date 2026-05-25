package ohos_app_cangjie_entry.app.prgghale.roomdb.theme

public let TitleFontSize: Int64 = 22
public let BodyFontSize: Int64 = 16
public let CaptionFontSize: Int64 = 12
public let ButtonFontSize: Int64 = 14

public struct TypographyTokens {
    public let title: Int64
    public let body: Int64
    public let caption: Int64
    public let button: Int64

    public init(title: Int64, body: Int64, caption: Int64, button: Int64) {
        this.title = title
        this.body = body
        this.caption = caption
        this.button = button
    }
}

public let Typography: TypographyTokens = TypographyTokens(TitleFontSize, BodyFontSize, CaptionFontSize, ButtonFontSize)
