@_private(sourceFile: "EmojiRatingView.swift") import _1_Bookworm
import SwiftUI
import SwiftUI

extension EmojiRatingView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/EmojiRatingView.swift", line: 32)
        AnyView(__designTimeSelection(EmojiRatingView(rating: __designTimeInteger("#6770.[2].[0].property.[0].[0].arg[0].value", fallback: 3)), "#6770.[2].[0].property.[0].[0]"))
#sourceLocation()
    }
}

extension EmojiRatingView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/EmojiRatingView.swift", line: 15)
        switch rating {
        case 1:
            return AnyView(__designTimeSelection(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].value", fallback: "😴")), "#6770.[1].[1].property.[0].[0].[0].[0]"))
        case 2:
            return AnyView(__designTimeSelection(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[1].[0].arg[0].value.[0].value", fallback: "☹️")), "#6770.[1].[1].property.[0].[0].[1].[0]"))
        case 3:
            return AnyView(__designTimeSelection(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[2].[0].arg[0].value.[0].value", fallback: "😐")), "#6770.[1].[1].property.[0].[0].[2].[0]"))
        case 4:
            return AnyView(__designTimeSelection(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[3].[0].arg[0].value.[0].value", fallback: "😄")), "#6770.[1].[1].property.[0].[0].[3].[0]"))
        default:
            return AnyView(__designTimeSelection(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[4].[0].arg[0].value.[0].value", fallback: "🤩")), "#6770.[1].[1].property.[0].[0].[4].[0]"))
        }
#sourceLocation()
    }
}

typealias EmojiRatingView = _1_Bookworm.EmojiRatingView
typealias EmojiRatingView_Previews = _1_Bookworm.EmojiRatingView_Previews