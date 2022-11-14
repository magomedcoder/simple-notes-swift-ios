//
//  DetailNoteView.swift
//  Notes
//
//  Created by Magomedcoder on 15.11.2022.
//

import SwiftUI

struct DetailNoteView: View {

    @EnvironmentObject var note: Note
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
                let index = notes.array.firstIndex(of: note)
                hideKeyboard()
                notes.objectWillChange.send()
                notes.array[index!].name = name
                notes.array[index!].detail = detail
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
        .onAppear(perform: {
            name = note.name
            detail = note.detail
        })
        .padding()
        .navigationTitle("Изменение заметки")
    }
}

struct DetailNoteView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNoteView()
    }
}

