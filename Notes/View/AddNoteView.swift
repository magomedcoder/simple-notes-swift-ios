//
//  AddNoteView.swift
//  Notes
//
//  Created by Magomedcoder on 14.11.2022.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication
            .shared
            .sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
    }
    
}

struct AddNoteView: View {

    @EnvironmentObject var notes: ObservableArray<Note>
    
    @State var name = ""
    @State var detail = ""
    
    var body: some View {
        VStack {
            TextField("Название", text: $name).frame(height: 50)
            CustomTextEditor
                .init(placeholder: "Заметка…", text: $detail)
                .font(.body)
                .background(Color(UIColor.systemGray6))
                .accentColor(.green)
                .frame(height: 250)
                .cornerRadius(10)
            Button {
                hideKeyboard()
                notes.array.append(Note(name: name, detail: detail))
            } label: {
                Text("Сохранить".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Добавление заметки")
    }
}

struct AddNoteView_Previews: PreviewProvider {

    static var previews: some View {
        AddNoteView()
    }
}
