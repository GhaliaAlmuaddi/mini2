//
//  ContentView.swift
//  game1
//
//  Created by amal on 10/05/1445 AH.
//

import SwiftUI


struct Winner: View {
      @State private var isButtonTapped = false
      let results = ["عشاء الفريق الفايز اليوم عليكم", "قهوة الفريق الفايز عليكم","الفريق الفايز يختارلكم اغنية ترقصون عليها","عقاب اختياري من الفريق الفايز","ارقصو رقصة البطريق","اوقفو على رجل واحدة لثلاث دقايق"].shuffled()
    
    
        @Binding var CounterTeamOne : Int
        @Binding var CounterTeamTwo : Int
        @Binding var team1Name : String
        @Binding var team2Name : String
    var body: some View {
        NavigationView{
            ZStack{
                
                AngularGradient(
                    gradient: Gradient(colors: [ CustomColor.CustomDpurple,CustomColor.CustomLpurple]), center: .topLeading,
                    startAngle: .zero,
                    endAngle: .degrees(100)
                    
                )
                .ignoresSafeArea()
               
                GroupBox {
                    VStack{
                        
                        if CounterTeamOne > CounterTeamTwo {
                            
                            StrokeText(text: "\(team1Name)", width: 1.5, color: .customLyellow)
                            
                            
                                .font(.system(size: 72))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 400.0, height: 200.0).padding()
                            
                           
                            
                            Text("النتيجة \(CounterTeamOne)")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(width: 310, height: 50)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .background(Color(hue: 0.0, saturation: 0.016, brightness: 0.821, opacity: 0.35))
                            
                                .cornerRadius(40)
                                .offset(x:0, y: -50)
                        } else{
                            StrokeText(text: "\(team2Name)", width: 1.5, color: .customLyellow)
                            
                            
                                .font(.system(size: 72))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 400.0, height: 200.0)
                                .padding(.top,-20)
                            
                            // .offset(x:0, y: -20)
                            
                            Text("النتيجة \(CounterTeamTwo)")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(width: 310, height: 50)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .background(Color(hue: 0.0, saturation: 0.016, brightness: 0.821, opacity: 0.35))
                            
                                .cornerRadius(40).padding(.top,-50)
                            
                            
                        }
                        
                        
                        ZStack{ RoundedRectangle(cornerRadius: 40)
                                .frame(width: 400, height: 250)
                                .foregroundColor(Color(hue: 0.0, saturation: 0.016, brightness: 0.821, opacity: 0.35))
                            
                            VStack{
                                StrokeText(text: "عقاب الخسرانين", width: 0.5, color: .customLyellow)
                                
                                    .padding(.bottom, 60)
                                    .frame(width: 400, height: 50)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                
                                Text(results[0])
                                    .frame(width: 350, height: 80)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .multilineTextAlignment(.center)
                            }}.foregroundColor(Color.white)
                        
                        NavigationLink{
                            HomePage()
                        }
                    label:{
                        Text("تم")
                            .padding()
                            .frame(width: 250, height: 60)
                            .font(.title).bold()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [CustomColor.CustomDyellow, CustomColor.CustomLyellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(41)
                            .frame(width: 550, height: 100.0)
                    } .shadow(color: .black, radius: 3, x: 0, y: 3)
                                         
                    }
                    
                    .frame(width: 433, height: 616)
                }
                
                .backgroundStyle(Color(red: 0.576, green: 0.592, blue: 0.592, opacity: 0.315))
                ZStack {
                    Image("win1")
                        .resizable()
                        .frame(width:600, height:140)
                    
                    Text("الفائز")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold).padding(.bottom,20)
                    
                        .font(.system(size: 46))
                                        Image("star1")
                                            .resizable()
                                            .frame(width:60, height:60).padding(.bottom,200).padding(.leading,200)
                                           // .position(CGPoint(x: 400, y: 150))
                                        Image("star1")
                                            .resizable()
                                            .frame(width:99, height:100).padding(.bottom,200)
//                                            .position(CGPoint(x: 300, y: 176))
                                        Image("star1")
                                            .resizable()
                                            .frame(width:60, height:60).padding(.bottom,200).padding(.trailing,200)
                                        
                    
                    
                }.padding(.bottom,600)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
       
    }
}





struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        Winner(CounterTeamOne: .constant(0),CounterTeamTwo: .constant(0), team1Name: .constant("Team 1"), team2Name: .constant("Team 2"))
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color
    
    var body: some View {
        ZStack{
                        ZStack{
                            Text(text).offset(x:  width, y:  width)
                            Text(text).offset(x: -width, y: -width)
                            Text(text).offset(x: -width, y:  width)
                            Text(text).offset(x:  width, y: -width)
                        }
                        .foregroundColor(color)
                        Text(text)
                    }
        }
    }

