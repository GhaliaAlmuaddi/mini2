//
//  GameRoom.swift
//  GameC
//
//  Created by Samaa on 28/11/2023.
//

import SwiftUI
import AVKit
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
    @State private var showingAlert = false
    @State private var showCode = false
    @State private var showGotPoint = false
    @State  var CounterTeamOne = 0
    @State  var CounterTeamTwo = 0
    @State private var presnt : CGFloat = 003
    
    @State private var navigationActive: Bool = false
    
//    @State var ٍٍRequestsAndOrders: [Objects] = [
//        Objects(Encrypted_String: "10", AfterDecoded_String: "كتاب"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "لعبة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "ساعه حائط"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "روج"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "عطر"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "مقص اظافر"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "مفتاح سيارة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "مرطب شفاه"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "سماعة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "ملعقة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String : "شمعة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String : "تحفة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "تحفة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "فنجان"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "مزهرية"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "سلة نفايات"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "سجادة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "مراية صغيرة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "سلة نفايات"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "كرتون مناديل"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "حلق"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "نظارات شمسية"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "نظارات طبيه"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "محفظة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "خمسه ريال"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "قلم رصاص"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "قميص"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "محفظة"),
//        Objects(Encrypted_String: "10", AfterDecoded_String:"مشط"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "خلخال"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "كمامه"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "صابون"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "ساعة يد"),
//        Objects(Encrypted_String: "10", AfterDecoded_String: "ربطة"),
//
//       ]
    
    @State var RequestsAndOrders: [KeyValueItem] = [
        
        //Writer : Ghalia , Reviewer : Amal abughazalah
           KeyValueItem(id: UUID(),key: "10", value: "كتاب"),
           KeyValueItem(id: UUID(),key: "10", value: "لعبة"),
           KeyValueItem(id: UUID(),key: "10", value: "ساعه حائط"),
           KeyValueItem(id: UUID(),key: "10", value: "روج"),
           KeyValueItem(id: UUID(),key: "10", value: "عطر"),
           KeyValueItem(id: UUID(),key: "10", value: "مقص اظافر"),
           KeyValueItem(id: UUID(),key: "10", value: "مفتاح سيارة"),
           
           
           //Writer : Tahani , Reviewer : Ghalia
           KeyValueItem(id: UUID(),key: "10", value: "مرطب شفاه"),
           KeyValueItem(id: UUID(),key: "10", value: "سماعة"),
           KeyValueItem(id: UUID(),key: "10", value: "ملعقة"),
           KeyValueItem(id: UUID(),key: "10", value: "شمعة"),
           KeyValueItem(id: UUID(),key: "10", value: "تحفة"),
           KeyValueItem(id: UUID(),key: "10", value: "فنجان"),
           KeyValueItem(id: UUID(),key: "10", value: "مزهرية"),
           
           //Writer : Samaa , Reviewer : Amal Alotaibi
           KeyValueItem(id: UUID(), key: "13,1,21,1,28,12,19,25,18", value: "سلة نفايات"),
           KeyValueItem(id: UUID(), key: "19,6,1,9,18", value: "سجادة"),
           KeyValueItem(id: UUID(), key: "19,20,21,17,15,19,21,1,20,22", value: "مراية صغيرة"),
           KeyValueItem(id: UUID(), key: "25,21,6,1,12,22,12,14,13,20,7", value: "كرتون مناديل"),
           KeyValueItem(id: UUID(), key: "27,25,5", value: "حلق"),
           KeyValueItem(id: UUID(), key: "19,21,18,22,3,13,1,20,1,16,12", value: "نظارات شمسية"),
           KeyValueItem(id: UUID(), key: "12,1,12,18,1,19,1,3,20,28", value: "فرشاة أسنان"),
           //Writer : Amal abughazalah , Reviewer : Tahani
           KeyValueItem(id: UUID(), key: "10", value: "نظارات طبيه"),
           KeyValueItem(id: UUID(), key: "10", value: "محفظة"),
           KeyValueItem(id: UUID(), key: "10", value: "خمسه ريال"),
           KeyValueItem(id: UUID(), key: "10", value: "قلم رصاص"),
           KeyValueItem(id: UUID(), key: "10", value: "قميص"),
           KeyValueItem(id: UUID(), key: "10", value: "محفظة"),
           KeyValueItem(id: UUID(), key: "10", value: "مشط"),
           
           //Writer : Amal alotaibi , Reviewer : Samaa
           KeyValueItem(id: UUID(), key: "10", value: "خلخال"),
           KeyValueItem(id: UUID(), key: "10", value: "كمامه"),
           KeyValueItem(id: UUID(), key: "10", value: "صابون"),
           KeyValueItem(id: UUID(), key: "10", value: "ساعة يد"),
           KeyValueItem(id: UUID(), key: "10", value: "ربطة"),
           KeyValueItem(id: UUID(), key: "10", value: "سفرة"),
           KeyValueItem(id: UUID(), key: "10", value: "جزمة"),
           
           
           //التحديات ناقصة، بليز لو في بالكم شي ضيفوه
           ///لسى ماتوزعت نبغى نكملها
           KeyValueItem(id: UUID(), key: "10", value: "ارقصو"),
           KeyValueItem(id: UUID(), key: "10", value: "تشقلبو"),
           

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
                        showingAlert = true
                    }
                    .alert("طفشتوا،تبغون تنهون اللعبة وتشوفون عقاب الخسرانين؟", isPresented: $showingAlert) {
                        Button("لا",role: .cancel) { }
                        Button("اي",role: .destructive) { }
                    }
                    .foregroundColor(CustomColor.CustomDyellow)
                    .font(.system(size: 24))
                    .padding(10)
                    
                    
                    Spacer()
                    
                    Button("دعوة") {
                        showCode = true
                    }
                    .alert("رمز الدعوة:", isPresented: $showCode) {
                        Button("نسخ",role: .cancel) { }
                    } message: {
                        Text("CBC1414")
                        
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
                        Text("سارع بفك الشفرة وتنفيذ الطلب")
                            .foregroundColor(.white)
                            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
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
                                .frame(width: 290,height: 60)
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
                        
                        Current_Q = uniqueShaffled(Array1: &RequestsAndOrders , UniqueSet1: &UniqueSet)
                        
                        ScoreFun(Current_Counter: &CounterTeamOne)
                        
                        SoundManger.incstance.playSound(sound: .hit)
//                        if (lightweightObjects.count == 9){
//                            print("yay")
//                        }
                        if (CounterTeamOne == 100){
                            sheetShowing.toggle()
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
                        
                        }
                        
                    Spacer()
                    
                    Button {
                        
                        Current_Q = uniqueShaffled(Array1:  &RequestsAndOrders,UniqueSet1: &UniqueSet)
                        ScoreFun(Current_Counter: &CounterTeamTwo)
                        
                        SoundManger.incstance.playSound(sound: .hit)
                        
                        showGotPoint=true
                        if (CounterTeamTwo == 100){
                            sheetShowing.toggle()
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
                                .offset(y:15)
                                .fullScreenCover(isPresented:$sheetShowing){
                                    Winner(CounterTeamOne: $CounterTeamOne, CounterTeamTwo: $CounterTeamTwo, team1Name: $team1Name, team2Name: $team2Name)}
                        }
                        
                    }   }
//                .alert("كفو والله!!", isPresented: $showGotPoint) {
//                    Button("كمل 💪",role: .cancel) { }
//                }
                    
                    
                    
                    
                }.padding(30)
                //HSTACK FOR THE BTN COUNTER END ...
                
                
                
             
                    .navigationBarBackButtonHidden(true)
                
                
                
                
            }// END OF VSTACK
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
        
        
    }}


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

struct Objects {
    let Encrypted_String: String
    let AfterDecoded_String: String
}

    
    
    #Preview {
        GameRoom(team1Name: .constant("Team 1"), team2Name: .constant("Team 2"))
    }

