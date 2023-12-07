//
//  GameRoom.swift
//  GameC
//
//  Created by Samaa on 28/11/2023.
//

import SwiftUI
import AVKit
//import UIKit
//import AVFoundation

//Sound MangerSound class for audios
class SoundManger {
    static let incstance = SoundManger()
    
    var player: AVAudioPlayer?
    
    enum SoundOption:String{
    case hit
    case gong
    case rising
    case punch
    case big_punch
    }
    
    func playSound(sound: SoundOption){
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print("Error Play the sound.\(error.localizedDescription)")
        }
       
        
    }
    
}

struct GameRoom: View {
   // @ObservedObject var conn4VM: ConnnectFourViewModel
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showCode = false
    @State private var showGotPoint = false
    @State  var CounterTeamOne = 0
    @State  var CounterTeamTwo = 0
    @State private var presnt : CGFloat = 003
    
    @State private var navigationActive: Bool = false
    
    
    
    @State var RequestsAndOrders: [KeyValueItem] = [
        
        //Writer : Ghalia , Reviewer : Amal abughazalah
        KeyValueItem(id: UUID(),key: "24 1 13 7", value: "كتاب"),
        KeyValueItem(id: UUID(),key: "19 24 26 25", value: "لعبة"),
        KeyValueItem(id: UUID(),key: "8 1 1 5 _ 19 26 1 18", value: "ساعه حائط"),
        KeyValueItem(id: UUID(),key: "9 14 20", value: "روج"),
        KeyValueItem(id: UUID(),key: "20 8 26", value: "عطر"),
        KeyValueItem(id: UUID(),key: "20 28 1 16 1 _  15 27 22", value: "مقص اظافر"),
        KeyValueItem(id: UUID(),key: "19 20 1 21 18 _5 1 13 22", value: "مفتاح سيارة"),
        
        
        //Writer : Tahani , Reviewer : Ghalia
        KeyValueItem(id: UUID(),key: "19 1 28 3 _ 24 8 20 22", value: "مرطب شفاه"),
        KeyValueItem(id: UUID(),key: "19 26 1 22 18", value: "سماعة"),
        KeyValueItem(id: UUID(),key: "19 27 26 22", value: "ملعقة"),
        KeyValueItem(id: UUID(),key: "19 26 22 3", value: "شمعة"),
        KeyValueItem(id: UUID(),key: "19 28 5 13", value: "تحفة"),
        KeyValueItem(id: UUID(),key: "12 1 9 12 28", value: "فنجان"),
        KeyValueItem(id: UUID(),key: "19 21 20 19 23 22", value: "مزهرية"),
        
        //Writer : Samaa , Reviewer : Amal Alotaibi
        KeyValueItem(id: UUID(), key: "13 1 21 1 28 12_19 25 18", value: "سلة نفايات"),
        KeyValueItem(id: UUID(), key: "19 6 1 9 18", value: "سجادة"),
        KeyValueItem(id: UUID(), key: "19 20 21 17 15 _ 19 21 1 20 22", value: "مراية صغيرة"),
        KeyValueItem(id: UUID(), key: "25 21 6 1 12 22 _ 12 14 13 20 7", value: "كرتون مناديل"),
        KeyValueItem(id: UUID(), key: "27 25 5", value: "حلق"),
        KeyValueItem(id: UUID(), key: "19 21 18 22 3_ 13 1 20 1 16 12", value: "نظارات شمسية"),
        KeyValueItem(id: UUID(), key: "12 1 12 18 1 _ 19 1 3 20 28", value: "فرشاة أسنان"),
        
        //Writer : Amal abughazalah , Reviewer : Tahani
        KeyValueItem(id: UUID(), key: "19 21 24 8 _ 13 1 20 1 16 12", value: "نظارات طبيه"),
        KeyValueItem(id: UUID(), key: "19 16 28 5 22", value: "محفظة"),
        KeyValueItem(id: UUID(), key: "25 1 21 20 _ 19 18 22 2", value: "خمسه ريال"),
        KeyValueItem(id: UUID(), key: "15 1 15 20 _ 22 25 27", value: "قلم رصاص"),
        KeyValueItem(id: UUID(), key: "15 21 22 27", value: "قميص"),
        KeyValueItem(id: UUID(), key: "19 16 28 5 22", value: "محفظة"),
        KeyValueItem(id: UUID(), key: "8 3 22", value: "مشط"),
        
        //Writer : Amal alotaibi , Reviewer : Samaa
        KeyValueItem(id: UUID(), key: "25 1 2 25 2", value: "خلخال"),
        KeyValueItem(id: UUID(), key: "19 22 1 22 7", value: "كمامه"),
        KeyValueItem(id: UUID(), key: "12 14 24 1 15", value: "صابون"),
        KeyValueItem(id: UUID(), key: "6 21 _ 19 26 1 18", value: "ساعة يد"),
        KeyValueItem(id: UUID(), key: "19 8 24 20", value: "ربطة"),
        KeyValueItem(id: UUID(), key: "19 20 28 18", value: "سفرة"),
        KeyValueItem(id: UUID(), key: "19 22 23 9", value: "جزمة"),
        
        
        //التحديات ناقصة، بليز لو في بالكم شي ضيفوه
        ///لسى ماتوزعت نبغى نكملها
        ///عطر
      KeyValueItem(id: UUID(), key: "1 20 27 15 14", value: "ارقصو"),
        KeyValueItem(id: UUID(), key: "13 3 27 25 24 14", value: "تشقلبو"),
        
        
    ]
    
    
    @State var UniqueSet  = Set <KeyValueItem> ()
    
    
    @Binding var team1Name : String
    @Binding var team2Name : String
    
