//
//  ConfirmationView.swift
//  Tokenization Demo
//
//  Created by jay prakash on 20/09/2024.
//
// dummy
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
                    .textStyleTitle()
                    .foregroundColor(.Token.black)
                    .padding(.bottom, 4)
                
                Text("Thank you for joining this demo")
                    .textStyleSubHeadline()
                    .foregroundColor(.Token.systemGray2)
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
                    .textStyleBody()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.Token.kfhBrand)
                    .foregroundColor(.Token.black)
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
