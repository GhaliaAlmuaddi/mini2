//
//  ScoreDialogue .swift
//  GameC
//
//  Created by Ghalia Mohammed Al Muaddi on 19/05/1445 AH.
//

import SwiftUI

struct ScoreDialogue_: View {
 
        @Binding var isActive: Bool
    let title: String
    //let message: String
    @State private var JoiningID = ""

    let buttonTitle: String
    let action: () -> ()
    @State private var offset: CGFloat = 3000



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
                .fill(.white.opacity(0.6)).frame(width: 470, height:350).cornerRadius(13)
                .blur(radius:0.5)
            

            VStack {
                Text(title)
                    .font(.title2)
                    .bold().foregroundStyle(.white)
                    .padding(30)

               // VStack {
                TextField("", text: $JoiningID , prompt: Text("كود الانضمام")
                    .foregroundColor(.white)
                        ).frame(width:352.53,height: 83).overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(Color.white, lineWidth: 2)
                )
                    .multilineTextAlignment(.center)
                

                Button {
                    action()
                    close()
                } label: {
                    ZStack {
                       

                            
                        
                        LinearGradient(colors: [ CustomColor.CustomDyellow,CustomColor.CustomLyellow], startPoint:.bottom, endPoint: .top).frame(width: 286, height:71).cornerRadius(41)
    //                        RoundedRectangle(cornerRadius: 41)
    //                                .foregroundColor(.yellow)

                        Text(buttonTitle)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .padding(30)
                    }
                    .padding(30)
                }
            }.cornerRadius(20)
       
           
            .padding(30)
            .overlay(alignment: .trailingFirstTextBaseline) {
                Button {
                    close()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                //.tint(.black)
                .padding()
            }
            .shadow(radius: 20)
            .padding(30)
          
        }.ignoresSafeArea().padding(-40) //here
    }



    func close() {
    //    withAnimation(.spring()) {
    //        offset = 1000
            isActive = false
        }
    }


    //struct CustomColor{
    //static let CustomDpurple = Color("CustomDpurple")
    //static let CustomDyellow = Color("CustomDyellow")
    //static let CustomLpurple = Color("CustomLpurple")
    //static let CustomLyellow = Color("CustomLyellow")
    //}
    struct  ScoreDialogue_Previews2: PreviewProvider {
        static var previews: some View {
            JoiningTeamDialogue(isActive: .constant(true), title: "كفو", buttonTitle: "", action: {})
        }
    }


//#Preview {
//    ScoreDialogue_()
//}
