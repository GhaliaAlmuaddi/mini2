//
//  amal.swift
//  mini2
//
//  Created by Amal Abughazaleh on 13/05/1445 AH.
//

import Foundation
import SwiftUI

struct Desc2: View {
    var body: some View {
        ZStack{
            
            AngularGradient( gradient: Gradient(colors:[CustomColor.CustomDpurple, CustomColor.CustomLpurple]),
                             center: .topLeading, startAngle:.zero, endAngle:.degrees(100))
            
            .ignoresSafeArea()
            
            Color(.black)
                .blur(radius: 140)
                .opacity(0.3)
                .ignoresSafeArea()
           
            VStack(alignment: .trailing , spacing: 20) {
                    
//                    Text(" وش السالفة؟  🤔")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.white)
//                        .multilineTextAlignment(.trailing)
//                        .padding(50.0)
                    Text("اللعبة بتعرض لكم شفرة، يبدا كل فريق منكم يحاول يفك الشفرة و تنفيذ هذا الطلب.")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding([.top, .leading, .trailing], 50.0)
                        .padding(.bottom , -10)
                    Text(" على سبيل المثال عندنا هذي الشفرة:")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding([.top, .leading, .trailing], 50.0)
                        .padding(.bottom , -10)
                    
                    Image("GameDescription")
                        .resizable()
                        
                        .frame(width: 200, height:40)
                        .padding(.top)
                        .padding(.trailing, 270)
                                  
                    Text(" وعندنا لوحة التشفير:")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding([.leading, .trailing], 50.0)
                        .padding(.bottom , -10)
                    Image("GameDescription2")
                        .resizable()
                        .padding(.top)
                        .padding(.horizontal, 50)
                        .frame(width: 800, height:400)
                    
                    Text(" تشوفون كل رقم ايش الحرف المقابل له.\n ملاحظة : قراءة الشفرة من اليمين لليسار")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 50.0)
                    Text("بعد فك التشفير بتطلع لكم الكلمة: مفتاح")

                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading], 50.0)
                        .padding(.trailing, 170).padding(.bottom,80)
                    
                }.padding(.top,140)
            
        }.ignoresSafeArea()
        
        
        
    }
    
}
    
#Preview {
    Desc2()
}
