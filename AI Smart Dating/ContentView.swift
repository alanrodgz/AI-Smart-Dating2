//
//  ContentView.swift
//  AI Smart Dating
//
//  Created by Alan Rodriguez on 2/2/25.
//

import SwiftUI
import SwiftData
import Firebase
import FirebaseAuth

struct ContentView: View {
    @State var isLoginMode = false
    @State var email: String = ""
    @State var password: String = ""
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                
                VStack(spacing: 16){
                    Picker(selection: $isLoginMode, label: Text("Picker here")){
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if !isLoginMode {
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                    }
                    
                    Group{
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)

                    }
                        .padding(12)
                        .background(Color.white)
                    
                    
                    Button{
                        handleAction()
                    } label: {
                        HStack{
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color.blue)
                        
                    }
                }
                .padding()
                
            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
                .ignoresSafeArea())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func handleAction() {
        if isLoginMode {
            login()
        } else {
            createNewAccount()
        }
    }
    
    private func createNewAccount() { 
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
          if let error = error {
            print("FAILED TO CREATE NEW USER:", error.localizedDescription)
            return
          }
          
          if let user = result?.user {
            print("Successfully created new user: \(user.uid)")
          }
        }
      }
    
    private func login() {
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
