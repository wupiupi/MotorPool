//
//  quizAuto.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 10.01.2024.
//

import Foundation

struct Question {
    
    let title: String
    let answers: [Answer]
    
    static func getQuestion() -> [Question] {
        [
            Question(
                title: "Ваша комфортная скорость",
                answers: [
                    Answer(title: "50 km/h", car: .lada),
                    Answer(title: "70 km/h", car: .toyota),
                    Answer(title: "90 km/h", car: .mercedes),
                    Answer(title: "110 km/h", car: .mercedes),
                    Answer(title: ">130 km/h", car: .bmw)
                ]
            ),
            
            Question(
                title: "Ваша манера езды",
                answers: [
                    Answer(title: "Спокойная", car: .toyota),
                    Answer(title: "Агрессивная", car: .bmw),
                    Answer(title: "Вежливая", car: .ford),
                    Answer(title: "Скандалист", car: .mercedes),
                    Answer(title: "Тормоз", car: .lada)
                ]
            ),
            
            Question(
                title: "Самый большой страх в пути",
                answers: [
                    Answer(title: "Закончится масло в ДВС", car: .bmw),
                    Answer(title: "Спустит колесо", car: .ford),
                    Answer(title: "Занесет", car: .toyota),
                    Answer(title: "Разборки", car: .lada),
                    Answer(title: "Любая ошибка на БК", car: .mercedes)
                ]
            ),
            
            Question(
                title: "Какой фильм про гонки вам понравился больше всего",
                answers: [
                    Answer(title: "Гран Туризмо (2023)", car: .mercedes),
                    Answer(title: "Ford против Ferrari (2019)", car: .ford),
                    Answer(title: "Форсаж (2015)", car: .bmw),
                    Answer(title: "Драйв (2011)", car: .toyota),
                    Answer(title: "Такси (1998)", car: .lada)
                ]
            ),
            
            Question(
                title: "Какого гонщика вы выберите",
                answers: [
                    Answer(title: "Max Verstappen", car: .ford),
                    Answer(title: "Sebastian Vettel", car: .toyota),
                    Answer(title: "Lewis Hamilton", car: .mercedes),
                    Answer(title: "Valtteri Bottas", car: .lada),
                    Answer(title: "Fernando Alonso", car: .bmw)
                ]
            ),
            
            Question(
                title: "Какая сумма ТО для вас допустима",
                answers: [
                    Answer(title: "90.000", car: .mercedes),
                    Answer(title: "60.000", car: .bmw),
                    Answer(title: "30.000", car: .toyota),
                    Answer(title: "15.000", car: .ford),
                    Answer(title: "<10.000", car: .lada)
                ]
            ),
            
            Question(
                title: "На сколько часто вы готовы обслуживать машину",
                answers: [
                    Answer(title: "6.000 km", car: .bmw),
                    Answer(title: "8.000 km", car: .mercedes),
                    Answer(title: "10.000 km", car: .ford),
                    Answer(title: "15.000 km", car: .lada),
                    Answer(title: ">20.000 km", car: .toyota)
                ]
            ),
            
            Question(
                title: "Любимое время года и погода для езды",
                answers: [
                    Answer(title: "Лето - сухо - жарко", car: .lada),
                    Answer(title: "Весна - сухо - закат", car: .toyota),
                    Answer(title: "Осень - сухо - прохладно", car: .ford),
                    Answer(title: "Осень - дождливо - слякоть", car: .mercedes),
                    Answer(title: "Зима - рыхлый снег - прохладно", car: .bmw)
                ]
            ),
            
            Question(
                title: "По ощущениям, какого объема ДВС вам бы хватило (хотелось) в данный момент:",
                answers: [
                    Answer(title: "2.0 (150 л/с)", car: .lada),
                    Answer(title: "2.5 (200 л/с)", car: .toyota),
                    Answer(title: "3.0 (270 л/с)", car: .ford),
                    Answer(title: "4.0 (350 л/с)", car: .bmw),
                    Answer(title: ">5.0 (450 л/с +)", car: .mercedes)
                ]
            ),
        ]
    }
}

struct Answer {
    let title: String
    let car: Car
}

//enum QuestionType {
//    case speed
//    case manner
//    case fear
//    case film
//}

enum Car: String {
    case bmw = "BMW M5"
    case toyota = "Toyota Camry"
    case mercedes = "Mercedes-Benz G-klass"
    case ford = "Ford Focus RS"
    case lada = "Lada Vesta"
    
    var descriptionENG: String {
        switch self {
        case .bmw:
            "You love speed, comfort and using your car to its full potential, and your best friend is a service station. You are used to mistakes on bookmakers, and live every day like it’s your last."
        case .toyota:
            "You are as reliable as your car, there are no other brands for you (they won’t even be able to leave the showroom). You stop by the service station just to show that you are still alive and to remind yourself."
        case .mercedes:
            "Sometimes it seems that you are alone on the road, everyone passes you and gives way. You don't notice any other places in the parking lot except for the disabled. You don't like showdowns, let your car say everything for you."
        case .ford:
            "Yes, not a BMW. Yes, not Mercedes. But you will still try to humiliate them at every opportunity, even though deep down you want them. You don't always do what you want, but you do it well. Girls certainly don't pay much attention to you, but in a narrow and closed circle of men you are very popular."
        case .lada:
            "This world is absolutely clear to you, there are only thieves around and you will do everything not to give in to them and not miss them. You are an honest person, everyone is trying to deceive you, but you are not stupid, and you know that the most important thing is the inner world and not the cover."
        }
    }
    
    var descriptionRU: String {
        switch self {
        case .bmw:
            "Вы любите скорость, комфорт и использовать свой автомобиль на все 100, а ваш лучший друг это СТО. Вы привыкли к ошибкам на БК, и проживаете каждый день как последний."
        case .toyota:
            "Вы такой же надежный человек как ваш автомобиль, других марок для вас нет (они даже из салона выехать не смогут). На СТО вы заезжаете только что бы показать что еще живы и напомнить о себе. "
        case .mercedes:
            "Иногда кажется что на дороге вы один, вас все пропускают и уступают. Вы не замечаете на парковке других мест кроме инвалидных. Вы не любите разборки, пусть ваш автомобиль скажет за вас все."
        case .ford:
            "Да, не BMW. Да не Mercedes. Но вы все равно будете пытаться унизить их при каждой возможности, хоть и в глубине души хотеть их. Вы не всегда делаете что хотите, но делаете это хорошо. Девушки конечно не обращают на вас большого внимания, зато в узком и закрытом кругу мужчин вы очень популярны."
        case .lada:
            "Вам этот мир абсолютно понятен, вокруг одни воры и вы будете делать все чтобы не уступать им и не пропускать их. Вы честный человек, вас все пытаются обмануть, но вы не глупый, и знаете что важнее всего внутренний мир а не обложка."
        }
    }
}
