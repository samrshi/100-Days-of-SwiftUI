@_private(sourceFile: "EmojiRatingView.swift") import _1_Bookworm
import SwiftUI
import SwiftUI

extension EmojiRatingView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/EmojiRatingView.swift", line: 32)
        AnyView(EmojiRatingView(rating: __designTimeInteger("#6770.[2].[0].property.[0].[0].arg[0].value", fallback: 3)))
#sourceLocation()
    }
}

extension EmojiRatingView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/EmojiRatingView.swift", line: 15)
        switch rating {
        case 1:
            return AnyView(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].value", fallback: "😴")))
        case 2:
            return AnyView(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[1].[0].arg[0].value.[0].value", fallback: "☹️")))
        case 3:
            return AnyView(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[2].[0].arg[0].value.[0].value", fallback: "😐")))
        case 4:
            return AnyView(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[3].[0].arg[0].value.[0].value", fallback: "😄")))
        default:
            return AnyView(Text(__designTimeString("#6770.[1].[1].property.[0].[0].[4].[0].arg[0].value.[0].value", fallback: "🤩")))
        }
#sourceLocation()
    }
}

typealias EmojiRatingView = _1_Bookworm.EmojiRatingView
typealias EmojiRatingView_Previews = _1_Bookworm.EmojiRatingView_Previews