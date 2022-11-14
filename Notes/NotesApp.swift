//
//  NotesApp.swift
//  Notes
//
//  Created by Magomedcoder on 14.11.2022.
//

import SwiftUI

@main
struct NotesApp: App {

    @State var notes: ObservableArray<Note> = ObservableArray(array: [])

    var body: some Scene {
        WindowGroup {
            ListView().environmentObject(notes)
        }
    }
}