    @State var sheetShowing = false
    //ARRAY FOR THE GRID
    
    @State var clumns = Array(repeating: GridItem(.flexible(),spacing: 8), count:8)
    // Data model for the code grids
    @State var keyValueItems = [
        KeyValueItem(id: UUID(), key: "10" , value: "ض"),
        KeyValueItem(id: UUID(), key: "8", value: "ط"),
        KeyValueItem(id: UUID(), key: "16", value: "ظ"),
        KeyValueItem(id: UUID(), key: "26", value: "ع"),
        KeyValueItem(id: UUID(), key: "17", value: "غ"),
        KeyValueItem(id: UUID(), key: "28", value: "ف"),
        KeyValueItem(id: UUID(), key: "27", value: "ق"),
        KeyValueItem(id: UUID(), key: "7", value:  "ك"),
        KeyValueItem(id: UUID(), key: "25", value: "ل"),
        KeyValueItem(id: UUID(), key: "22", value: "م"),
        KeyValueItem(id: UUID(), key: "12", value: "ن"),
        KeyValueItem(id: UUID(), key: "19", value: "ه(ة)"),
        KeyValueItem(id: UUID(), key: "14", value: "و"),
        KeyValueItem(id: UUID(), key: "21", value: "ي"),
        KeyValueItem(id: UUID(), key: "1", value: "ا(ء)"),
        KeyValueItem(id: UUID(), key: "24", value: "ب"),
        KeyValueItem(id: UUID(), key: "13", value: "ت"),
        KeyValueItem(id: UUID(), key: "11", value: "ث"),
        KeyValueItem(id: UUID(), key: "9", value: "ج"),
        KeyValueItem(id: UUID(), key: "5", value: "ح"),
        KeyValueItem(id: UUID(), key: "2", value: "خ"),
        KeyValueItem(id: UUID(), key: "6", value: "د"),
        KeyValueItem(id: UUID(), key: "4", value: "ذ"),
        KeyValueItem(id: UUID(), key: "20", value: "ر"),
        KeyValueItem(id: UUID(), key: "23", value: "ز"),
        KeyValueItem(id: UUID(), key: "18", value: "س"),
        KeyValueItem(id: UUID(), key: "3", value: "ش"),
        KeyValueItem(id: UUID(), key: "15", value: "ص")
        
    ]
    
    
    @State var Current_Q  = ""
    
    
    var body: some View {
        
       
        
        ZStack {
            //BACKGROUND START...
            // Text("")
            AngularGradient(
                gradient: Gradient(colors: [ CustomColor.CustomDpurple,CustomColor.CustomLpurple]), center: .topLeading,
                startAngle: .zero,
                endAngle: .degrees(100)
                
            )
            .ignoresSafeArea()
            //BACKGROUND END...
            VStack{
                HStack{
                    Button("إنهاء") {
                        showGotPoint = true
                    }
                    .alert("طفشتوا،تبغون تنهون اللعبة وتشوفون عقاب الخسرانين؟", isPresented: $showGotPoint) {
                        Button("لا",role: .cancel) { }
                        Button("اي",role: .destructive) {
                            sheetShowing.toggle()
                            SoundManger.incstance.playSound(sound: .gong)
                            Winner(CounterTeamOne: $CounterTeamOne, CounterTeamTwo: $CounterTeamTwo, team1Name: $team1Name, team2Name: $team2Name)
                        }
                    }
                    .foregroundColor(CustomColor.CustomDyellow)
                    .font(.system(size: 24))
                    .padding(10)
                    
                    
                    Spacer()
                    
                    Button("دعوة") {
                        showCode = true
                      //  conn4VM.invite()
                        
                    }
                   .alert("رمز الدعوة:", isPresented: $showCode) {
                       Button("نسخ",role: .cancel) { }
                   } message: {
                        Text("CBC1414")
//                        
                  }
                    .foregroundColor(CustomColor.CustomDyellow)
                    .font(.system(size: 24))
                    .padding(10)
                    
                    
                }.padding(30)//END OF HSTACK FOR THE BTNS
                
                
                HStack{
                    VStack(alignment:.trailing){
                        Text("\(team1Name)")
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                        Text("\(CounterTeamOne)/100")
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.trailing)
                        ZStack(alignment:.leading){
                            ZStack{
                                //let pct1 = Double(CounterTeamOne)/1
                                //Text(String(format: "%.0f", self.presnt * 100) + "%")
                                Capsule()
                                .fill(.black.opacity(0.08)).frame(width: 100,height: 22)}
                            let pct1 = Double(CounterTeamOne)/1;
                            Capsule()
                                .trim(from:0, to: pct1)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [ CustomColor.CustomLyellow,CustomColor.CustomDyellow]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                                .frame(width:pct1, height: 18)
                        }
                        
                        //.padding(.top)
                    }.foregroundColor(.white)
                    Spacer()
                    
                    VStack{
                        Text(" فك الشفرة ونفذ او جيب الطلب باسرع ماعندك")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.trailing)
                        
                        ZStack{
                            
                            Text(Current_Q)
                            
                                .foregroundColor(.white)
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                .fontWeight(.semibold)
                            //.multilineTextAlignment(.trailing)
                            //.font(.system(family: "Helvetica"))
                            Capsule()
                                .fill(.white.opacity(0.08))
                                .frame(width: 350,height: 60)
                        }
                        
                    }
                    
                    
                    
                    Spacer()
                    VStack(alignment:.trailing){
                        Text(("\(team2Name)"))
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                        Text("\(CounterTeamTwo)/100")
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.trailing)
                        
                        ZStack(alignment:.leading){
                            ZStack{
                                //Text(String(format: "%.0f", self.presnt * 100) + "%")
                                Capsule()
                                    .fill(.black.opacity(0.08))
                                    .frame(width: 100,height: 22)
                            }
                            let pct2 = Double(CounterTeamTwo)/1;
                            Capsule()
                                .trim(from:0, to: pct2)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [ CustomColor.CustomLyellow,CustomColor.CustomDyellow]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                                .frame(width: pct2, height: 18)
                        }
                    }.foregroundColor(.white)
                    
                }.padding(30)
                
