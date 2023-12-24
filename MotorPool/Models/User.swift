//
//  User.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/21/23.
//

//let dataStore = DataStore.shared

struct User {
    let username: String
    let password: String
    
    let autos: [Auto]

    static func getUser() -> User {
        let dataStore = DataStore.shared
        
        return User(
            username: dataStore.username,
            password: dataStore.password,
            autos: Auto.getCars()
        )
    }
}

struct Auto {
    let autoName: String
    let price: Double
    let description: String
    let fuelConsumption: Double
    
    static func getCars() -> [Auto] {
        var cars: [Auto] = []
        let dataStore = DataStore.shared
        
        for (brand, values) in dataStore.cars {
            cars.append(
                Auto(
                    autoName: brand,
                    price: values.price,
                    description: values.description,
                    fuelConsumption: values.fuelConsumption
                )
            )
        }
        return cars
    }
    
//    static func getAutos() -> [Auto] {
//        var autos: [Auto] = []
//        let dataStore = DataStore.shared
//        
//        let names = dataStore.autoNames
//        let prices = dataStore.prices
//        let descriptions = dataStore.descriptions
//        let fuelConsumptions = dataStore.fuelConsumption
//        
//        let iterationCount = min(
//            names.count,
//            prices.count,
//            descriptions.count,
//            fuelConsumptions.count
//        )
//        
//        for index in 0..<iterationCount {
//            let auto = Auto(
//                autoName: names[index],
//                price: prices[index],
//                description: descriptions[index],
//                fuelConsumption: fuelConsumptions[index]
//            )
//            
//            autos.append(auto)
//        }
//        
//        return autos
//    }
}
