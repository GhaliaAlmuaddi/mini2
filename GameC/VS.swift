import SwiftUI


struct VS: View {
    @Binding var team1Name : String
    @Binding var team2Name : String
    
    var body: some View {
        NavigationStack{
            ZStack {
                //BACKGROUND START...
                AngularGradient(
                    gradient: Gradient(colors: [ CustomColor.CustomDpurple,CustomColor.CustomLpurple]), center: .topLeading,
                    startAngle: .zero,
                    endAngle: .degrees(100)
                    
                )

                VStack{
                    HStack{
                        ZStack{
                            Rectangle()
                                .trim(from: 0 , to: 0.6)
                                .rotationEffect(.degrees(-180))
                            
                                .frame(width: 400, height: 500)
                            
                                .cornerRadius(13)
                                .foregroundStyle(
                                    LinearGradient(gradient: Gradient(colors: [CustomColor.CustomDyellow, CustomColor.CustomLyellow]), startPoint: .topTrailing, endPoint: .bottomLeading))
                                .padding(.trailing, -100)
                            
                            Text("\(team1Name)")
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.trailing)
                                .font(.system(size: 35))
                                .offset(x: -40, y: -140)
                            Image("V")
                                .resizable()
                                .frame(width:70, height: 70
                                )
                                .offset(x: 90, y: 13)
                            
                            Image("Ninja_with_stick")
                                .resizable()
                                .frame(width:200, height: 230
                                )
                                .offset(x: -50, y: 135)
                            
                        }
                        
                        ZStack{
                            Rectangle()
                                .trim(from: 0 , to: 0.6)
                                .frame(width: 400, height: 500)
                                .cornerRadius(13)
                                .foregroundStyle(
                                    LinearGradient(gradient: Gradient(colors: [CustomColor2.CustomDpurple, CustomColor2.CustomLpurple]), startPoint: .top, endPoint: .bottomLeading))
                                .padding(.leading, -100)
                            
                            Text("\(team2Name)")
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.trailing)
                                .font(.system(size: 35))
                                .offset(x:-40,y:-140)
                            Image("S")
                                .resizable()
                                .frame(width:70, height: 70)
                                .offset(x:-93, y: 15)
                            Image("ninjasmile2")
                                .resizable()
                                .frame(width:200, height: 230)
                                .offset(x:60,y: 135)
                        }
                        
                    }
                    
                        // Image(systemName:"xmark")
                        // .foregroundColor(.white)
                        //  .font(.title)
                        //  .fontWeight(.medium)
                        //  .offset( x:-340,y:-350)
                        
                    NavigationLink{ GameRoom( team1Name: $team1Name, team2Name: $team2Name)}
                        
                    label: {
                        ZStack {
                            
                            LinearGradient(colors: [ CustomColor.CustomDyellow,CustomColor.CustomLyellow], startPoint:.bottom, endPoint: .top).frame(width: 400, height:80).cornerRadius(41)
                            
                            
                            Text("ابدا")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                                .padding(30)
                        }
                    }
                        
//                    NavigationLink{ GameRoom( team1Name: $team1Name, team2Name: $team2Name)}

                    
                    
//                label: {
//                    ZStack {
//                       // RoundedRectangle(cornerRadius: 41)
//                           // .stroke(.blue, lineWidth: 4)
//                       //.padding()
//                       //.foregroundColor(Color.white.opacity(0.0))
//                      
//                      // .border(Color.customDyellow, width: 4)
//                       //.cornerRadius(41)
//                        RoundedRectangle(cornerRadius: 41)
//                            .stroke(Color.customLyellow, lineWidth: 2)
//                            .frame(width: 320, height:60)
//                        
//                        Text("مشاركة كود الانضمام")
//                            .font(.system(size: 22, weight: .bold))
//                            .foregroundColor(.white)
//                         
//                    }
//                }
                        
                        
                        
                        
                       
                        
                        
                    }
                    
                
            } .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    
                    // 2
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        NavigationLink {
                            // 3
                        HomePage()
                            
                        } label: {
                            // 4
                           
                                
                                Image(systemName: "xmark")
                                .resizable().font(.title)
                                .foregroundColor(.white)
                                .padding(.trailing)
                                
                            
                        }
                     
                    }}
        }}
        
    }

                   

    #Preview {
            VS(team1Name: .constant("Team 1"), team2Name: .constant("Team 2"))
        }

