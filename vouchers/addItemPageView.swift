//
//  addItemPageView.swift
//  vouchers
//
//  Created by Sithum Raveesha on 2024-11-15.
//

import SwiftUI

struct AddItemPageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var notes = ""
    @State private var amount: Int = 1000
    @State private var showAlert = false
    
    let voucherValues = [1000,2000,2500,5000,10000]
    
    var saveAction: (String, Int, String) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Voucher Details")) {
                    TextField("Title", text: $title)
                    TextField("Notes", text: $notes)
                    HStack {
                        Text("Amount")
                        Spacer()
                        Picker("", selection: $amount) {
                            ForEach(voucherValues, id: \.self) { value in
                                Text("\(value)")
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("All fields are required"), dismissButton: .default(Text("OK")))
                }
            }
            .navigationTitle("Add New Voucher")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if title.isEmpty || notes.isEmpty || amount == 0 {
                            showAlert = true
                        } else {
//                            let newVoucher = voucherItem(title: title, value: amount, notes: notes)
//                            saveAction(newVoucher)
                            saveAction(title,amount,notes)
                            presentationMode.wrappedValue.dismiss()
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.red)
                }
            }
        }
    }
}

