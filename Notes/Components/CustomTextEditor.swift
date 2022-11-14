//
//  CustomTextEditor.swift
//  Notes
//
//  Created by Magomedcoder on 14.11.2022.
//

import SwiftUI

struct CustomTextEditor: View {
    
    let placeholder: String
    @Binding var text: String
    let internalPadding: CGFloat = 5
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty  {
                Text(placeholder)
                    .foregroundColor(Color.primary.opacity(0.25))
                    .padding(EdgeInsets(top: 7, leading: 4, bottom: 0, trailing: 0))
                    .padding(internalPadding)
            }
            TextEditor(text: $text).padding(internalPadding)
        }.onAppear() {
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear() {
            UITextView.appearance().backgroundColor = nil
        }
    }

}
