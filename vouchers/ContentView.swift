//
//  ContentView.swift
//  vouchers
//
//  Created by Sithum Raveesha on 2024-11-14.
//

import SwiftUI

struct ContentView: View {
    @State var vouchers: [voucherItem] = []
    @State var showVouchers: Bool = false
    @State var showingAddItems = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if vouchers.isEmpty {
                    ContentUnavailableView()
                }else {
                    List(vouchers) { voucher in
                        voucherCard(voucher: voucher, showVouchers: $showVouchers)
                    }
                    .listStyle(PlainListStyle())
                    .listRowSeparator(.hidden)
                }
                //Spacer()
            }
            .toolbar{
                Toggle("", isOn: $showVouchers)
                    .toggleStyle(SwitchToggleStyle())
            }
            .navigationTitle("Vouchers")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button() {
                        showingAddItems = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(.largeTitle))
                            .padding()
                    }
                    .padding(.leading, 280)
                }
            }
            .sheet(isPresented: $showingAddItems) {
                AddItemPageView (saveAction: { title,amount, notes in
                    let newVoucher = voucherItem(title: title, value: amount, notes: notes)
                    vouchers.append(newVoucher)
                })
            }
            .padding()
        }
    }
}

struct ContentUnavailableView: View {
    var body: some View {
        Image(systemName: "square.and.arrow.down")
            .font(.system(.largeTitle))
            .foregroundStyle(.secondary)
        Text("No Vouchers Found")
            .font(.headline)
        Text("Add you first voucher today!")
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    ContentView()
}
