//
//  ContentView.swift
//  game1
//
//  Created by amal on 10/05/1445 AH.
//

import SwiftUI

struct Winner: View {
      @State private var isButtonTapped = false
      let results = ["عشاء الفريق الفايز اليوم عليكم", "قهوة الفريق الفايز عليكم"].shuffled()
    
    
        @Binding var CounterTeamOne : Int
        @Binding var CounterTeamTwo : Int
        @Binding var team1Name : String
        @Binding var team2Name : String
    var body: some View {
        NavigationView{
            ZStack{
                //Color("CustomDpurple")
                AngularGradient(
                    gradient: Gradient(colors: [ CustomColor.CustomDpurple,CustomColor.CustomLpurple]), center: .topLeading,
                    startAngle: .zero,
                    endAngle: .degrees(100)
                    
                )
                .ignoresSafeArea()
                //                            Text("النتائج")
                //                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                //                            .foregroundColor(Color.white)
                //                            .offset(x:0, y: -500)
                GroupBox {
                    VStack{
                        
                        if CounterTeamOne > CounterTeamTwo {
                            
                            StrokeText(text: "\(team1Name)", width: 1.5, color: .customLyellow)
                            //Text("الفريق الاول")
                            
                                .font(.system(size: 72))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 400.0, height: 200.0)
                            
                                .offset(x:0, y: -20)
                            
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
                            //Text("الفريق الاول")
                            
                                .font(.system(size: 72))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 400.0, height: 200.0)
                            
                                .offset(x:0, y: -20)
                            
                            Text("النتيجة \(CounterTeamTwo)")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(width: 310, height: 50)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .background(Color(hue: 0.0, saturation: 0.016, brightness: 0.821, opacity: 0.35))
                            
                                .cornerRadius(40)
                                .offset(x:0, y: -50)
                            
                        }
                        
                        //                                  Text("الفريق الاول")
                        //
                        //                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        //                                        .fontWeight(.bold)
                        //                                        .foregroundColor(Color.white)
                        //                                        .frame(width: 400.0, height: 200.0)
                        //
                        //                                        .offset(x:0, y: -37)
                        //
                        //                                  Text("النتيجة ٦٠/١٠٠")
                        //                                        .foregroundColor(Color.white)
                        //                                        .padding()
                        //                                        .frame(width: 310, height: 50)
                        //                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        //                                        .background(Color(hue: 0.0, saturation: 0.016, brightness: 0.821, opacity: 0.35))
                        //
                        //                                        .cornerRadius(40)
                        //                                        .offset(x:0, y: -50)
                        
                        // Spacer()
                        ZStack{ RoundedRectangle(cornerRadius: 40)
                                .frame(width: 400)
                                .foregroundColor(Color(hue: 0.0, saturation: 0.016, brightness: 0.821, opacity: 0.35))
                            
                            VStack{
                                StrokeText(text: "عقاب الخسرانين", width: 0.5, color: .customLyellow)
                                
                                    .padding(.bottom, 80)
                                    .frame(width: 350, height: 50)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                
                                Text(results[0])
                                    .frame(width: 350, height: 50)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                
                            }}.foregroundColor(Color.white)
                        
                        NavigationLink{
                            HomePage()
                        }
                    label:{
                        Text("تم")
                            .padding()
                            .frame(width: 230, height: 80)
                            .font(.title)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [CustomColor.CustomDyellow, CustomColor.CustomLyellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(35)
                            .frame(width: 550, height: 100.0)
                    }
                    .sheet(isPresented: $isButtonTapped) {
                        // Present the next view/page here
                        AnotherPageView()
                    }
                    }
                    
                    .frame(width: 433, height: 616)
                }
                
                .backgroundStyle(Color(red: 0.576, green: 0.592, blue: 0.592, opacity: 0.315))
                Image("win1")
                    .resizable()
                    .frame(width:600, height:140)
                    .position(CGPoint(x: 400, y: 242))
                Text("الفائز")
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .position(CGPoint(x: 400, y: 229))
                    .font(.system(size: 46))
                Image("star1")
                    .resizable()
                    .frame(width:99, height:100)
                    .position(CGPoint(x: 400, y: 150))
                Image("star1")
                    .resizable()
                    .frame(width:60, height:60)
                    .position(CGPoint(x: 300, y: 176))
                Image("star1")
                    .resizable()
                    .frame(width:60, height:60)
                    .position(CGPoint(x: 500, y: 176))
                
                Image("linee")
                    .position(CGPoint(x: 400, y: 500))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
       // .padding()
    }
}


struct AnotherPageView: View {
    var body: some View {
        Text("This is another page")
            .font(.title)
    }
}

// CUSTOM COLORS END...

//#Preview {
//    ContentView()
//}


struct ContentView_Previews: PreviewProvider {
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
