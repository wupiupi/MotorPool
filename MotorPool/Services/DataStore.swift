//
//  DataStore.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/21/23.
//

final class DataStore {
    static let shared = DataStore()
 
    let username = "user"
    let password = "pass"
    
    let autoNames = [
        "Toyota Land Cruiser 200",
        "Chevrolet Corvette C8",
        "BMW M5 F10",
        "Mercedes Benz C63 AMG",
        "Tesla Model S",
        "Audi A8",
        "Toyota Camry XSE",
        "Audi Q8",
        "Lexus TX 500h",
        "Nissan Maxima",
        "Rolls-Royce Phantom",
        "Nissan GT-R",
        "Cadillac Escalade"
    ]
    
    let prices = [
        "$74,939.59",
        "$152,029.32",
        "$49,952.49",
        "$73,842.81",
        "$52,124.88",
        "$105,925.34",
        "$38,234.87",
        "$85,910.50",
        "$78,550.34",
        "$23,474.48",
        "$647,394.54",
        "$120,547.23",
        "$160,693.45"
    ]
    
    let fuelConsumption = [
        "22.1 L/100 km",
        "12.1 L/100 km",
        "14.0 L/100 km",
        "6.9 L/100 km",
        "17.5 kWh/100 km",
        "9.1 L/100 km",
        "7.6 L/100 km",
        "8.4 L/100 km",
        "9.8 L/100 km",
        "7.9 L/100 km",
        "15.1 L/100 km",
        "14.7 L/100 km",
        "21.6 L/100 km"
    ]
    
    let descriptions = [
        "The Land Cruiser 200 Series was launched in September 2007 as the successor to the 100 Series, expanding the length and width by 60 mm and 30 mm, respectively. Adopting a redesigned separate frame structure, the new Land Cruiser featured enhanced rigidity, durability, collision safety, and interior comfort.",
        "The Chevrolet Corvette (C8) is the eighth generation of the Corvette sports car manufactured by American automobile manufacturer Chevrolet. It is the first rear mid-engine Corvette since the model's introduction in 1953, differing from the traditional front mid-engine design started in 1963.",
        "The sedan F10 was unveiled at the Munich Olympic Stadium on November 23, 2009 and production began in January 2010. The sedan models have a length of 4,899 mm (192.9 in). The F10 uses a more traditional BMW exterior styling approach compared with the controversial styling of its E60 5 Series predecessor.",
        "The exterior of the car is characterized by aggressive styling, aerodynamic design and classic Mercedes-Benz features, including a radiator grille with 3 slats and LED headlights. The body is streamlined, with clear lines, sporty and has elements such as a rear diffuser and wide side skirts. The 2018 release year of the C 63 AMG model was marked by the use of new technologies, improved engine and increased performance.",
        "The Tesla Model S is an all-electric car manufactured by Tesla, Inc. It was introduced in 2008 and became one of the first mass-produced electric vehicles on the market. The Model S has several modifications, including Long Range, Performance and P100D, which differ in power reserve, maximum speed and power.",
        "The Audi A8 is a luxury executive sedan produced by the German company Audi. It is equipped with advanced technology, high level of comfort and safety. The A8 has a stylish and elegant design, as well as a spacious and comfortable interior. The Audi A8 model range includes various modifications with different engines and configurations.",
        "The Camry is a mainstay of the midsize sedan segment, which has been losing both entries and sales in recent years as the world has embraced SUVs. Nevertheless, while the market has changed the Camry has continued to top the sales charts as the number-one selling passenger cars, a spot it’s held for the past twenty years. It has a well-earned reputation reliability, and it offers a hybridized version that returns exceptional fuel economy.",
        "The 2024 Audi Q8 is the four-ring brand's flagship SUV. The model shares much with the related Q7 three-row luxury SUV, but the Q8 is smaller, makes do with only two rows of seats, and boasts sleeker styling with a coupe-like sloping roofline.",
        "Boldly original. Distinctly Lexus. And proudly assembled in the U.S. Every element of the TX was carefully considered to ensure this SUV carries a commanding presence. Its stance: athletic and powerful, purposely designed to evoke the signature driving performance crafted by the Lexus master drivers. Announcing every arrival is the front fascia, which wears the latest expression of the spindle grille and is adorned with dramatic LED lighting.",
        "This isn’t just the 4-Door Sports Car, it’s a high-tech powerhouse. At the touch of a button, it can change from a luxury sedan to a canyon carver. Feel confident with available advanced driver assist technologies, and for seamless connectivity, just plug in your compatible smartphone.",
        "An untameable legend. An icon for icons. Phantom Series II exists alone at the apex of luxury. Its unprecedented design is an evolution in mastery — invigorating the mavericks who command its splendour.",
        "An unmatched blend of power and soul: the Nissan GT-R. Experience the singular supercar that sculpts the wind, with enhanced aerodynamics to improve ride and handling for 2024.",
        "Cadillac launched the performance version of the Escalade in 2022, called the Escalade-V. The Escalade-V is the largest performance SUV in the American market. It uses a 6.2-liter V8 supercharged engine. With an output of 682 horsepower (509 kW; 691 PS) and a 653 lb⋅ft (885 N⋅m) of torque, it is equipped with a 10-speed automatic transmission, and acceleration from 0 to 60 miles per hour (0 to 97 km/h) takes only 4.4 seconds. The suggested price starts at $149,990. The V will also be offered in the longer wheelbase ESV mod"
    ]
    
    private init() {}
}
