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
    
    let cars: [String: (
        model: String,
        price: Double,
        fuelConsumption: Double,
        description: String
    )] = [
        "BMW": (
        model: "M5 F10",
        price: 49.952,
        fuelConsumption: 14.0,
        description: "The sedan F10 was unveiled at the Munich Olympic Stadium on November 23, 2009 and production began in January 2010. The sedan models have a length of 4,899 mm (192.9 in). The F10 uses a more traditional BMW exterior styling approach compared with the controversial styling of its E60 5 Series predecessor."
    ),
        "Toyota": (
        model: "Land Cruiser 200",
        price: 74.939,
        fuelConsumption: 22.1,
        description: "The Land Cruiser 200 Series was launched in September 2007 as the successor to the 100 Series, expanding the length and width by 60 mm and 30 mm, respectively. Adopting a redesigned separate frame structure, the new Land Cruiser featured enhanced rigidity, durability, collision safety, and interior comfort."
    ),
        "Chevrolet": (
        model: "Corvette C8",
        price: 152.029,
        fuelConsumption: 12.1,
        description: "The Chevrolet Corvette (C8) is the eighth generation of the Corvette sports car manufactured by American automobile manufacturer Chevrolet. It is the first rear mid-engine Corvette since the model's introduction in 1953, differing from the traditional front mid-engine design started in 1963."
    ),
        "Mercedes-Benz": (
        model: "C63 AMG",
        price: 73.842,
        fuelConsumption: 6.9,
        description: "The exterior of the car is characterized by aggressive styling, aerodynamic design and classic Mercedes-Benz features, including a radiator grille with 3 slats and LED headlights. The body is streamlined, with clear lines, sporty and has elements such as a rear diffuser and wide side skirts. The 2018 release year of the C 63 AMG model was marked by the use of new technologies, improved engine and increased performance."
    ),
        "Audi": (
        model: "A8",
        price: 105.925,
        fuelConsumption: 9.1,
        description: "The Audi A8 is a luxury executive sedan produced by the German company Audi. It is equipped with advanced technology, high level of comfort and safety. The A8 has a stylish and elegant design, as well as a spacious and comfortable interior. The Audi A8 model range includes various modifications with different engines and configurations."
    ),
        "Lexus": (
        model: "TX 500h",
        price: 78.550,
        fuelConsumption: 9.8,
        description: "Boldly original. Distinctly Lexus. And proudly assembled in the U.S. Every element of the TX was carefully considered to ensure this SUV carries a commanding presence. Its stance: athletic and powerful, purposely designed to evoke the signature driving performance crafted by the Lexus master drivers. Announcing every arrival is the front fascia, which wears the latest expression of the spindle grille and is adorned with dramatic LED lighting."
    ),
        "Rolls-Royce": (
        model: "Phantom",
        price: 647.394,
        fuelConsumption: 15.1,
        description: "An untameable legend. An icon for icons. Phantom Series II exists alone at the apex of luxury. Its unprecedented design is an evolution in mastery — invigorating the mavericks who command its splendour."
    ),
        "Nissan": (
        model: "GT-R",
        price: 120.547,
        fuelConsumption: 12.7,
        description: "An unmatched blend of power and soul: the Nissan GT-R. Experience the singular supercar that sculpts the wind, with enhanced aerodynamics to improve ride and handling for 2024."
    ),
        "Cadillac": (
        model: "Escalade",
        price: 134.999,
        fuelConsumption: 21.6,
        description: "Cadillac launched the performance version of the Escalade in 2022, called the Escalade-V. The Escalade-V is the largest performance SUV in the American market. It uses a 6.2-liter V8 supercharged engine. With an output of 682 horsepower (509 kW; 691 PS) and a 653 lb⋅ft (885 N⋅m) of torque, it is equipped with a 10-speed automatic transmission, and acceleration from 0 to 60 miles per hour (0 to 97 km/h) takes only 4.4 seconds. The suggested price starts at $149,990. The V will also be offered in the longer wheelbase ESV mod"
    )]
    
    private init() {}
}