                //START OF THE CODE GRID...
                
                LazyVGrid(columns: clumns, spacing: 8) {
                    ForEach(keyValueItems.shuffled()) { item in
                        
                        
                        ZStack{
                            
                            Rectangle()
                                .fill(.white.opacity(0.09)).frame(width: 70,height: 70)
                                .cornerRadius(13)
                            
                            HStack {
                                Text("\(item.key)")
                                    .foregroundColor(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                                
                            }
                            
                        }
                        ZStack{
                            Rectangle()
                                .fill(.white.opacity(0.09)).frame(width: 70,height: 70)
                                .cornerRadius(13)
                            
                            HStack {
                                
                                Text("\(item.value)")
                                    .foregroundColor(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                    }
                }.padding(30)
                
                
                
                //HSTACK FOR THE BTN COUNTER START ...
                HStack{
                    
                    
                    Button {
                        
                        //                        Current_Q = uniqueShaffled(Array1: &RequestsAndOrders , UniqueSet1: &UniqueSet)
                        
                        ScoreFun(Current_Counter: &CounterTeamOne)
                        
                        SoundManger.incstance.playSound(sound: .hit)
                        //                        if (lightweightObjects.count == 9){
                        //                            print("yay")
                        
//                        let impactGenerator = UIImpactFeedbackGenerator(style: .heavy) // Choose the style that fits your needs
//                        impactGenerator.impactOccurred(intensity: 1.0) // Adjust intensity as needed (0.0 to 1.0)

//                        DispatchQueue.main.async {
//                                                      let generator = UINotificationFeedbackGenerator()
//                                                       generator.notificationOccurred(.success)
//                                                  }
                        //                        }
                        //yay
                        if (CounterTeamOne == 100){
                            sheetShowing.toggle()
                            SoundManger.incstance.playSound(sound: .gong)
                        }
                        else {
                            showingAlert1 = true
                        }
                        
                        
                        
                    } label: {
                        ZStack{
                            
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ CustomColor.CustomDyellow,CustomColor.CustomLyellow]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 220, height: 220) .cornerRadius(13)
                            Image("finished1")
                                .resizable()
                                .frame(width: 230, height:150)
                                .cornerRadius(13)
                                .offset(x:15)
                            
                            
                            VStack{
                                Text("\(team1Name)")
                                    .foregroundColor(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                Image("ninja_with_stick")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                    .offset(y:15)
                                    .fullScreenCover(isPresented:$sheetShowing){
                                        Winner(CounterTeamOne: $CounterTeamOne, CounterTeamTwo: $CounterTeamTwo, team1Name: $team1Name, team2Name: $team2Name)}
                            }
                            
                        }
                        
                    }    .alert(" كفو لفريق \(team1Name) \n \n  مستعدين للتنافس بالشفرة الجايه ؟", isPresented: $showingAlert1) {
                        Button("اكييد! كمل 💪",role: .cancel) {
                            Current_Q = uniqueShaffled(Array1:  &RequestsAndOrders,UniqueSet1: &UniqueSet)
                           
                            
//                            UIImpactFeedbackGenerator(style: .medium)
                    
                           // feedback.notificationOccurred(.success)
                            
                        } }
                        
                        Spacer()
                        
                        Button {
                            
                            //                        Current_Q = uniqueShaffled(Array1:  &RequestsAndOrders,UniqueSet1: &UniqueSet)
                            
//                            let impactGenerator = UIImpactFeedbackGenerator(style: .heavy) // Choose the style that fits your needs
//                            impactGenerator.impactOccurred(intensity: 1.0) // Adjust intensity as needed (0.0 to 1.0)

                            
                            ScoreFun(Current_Counter: &CounterTeamTwo)
                            
                            
                            
                            SoundManger.incstance.playSound(sound: .hit)
                            
//                            DispatchQueue.main.async {
//                                                          let generator = UINotificationFeedbackGenerator()
//                                                           generator.notificationOccurred(.success)
//                                                      }
//                            
                          //  showGotPoint=true
                            if (CounterTeamTwo == 100){
                                sheetShowing.toggle()
                                SoundManger.incstance.playSound(sound: .gong)
                            }
                            else {
                                showingAlert2 = true
                            }
                            
                        }
                        
                        
                        
                    label: {
                        
                        ZStack{
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [ CustomColor.CustomDyellow,CustomColor.CustomLyellow]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 220, height: 220) .cornerRadius(13)
                            Image("finished1")
                                .resizable()
                                .frame(width: 230, height:150)
                                .cornerRadius(13)
                                .offset(x:15)
                            
                            VStack{
                                Text("\(team2Name)")
                                    .foregroundColor(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                Image("NINJA_SMILE")
                                    .resizable()
                                    .frame(width: 145,height: 145)
                                    .offset(y:16)
                                    .fullScreenCover(isPresented:$sheetShowing){
                                        Winner(CounterTeamOne: $CounterTeamOne, CounterTeamTwo: $CounterTeamTwo, team1Name: $team1Name, team2Name: $team2Name)}
                            }
                            
                        }   }
                    .alert(" كفو لفريق \(team2Name) \n \n  مستعدين للتنافس بالشفرة الجايه ؟", isPresented: $showingAlert2) {
                        
                        
                        Button("اكييد! كمل 💪",role: .cancel) {
                            Current_Q = uniqueShaffled(Array1:  &RequestsAndOrders,UniqueSet1: &UniqueSet)
                            
//                            DispatchQueue.main.async {
//                                let generator = UINotificationFeedbackGenerator()
//                                generator.notificationOccurred(.success)
//                            }
                            
                           
                            
                            //ScoreFun(Current_Counter: &CounterTeamTwo)
                            
                        }
                        
                    }
                        
                        
                        
                        
                    }.padding(30)
                    //HSTACK FOR THE BTN COUNTER END ...
                    
                    
                    
                    
                        .navigationBarBackButtonHidden(true)
                    
                    
                    
                    
                }// END OF VSTACK
            
            }
        .onAppear{
            Current_Q = uniqueShaffled(Array1:  &RequestsAndOrders,UniqueSet1: &UniqueSet)
        }
            
        }
    }
        func uniqueShaffled(Array1: inout [KeyValueItem],UniqueSet1 : inout Set<KeyValueItem>)-> String {
            
            while true {
                Array1 = Array1.shuffled()
                
                for i in Array1 {
                    if !UniqueSet1.contains(i) {
                        UniqueSet1.insert(i)
                        return i.key
                    }
                }
                
                UniqueSet1.removeAll()
                
            }
            
            
        }


func ScoreFun ( Current_Counter: inout Int){
    if Current_Counter + 10 <= 100 {
        
        Current_Counter += 10
    }
}
    
    
    struct KeyValueItem: Identifiable, Hashable {
        let id: UUID
        let key: String
        let value: String
    }



    
    
    #Preview {
        GameRoom(team1Name: .constant("Team 1"), team2Name: .constant("Team 2"))
    }

