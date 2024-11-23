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
                Section{
                    TextField("Title", text: $title)
                    TextField("Notes", text: $notes)
                }
                Section {
                    Picker("Amount", selection: $amount) {
                        ForEach(voucherValues, id: \.self) { value in
                            Text("\(value)")
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("Add Item")
//                        .bold()
//                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button() {
                        if title.isEmpty {
                            showAlert = true
                        }else {
                            saveAction(title, amount, notes)
                            dismiss()
                        }
                    }label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .topBarLeading){
                    Button(){
                        dismiss()
                    }label: {
                        Text("Cancel")
                    }
                    .tint(.red)
                }
            }
            .navigationTitle("Add Item")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddItemPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemPageView(saveAction: { _,_,_ in })
    }
}
