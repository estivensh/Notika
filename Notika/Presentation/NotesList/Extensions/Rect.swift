//
//  Rect.swift
//  Notika
//
//  Created by Estiven Sanchez Herrera on 24/03/25.
//

import SwiftUI

extension View {
    func getRect() -> CGRect {
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    func isMacOS() -> Bool {
        #if os(iOS)
        return false
#endif
        return true
    }
}
