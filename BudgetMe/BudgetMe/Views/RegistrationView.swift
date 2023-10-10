//
//  RegistrationView.swift
//  BudgetMe
//
//  Created by Jake Alvarado on 10/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack
        {
            //image
            Image("budget-logo")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height:240)
                .padding(.vertical, 32)
            
            
            
            
            VStack {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                InputView(text: $fullname,
                          title: "Fullname",
                          placeholder: "Enter Your Fullname",
                          isSecureField: false)
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                InputView(text: $confirmpassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecureField:true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                print("Sign User Up...")
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3)
                {
                    Text("Already have an account?")
                    Text("Log in")
                        .fontWeight(.bold)
                }
            }
        }
    }
}

    #Preview {
        RegistrationView()
    }
