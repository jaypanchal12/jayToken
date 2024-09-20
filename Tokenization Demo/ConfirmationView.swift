//
//  ConfirmationView.swift
//  Tokenization Demo
//
//  Created by jay prakash on 20/09/2024.
//

import SwiftUI

struct ConfirmationView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Spacer()
            
            // Image with text
            VStack {
                Image(systemName: "checkmark.seal.fill") // Replace with your custom image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                    .padding(.bottom, 16)
                
                Text("Awesome!!")
                    .font(.textStyleTitle())
                    .foregroundColor(.token.black)
                    .bold()
                    .padding(.bottom, 4)
                
                Text("Thank you for joining this demo")
                    .font(.textStyleSubHeadline())
                    .foregroundColor(.token.systemGray2)
            }
            .padding()
            
            Spacer()
            
            Divider()
            
            // Button fixed at the bottom
            Button(action: {
                print("Back button pressed")
                presentationMode.wrappedValue.dismiss()

            }) {
                Text("Back")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.textStyleBody())
                    .background(Color.token.kfhBrand)
                    .foregroundColor(.token.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
            }
            .padding(.bottom, 10) // Padding at the bottom to ensure it's not too close to the screen edge
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
