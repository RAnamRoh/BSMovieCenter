//
//  ResuableTextField.swift
//  BSMovieCenter
//
//  Created by BS00834 on 6/6/24.
//

import SwiftUI

struct ResuableTextField: View {
    
    @Binding var enteredText : String
    @State var title : String
    @State var forPassword : Bool
    @State private var isSecureField : Bool = true
    var body: some View {
      
        
        
        if !forPassword {
            TextField(title, text: $enteredText)
                .font(.title2)
                .foregroundStyle(.primary)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("SecondaryBackgroundColor"))
                .cornerRadius(10)
        } else {
            HStack{
                if isSecureField{
                    SecureField(title, text: $enteredText)
                        .font(.title2)
                        .foregroundStyle(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color("SecondaryBackgroundColor"))
                        .cornerRadius(10)
                }else {
                    TextField(title, text: $enteredText)
                        .font(.title2)
                        .foregroundStyle(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color("SecondaryBackgroundColor"))
                        .cornerRadius(10)
                }
            }
            .overlay(alignment: .trailing) {
                Image(systemName: isSecureField ? "eye.slash" : "eye")
                    .padding()
                    .onTapGesture {
                        isSecureField.toggle()
                    }
            }
            
            
            
        }
        
       
    }
}

#Preview {
    ResuableTextField(enteredText: .constant(""), title: "title", forPassword: true)
}
