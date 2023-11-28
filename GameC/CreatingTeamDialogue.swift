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
        //let message: String
        @State private var team1Name = ""
        @State private var team2Name = ""
        let buttonTitle: String
        let action: () -> ()
        @State private var offset: CGFloat = 3000
        
        var objectCripto : [String]=["a","b","c","E","F","G","H","I","J","K"]
 
        var body: some View {
          
            
           //var objectCripto_shaffle = Array_shaffle(array1: objectCripto)
            
//           ForEach(objectCripto,id: \.self){ element in
//            Text("\(element)")
//          }
//            var indx=3
//            var res = Array_shaffle2(array1: objectCripto,indexP: indx)
//            Text("\(res)").background(.black)
            
          //  print("Pass to viewModel")
            
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
                
//               Rectangle()
//                    .frame(width: 470, height:450 , alignment: .center)
//                    //.cornerRadius(20)
//                  .background(.white)
//                    .opacity(0.2).blur(radius:40)
//       
//                 .overlay {
//                
//                     LinearGradient(colors: [.clear, .white.opacity(0.05)], startPoint: .top, endPoint: .bottom)
//               }
            //shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
              // shadow(color: .white, radius: 5, x: 0, y: -2)
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

                    Button {
                        action()
                        close()
                    } label: {
                        ZStack {
                           
//                            AngularGradient(
//                                gradient: Gradient(colors: [ CustomColor.CustomDpurple,CustomColor.CustomLpurple]), center: .topLeading,
//                                startAngle: .zero,
//                                endAngle: .degrees(100)
                                
                            
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
           
                //.fixedSize(horizontal: false, vertical: true)
                .padding(30)//.frame(width: 470, height:508 , alignment: .center)
                
                //.background(.clear).opacity(10).cornerRadius(20)
//                .clipShape(RoundedRectangle(cornerRadius: 20)).background()
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
               // .offset(x: 0, y: offset)
//                .onAppear {
//                    withAnimation(.spring()) {
//                        offset = 0
//                    }
              //  }
            }.ignoresSafeArea().padding(-40) //here
        }
        
//        func Array_shaffle (array1:[String])-> [String] {
//          var array1=array1.shuffled()
//            return array1
//        }
//        
//        func Array_shaffle2 (array1:[String], indexP : Int)-> String {
//          var array1=array1.shuffled()
//           var index2=0
//            var value = ""
//            for i in array1 {
//                if(index2 == indexP){
//                var value = i
//                    break
//                }
//                index2=index2+1
//            }
//return value
//        }

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

//#Preview {
//    JoiningDialogue()
//}
