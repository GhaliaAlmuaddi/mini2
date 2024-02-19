//
//  homepage.swift
//  GameC
//
//  Created by Ghalia Mohammed Al Muaddi on 13/05/1445 AH.
//

//
//  ContentView.swift
//  mini2
//
//  Created by Amal Abughazaleh on 12/05/1445 AH.
//

import SwiftUI


struct HomePage: View {
    
    @State var isActive: Bool = false
    @State var sheetShowing = false
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                AngularGradient( gradient: Gradient(colors:[CustomColor2.CustomDpurple, CustomColor2.CustomLpurple]),
                                 center: .topLeading, startAngle:.zero, endAngle:.degrees(100))
                
                .ignoresSafeArea()
                
                VStack(spacing:60){
                    
                   
                       
                    Button {
                        isActive = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .trim(from: 0 , to: 0.7)
                                .frame(width: 1000, height: 500)
                                .cornerRadius(13)
                                .foregroundStyle(
                                    LinearGradient(gradient: Gradient(colors: [CustomColor.CustomDyellow, CustomColor.CustomLyellow]), startPoint: .topTrailing, endPoint: .bottomLeading)
                                )
                                .shadow(radius: 30)
                                .rotationEffect(.degrees(180))
                                .shadow(color: .black, radius: 3, x: 0, y: 3)
                                
                            HStack{
                                Text("يلا نلعب!")
                                    .foregroundColor(Color.white).bold()
                                    .multilineTextAlignment(.trailing)
                                    .font(.system(size: 52))
                                   .offset(x: 400, y: 155)
                                
                                
                                Image("NINJA_SMILE")
                                    .resizable()
                                    .frame(width:350, height: 350
                                    )
                                    .offset(x: -220.0, y: 80)
                                
                                
                            }
                            
                        }
                        .padding(.trailing, 200)
                    }
                    
                    Button{ sheetShowing.toggle()
                        
                    }
                label:{
                    ZStack{
                        Rectangle()
                        .trim(from: 0 , to: 0.7)
                       
                    
                        .frame(width: 1000, height: 500)
                    
                        .cornerRadius(13)
                        
                            .foregroundStyle(
                                LinearGradient(gradient: Gradient(colors: [CustomColor2.CustomDpurple, CustomColor2.CustomLpurple]), startPoint: .top, endPoint: .bottomLeading))
                            .shadow(color: .black, radius: 3, x: 0, y: 3)
                           
                        HStack{
                            Text("وش السالفة؟")
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.trailing)
                                .font(.system(size: 52))
                            
                                .offset(x: 0, y: -170)
                            
                            Image("ninja?")
                            
                                .resizable()
                                .frame(width:350, height: 440
                                )
                                .offset( y:31)
                                
                            //.rotationEffect(.degrees(5))
                            
                            
                        }
                        .fullScreenCover(isPresented: $sheetShowing, content:{ GameDescription(sheetShowing: $sheetShowing)})
                       
                        
                    }
                    
                    .padding(.leading, 200)
                 
                    
                }

                }
                if isActive {
                    CreatingTeamDialogue(isActive: $isActive, title: "كون فريقك", buttonTitle: "يلا نبدا") {
                        // print("Pass to viewModel")
                    }
                }
                
        
                
                
            }
}
        .navigationBarBackButtonHidden(true)
        //.accentColor(.red)
        //.padding(.bottom, -10.0)
        
        
        
        
        
        
        
        
    }
}
        
    
    struct CustomColor2{
        static let CustomDpurple = Color("CustomDpurple")
        static let CustomDyellow = Color("CustomDyellow")
        static let CustomLpurple = Color("CustomLpurple")
       static let CustomLyellow = Color("CustomLyellow")
    }

#Preview {
    HomePage()
}


