//
//  voucherCard.swift
//  vouchers
//
//  Created by Sithum Raveesha on 2024-11-15.
//

import SwiftUI

struct voucherCard: View {
    let voucher: voucherItem
    @Binding var showVouchers: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(voucher.title)
                    .font(.headline)
                Spacer()
                Text("\(voucher.value)")
                    .font(.title)
            }
            Text(voucher.notes)
                .font(.caption)
        }
        .padding()
        .background(voucher.backgroundColor.opacity(showVouchers ? 1.0 : 0.3))
        .foregroundColor(showVouchers ? .white : .black)
        .cornerRadius(8)
    }
}
