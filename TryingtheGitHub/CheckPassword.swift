//
//  CheckPassword.swift
//  TryingtheGitHub
//
//  Created by Hams Alzahrani on 20/05/1445 AH.
//

import SwiftUI

struct Checkpassword: View {
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var submitted: Bool = false

    var body: some View {
        ZStack{
              
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
                RoundedRectangle(cornerRadius: 10)
                  .frame(width: 370,height: 280)
                  .foregroundColor(.white)
                  .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
              Text("تحقق من قوة كلمة مرورك").position(x:240,y:100).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VStack {
                    TextField("أدخل كلمة المرور", text: $password)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 360, height: 40)
                            .background(Color(red: 0.67, green: 0.87, blue: 0.78))
                            .shadow(color:.black.opacity(0.25), radius: 2, x: 1, y: 2)
                            .cornerRadius(8.0)
                            .padding(.vertical,40)
                      

                Button(action: {
                    submitted.toggle()
                }) {
                      Image("b1")
                          .resizable()
                          .frame(width: 200, height: 40)
                          .overlay(
                              Text("تحقق")
                                  .foregroundColor(.white)
                                  .font(.system(size: 24, weight: .bold))
                                  .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)))
                }
                .padding(.vertical, 20.0)
                
                if submitted {
                    Text("مدى قوة كلمة المرور :  \(passwordStrength(password))")
                        .padding()
                }
                  
             }
            
            .padding(.vertical, 40.0)//end of VStack
        }
        
    }
    
    func passwordStrength(_ password: String) -> String {
        let minLength = 8
        let containsNumber = password.rangeOfCharacter(from: .decimalDigits) != nil
        let containsSpecialCharacter = password.rangeOfCharacter(from: .punctuationCharacters) != nil
        
        if password.count < minLength {
            return "ضعيف! يجب ان يحتوي على \(minLength) رموز"
        } else if !containsNumber {
            return "ضعيف! يجب أن يحتوى على رقم واحد على الأقل"
        } else if !containsSpecialCharacter {
            return "ضعيف! يجب أن يحتوي على رمز واحد على الأقل"
        } else {
            return "قوي! كلمة المرور تطابق الشروط المطلوبة، بحيث يحتوي على ٨ أحرف، على الأقل رقم واحد، وعلى الأقل رمز واحد"
        }
    }
}
#Preview {
    Checkpassword()
}
