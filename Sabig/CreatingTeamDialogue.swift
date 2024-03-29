//
//  JoiningDialogue.swift
//  GameC
//
//  Created by Ghalia Mohammed Al Muaddi on 10/05/1445 AH.
//

import SwiftUI


    struct CreatingTeamDialogue: View {
        @Binding var isActive: Bool

        let title: String
    
        @State var team1Name = ""
        @State var team2Name = ""
        @State var showAlert : Bool = false
        @State var showNextView: Bool = false
        let buttonTitle: String
        let action: () -> ()
        @State private var offset: CGFloat = 3000
        
        
        var objectCripto : [String]=["a","b","c","E","F","G","H","I","J","K"]
 
        var body: some View {
          
            
            
            ZStack {
                Color(.black)
                    .opacity(0.70)
                .blur(radius:20)
            .ignoresSafeArea()
                    .onTapGesture {
                        close()
                    }
                    Rectangle()
                    .fill(.white.opacity(0.6)).frame(width: 470, height:450).cornerRadius(13)
                    .blur(radius:0.5)
                

                VStack {
                    Text(title)
                        .font(.title2)
                        .bold().foregroundStyle(.white)
                        .padding(30)

                   // VStack {
                    TextField("", text: $team1Name, prompt: Text("اسم الفريق الاول")
                        .foregroundColor(.white)
                            ).frame(width:352.53,height: 83).overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.white, lineWidth: 2)
                    )
                        .multilineTextAlignment(.center)
                    TextField("", text: $team2Name, prompt: Text("اسم الفريق الثاني")
                        .foregroundColor(.white)
                            ).frame(width:352.53,height: 83).overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.white, lineWidth: 2)
                    )
                        .multilineTextAlignment(.center)
                        //   }
                        .font(.body)

                    Button{
                       
                        
                        if (team1Name.count > 0 && team2Name.count > 0 ) {
                          hideKeyboard()
                            showNextView = true
                            
                          
                            
                        }
                        
                        else {
                           showAlert.toggle()
                        }
                    }label: {
                        ZStack {
                           

                                
                            
                            LinearGradient(colors: [ CustomColor.CustomDyellow,CustomColor.CustomLyellow], startPoint:.bottom, endPoint: .top).frame(width: 286, height:71).cornerRadius(41).shadow(color: .black, radius: 3, x: 0, y: 3)


                            Text(buttonTitle)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                                .padding(30)
                        }
                        .padding(30)
                    }
                }.cornerRadius(20).alert(isPresented: $showAlert) {
                    Alert(title: Text("الاسم مطلوب"), message: Text("اسماء الفريقين مطلوبة"), dismissButton: .default(Text("تم")))
                }
           
               
                .padding(30)
                .overlay(alignment: .trailingFirstTextBaseline) {
                    Button {
                        close()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.white).shadow(color: .black, radius: 3, x: 0, y: 3)
                    }
                    //.tint(.black)
                    .padding()
                }
                
                .padding(30)
              
                
                
                if (showNextView == true) {
                    VS(team1Name: $team1Name, team2Name: $team2Name)
                    
                }
                
                
                
            }.ignoresSafeArea().padding(-40) //here
        }
        


        func close() {
            withAnimation(.spring()) {
                offset = 1000
                isActive = false
            }
        }
    }

struct CustomColor{
    static let CustomDpurple = Color("CustomDpurple")
    static let CustomDyellow = Color("CustomDyellow")
    static let CustomLpurple = Color("CustomLpurple")
   static let CustomLyellow = Color("CustomLyellow")
}

    struct CustomDialog_Previews: PreviewProvider {
        static var previews: some View {
            CreatingTeamDialogue(isActive: .constant(true), title: "كون فريقك", buttonTitle: "يلا نبدا", action: {})
        }
    }

private func hideKeyboard() {
     UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     
 }


