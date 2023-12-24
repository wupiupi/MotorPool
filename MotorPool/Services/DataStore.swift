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
        "Tesla": (
        model: "Model S",
        price: 52.124,
        fuelConsumption: 20,
        description: "The Tesla Model S is an all-electric car manufactured by Tesla, Inc. It was introduced in 2008 and became one of the first mass-produced electric vehicles on the market. The Model S has several modifications, including Long Range, Performance and P100D, which differ in power reserve, maximum speed and power."
    )]
    
    private init() {}
}
