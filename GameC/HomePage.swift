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
    var body: some View {
        
        NavigationStack{
            ZStack{
                AngularGradient( gradient: Gradient(colors:[CustomColor2.CustomDpurple, CustomColor2.CustomLpurple]),
                                 center: .topLeading, startAngle:.zero, endAngle:.degrees(100))
                
                .ignoresSafeArea()
                
                HStack{
                    
                    VStack{
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 13)
                                .onTapGesture {
                                    //  GameDescription()
                                    
                                }
                                .padding()
                            // .rotationEffect(.degrees(5))
                            
                                .frame(width: 330, height:420)
                            
                                .foregroundStyle(
                                    LinearGradient(gradient: Gradient(colors: [CustomColor2.CustomDpurple, CustomColor2.CustomLpurple]), startPoint: .top, endPoint: .bottomLeading))
                            
                            VStack{
                                Text("وش السالفة؟")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.trailing)
                                    .font(.system(size: 35))
                                
                                    .offset(x: 40, y: 40)
                                //.rotationEffect(.degrees(5))
                                Image("ninja?")
                                
                                    .resizable()
                                    .frame(width:200, height: 300
                                    )
                                    .offset(x: -50, y: 13)
                                //.rotationEffect(.degrees(5))
                                
                                
                            }
                            
                        }
                        
                        .padding(.bottom, 0)
                        .padding(.trailing,5)
                        ZStack{
                            RoundedRectangle(cornerRadius: 13)
                            
                            //.rotationEffect(.degrees(5))
                                .frame(width: 300, height:420)
                            
                                .foregroundStyle(
                                    LinearGradient(gradient: Gradient(colors: [CustomColor.CustomDyellow, CustomColor.CustomLyellow]), startPoint: .topTrailing, endPoint: .bottomLeading))
                            
                            VStack{
                                
                                
                                Text("بنضم الى لعبة")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.trailing)
                                    .font(.system(size: 35))
                                
                                    .offset(x: 30, y: 40)
                                //.rotationEffect(.degrees(5))
                                Image("ninja_with_stick")
                                    .resizable()
                                    .frame(width:200, height: 240
                                    )
                                    .offset(x: -50.0, y: 60)
                                // .rotationEffect(.degrees(5))
                                
                                
                                
                            }
                            
                        }
                        .padding([.trailing], 2)
                        
                    }
                    
                    Button {
                        isActive = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 13)
                                .frame(width: 330, height: 830)
                                .foregroundStyle(
                                    LinearGradient(gradient: Gradient(colors: [CustomColor.CustomDyellow, CustomColor.CustomLyellow]), startPoint: .topTrailing, endPoint: .bottomLeading)
                                )
                            
                            VStack{
                                Text("يلا نلعب!")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.trailing)
                                    .font(.system(size: 52))
                                    .offset(x: 10, y: 105)
                                
                                
                                Image("NINJA_SMILE")
                                    .resizable()
                                    .frame(width:270, height: 340
                                    )
                                    .offset(x: 10.0, y: 200)
                                // .rotationEffect(.degrees(5))
                                
                            }  .padding(.bottom, -10.0)
                        }.ignoresSafeArea()
                    }
                }.ignoresSafeArea()
                
                if isActive {
                    //                       Color(.black)
                    //                            // .blur(radius:500)
                    //                                .opacity(0.8).ignoresSafeArea()
                    CreatingTeamDialogue(isActive: $isActive, title: "كون فريقك", buttonTitle: "يلا نبدا") {
                        // print("Pass to viewModel")
                    }
                }
                
                
            }}
            .padding(.bottom, -10.0)
                        
                        
                        
                        
                    
                    
                    
                    
                }}
        
    
    struct CustomColor2{
        static let CustomDpurple = Color("CustomDpurple")
        static let CustomDyellow = Color("CustomDyellow")
        static let CustomLpurple = Color("CustomLpurple")
       static let CustomLyellow = Color("CustomLyellow")
    }

#Preview {
    HomePage()
}


