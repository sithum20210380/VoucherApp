//
//  voucherItem.swift
//  vouchers
//
//  Created by Sithum Raveesha on 2024-11-15.
//
import SwiftUI

class voucherItem: Identifiable {
    var title: String
    var value: Int
    var notes: String
    var backgroundColor: Color {
        switch value {
        case 1000: return .cyan
        case 2000: return .indigo
        case 2500: return .mint
        case 5000: return .teal
        case 10000: return .pink
        default: return .gray
        }
    }
    
    init(title: String, value: Int, notes: String) {
        self.title = title
        self.value = value
        self.notes = notes
    }
}
