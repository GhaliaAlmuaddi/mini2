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
    @State var isActive2: Bool = false
    @State var sheetShowing = false
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                AngularGradient( gradient: Gradient(colors:[CustomColor2.CustomDpurple, CustomColor2.CustomLpurple]),
                                 center: .topLeading, startAngle:.zero, endAngle:.degrees(100))
                
                .ignoresSafeArea()
                
                HStack{
                    
                   
                        Button{ sheetShowing.toggle()
                            
                        }
                    label:{
                        ZStack{
                            Rectangle()
                            .trim(from: 0 , to: 0.6)
                            .rotationEffect(.degrees(-180))
                        
                            .frame(width: 500, height: 800)
                        
                            .cornerRadius(13)
                            
                                .foregroundStyle(
                                    LinearGradient(gradient: Gradient(colors: [CustomColor2.CustomDpurple, CustomColor2.CustomLpurple]), startPoint: .top, endPoint: .bottomLeading))
                                .padding(.trailing, -250)
                            VStack{
                                Text("وش السالفة؟")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.trailing)
                                    .font(.system(size: 52))
                                
                                    .offset(x: 50, y: 60)
                                //.rotationEffect(.degrees(5))
                                Image("ninja?")
                                
                                    .resizable()
                                    .frame(width:270, height: 340
                                    )
                                    .offset(x: 10, y:183)
                                //.rotationEffect(.degrees(5))
                                
                                
                            }
                            .fullScreenCover(isPresented: $sheetShowing, content:{ GameDescription(sheetShowing: $sheetShowing)})
                           
                            
                        }
                        
                   //    .padding()
                     
                        
                    }
                       
                    Button {
                        isActive = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .trim(from: 0 , to: 0.6)
                                .frame(width: 500, height: 800)
                                .cornerRadius(13)
                                .foregroundStyle(
                                    LinearGradient(gradient: Gradient(colors: [CustomColor.CustomDyellow, CustomColor.CustomLyellow]), startPoint: .topTrailing, endPoint: .bottomLeading)
                                )
                               
                              
                            VStack{
                                Text("يلا نلعب!")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.trailing)
                                    .font(.system(size: 52))
                                    .offset(x: 50, y: 60)
                                
                                
                                Image("NINJA_SMILE")
                                    .resizable()
                                    .frame(width:270, height: 340
                                    )
                                    .offset(x: 115.0, y: 185)
                                // .rotationEffect(.degrees(5))
                                
                            }
                            
                        }
                          
                    }
                }
                    
                if isActive {
                    CreatingTeamDialogue(isActive: $isActive, title: "كون فريقك", buttonTitle: "يلا نبدا") {
                        // print("Pass to viewModel")
                    }
                }
                
                if isActive2 {
                    JoiningTeamDialogue( isActive: $isActive2, title: "بنضم الى لعبة", buttonTitle: "ارسل طلب للاجهزة الي حولك") {
                        // print("Pass to viewModel")
                    }
                }
                
                
            }}
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


