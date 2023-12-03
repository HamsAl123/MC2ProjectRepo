//
//  ContentView.swift
//  MC2
//
//  Created by Hams Alzahrani on 08/05/1445 AH.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
            VStack(spacing:30){
                Text("لماذا نلعب؟")
                    .font(.system(size: 32, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 236, height: 37, alignment: .top)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 330, height: 380)
                        .background(Color(red: 1, green: 0.97, blue: 0.68))
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 1, y: 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Color(red: 1, green: 0.97, blue: 0.68), lineWidth: 1)
                        )
                    Text("لنتعلم على الطريقة الصحيحة لكتابة كلمة مرور قوية آمنة لكي تحمي بياناتنا")
                        .font(.system(size: 32, weight: .medium))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    .frame(width: 300, alignment: .top)}
                .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                ZStack{
                    
                    Button {
                    } label: {
                        NavigationLink(destination: FirstLevel()) {
                            Image("b1")
                                .resizable()
                                .frame(width: 253, height: 58)
                        }}
                    Text("هيا نبدأ")
                        .font(.system(size: 32, weight: .medium))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.88, green: 0.9, blue: 0.91))
                        .frame(width: 114, height: 35, alignment: .top)
                }}
            
        }}
       
    }
}

#Preview {
    MainScreen()
}

