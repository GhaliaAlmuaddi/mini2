//
//  GameModel.swift
//  GameC
//
//  Created by Ghalia Mohammed Al Muaddi on 18/05/1445 AH.
//

import Foundation
struct GameModel {
     private var CounterTeamOne = 0
     private var CounterTeamTwo = 0
    
    
     var lightweightObjects: [String] = [
        "كتاب",
        "لمبة",
        "ستارة",
        "ساعة حائط",
        "مصباح",
        "صحن",
        "مشغل موسيقى",
        "فنجان قهوة",
        "ملعقة",
        "شمعة",
        "مزهرية",
        "إطار صورة",
        "قلم رصاص",
        "كرة تنس",
        "سلة نفايات",
        "مرآة صغيرة",
        "منديل ورقي",
        "حلق",
        "كرة الشاطئ",
        "مظلة صغيرة",
        "محفظة",
        "ساعة معصم",
        "أقلام ملونة",
        "كاميرا فورية",
        "مشط",
        "صابون صغير",
        "كرسي مطوي",
        "مفكرة",
        "قميص خفيف",
        "هاتف جوال",
        "حقيبة صغيرة",
        "مفاتيح السيارة",
        "نظارات شمسية",
        "كرة طائرة",
        "سماعات أذن",
        "قنينة ماء",
        "لوحة فنية صغيرة",
        "قطعة أثاث من البامبو",
        "ورق تغليف هدايا",
        "سجادة صغيرة",
        "شمسية محمولة",
        "حقيبة ظهر صغيرة",
        "كرة تنس الطاولة",
        "نبات داخلي صغير",
    ]
    var UniqueSet  = Set <String> ()
    
//    let clumns = Array(repeating: GridItem(.flexible(),spacing: 8), count:8)
    // Data model for the code grids
    let keyValueItems = [
        KeyValueItem(id: UUID(), key: 10, value: "ض"),
        KeyValueItem(id: UUID(), key: 8, value: "ط"),
        KeyValueItem(id: UUID(), key: 16, value: "ظ"),
        KeyValueItem(id: UUID(), key: 26, value: "ع"),
        KeyValueItem(id: UUID(), key: 17, value: "غ"),
        KeyValueItem(id: UUID(), key: 28, value: "ف"),
        KeyValueItem(id: UUID(), key: 27, value: "ق"),
        KeyValueItem(id: UUID(), key: 7, value:  "ك"),
        KeyValueItem(id: UUID(), key: 25, value: "ل"),
        KeyValueItem(id: UUID(), key: 22, value: "م"),
        KeyValueItem(id: UUID(), key: 12, value: "ن"),
        KeyValueItem(id: UUID(), key: 19, value: "ه(ة)"),
        KeyValueItem(id: UUID(), key: 14, value: "و"),
        KeyValueItem(id: UUID(), key: 21, value: "ي"),
        KeyValueItem(id: UUID(), key: 1, value: "ا(ء)"),
        KeyValueItem(id: UUID(), key: 24, value: "ب"),
        KeyValueItem(id: UUID(), key: 13, value: "ت"),
        KeyValueItem(id: UUID(), key: 11, value: "ث"),
        KeyValueItem(id: UUID(), key: 9, value: "ج"),
        KeyValueItem(id: UUID(), key: 5, value: "ح"),
        KeyValueItem(id: UUID(), key: 2, value: "خ"),
        KeyValueItem(id: UUID(), key: 6, value: "د"),
        KeyValueItem(id: UUID(), key: 4, value: "ذ"),
        KeyValueItem(id: UUID(), key: 20, value: "ر"),
        KeyValueItem(id: UUID(), key: 23, value: "ز"),
        KeyValueItem(id: UUID(), key: 18, value: "س"),
        KeyValueItem(id: UUID(), key: 3, value: "ش"),
        KeyValueItem(id: UUID(), key: 15, value: "ص"),
        
    ]
    
}
