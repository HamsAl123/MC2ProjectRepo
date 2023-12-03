import SwiftUI
//[A-Za-z0-9]+d{5,}
//Hams
import CloudKit
struct ThirdLevel: View {
    @State var answer: String = ""
    @State var isShowingPopUp = false
    @State var isShowingPopUp1 = true
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
            VStack(spacing:10){
                Text("المستوى الثالث")
                    .font(.system(size: 32, weight: .medium))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .frame(width: 310, height: 37, alignment: .trailing)
                
                ZStack { Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 330, height: 646)
                        .background(Color(red: 0.67, green: 0.87, blue: 0.78))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 1, y: 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.47, green: 0.61, blue: 0.67).opacity(0.16), lineWidth: 1)
                        )
                    VStack(spacing:40){
                        
                        Text("أكتب كلمة مرور مكونة من ٥ أحرف يتبع القواعد التالية:\n\n1 - لا تكتب معلوماتك الشخصية مثل اسمك، و عمرك \n\n2 - يجب أن يكون هنالك على الأقل حرف واحد كبير \n \n3 - يجب أن يكون هنالك على الأقل حرف واحد صغير\n\n4 - يجب أن يكون هنالك على الأقل رقم واحد \n\n5 - يجب أن يكون هنالك رمز واحد على الأقل")

                            .font(.system(size: 20, weight: .medium))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.black)
                            .frame(width: 280, alignment:.topTrailing)
                            
                        
                        TextField("أكتب اجابتك هنا", text: $answer)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 310, height: 48)
                            .background(.white)
                            .shadow(color:.black.opacity(0.25), radius: 2, x: 1, y: 2)
                            .cornerRadius(8.0)
                        
                        Button {
                            self.isShowingPopUp.toggle()
                        } label: {
                            Image("b1")
                                .resizable()
                                .frame(width: 253, height: 58)
                                .overlay(
                                    Text("تحقق")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .bold))
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)))
                                .onTapGesture {
                                    if isValidPassword(answer) {
                                        // Code to execute if the password is valid
                                        print("Valid password")
                                        self.isShowingPopUp = true
                                        
                                    } else {
                                        // Code to execute if the password is invalid
                                        print("Invalid password")
                                        self.isShowingPopUp1 = false
                                        
                                    }
                                }
                            
                        }
                        
                    }
                    
                }
                
            }
            .overlay(
                Group {
                    if isShowingPopUp {
                        GoodjobPopUpView3(isShowingPopUp: $isShowingPopUp)
                    }
                    if !isShowingPopUp1 {
                        WeakPasswordPopUpView3(isShowingPopUp: $isShowingPopUp1)
                    }
                }
            )//end of overlay
        }
        //Spacer()
        
        
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{5,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}

struct GoodjobPopUpView3: View {
    @Binding var isShowingPopUp: Bool
    var body: some View {
        
    
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 272.7178, height: 361)
                .background(Color(red: 1, green: 0.97, blue: 0.68))
                .cornerRadius(13)
                .shadow(radius: 10)
            
            
            VStack(spacing:40){
                Text("عملٌ جيّد!")
                    .font(.system(size: 32, weight: .bold))
                    .frame(width: 233, height: 36, alignment: .top)     .foregroundColor(.black)
                
                
                Text("تابع الى المستوى التالي!")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 245.0508, height: 49.58791, alignment: .top)
                //.offset(x:0,y:-120)
                
                Button {
                    self.isShowingPopUp.toggle()
                } label: {
                    Image("b1")
                        .resizable()
                        .frame(width: 162, height: 41)
                        .overlay(
                            Text("حسنًا")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)))
                    
                }
                
            }
            
        }//end of ZStack
    }
}// end of view
struct WeakPasswordPopUpView3: View {
    @Binding var isShowingPopUp: Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 272.7178, height: 361)
                .background(Color(red: 0.9, green: 0.57, blue: 0.56))
                .cornerRadius(13)
                .shadow(radius: 10)
            
            
            VStack(spacing:10){
                Text("لقد ادخلت رمز سري ضعيف جدا !")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 260, height: 120, alignment: .center)     .foregroundColor(.black)
                
                Text("اتبع الشروط المدونة وحاول مرة اخرى انا واثق من قدرتك على النجاح!")  .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .lineSpacing(9.0)
                    .frame(width: 253, height: 150, alignment: .top)
                
                
                Button {
                    self.isShowingPopUp.toggle()
                } label: {
                    Image("b1")
                        .resizable()
                        .frame(width: 162, height: 41)
                        .overlay(
                            Text("حسنًا")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)))
                }
                
            }
        }
    }
}
#Preview {
    ThirdLevel()
}
