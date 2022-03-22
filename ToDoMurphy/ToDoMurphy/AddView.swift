//
//  AddView.swift
//  ToDoListMurphy
//
//  Created by Thomas Murphy on 3/20/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertT: String = ""
    @State var alertS: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 40)
                    .background(Color.green)
                .cornerRadius(11)
            }
            Button(action : saveButtonPressed, label: { Text("Save".uppercased())
                .foregroundColor(.white)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(5)
                })
            .padding(10)
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $alertS, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textReal() {
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
        }
}
    func textReal() -> Bool {
        if textFieldText.count < 3 {
            alertT = "Please type in somthing longer"
            alertS.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertT))
    }

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddView()
    }
        .environmentObject((ListViewModel()))
    }
}
}
