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
            autos: Auto.getAutos()
        )
    }
}

struct Auto {
    let brand: String
    let model: String
    let price: Double
    let description: String
    let fuelConsumption: Double
    
    static func getAutos() -> [Auto] {
        var cars: [Auto] = []
        let dataStore = DataStore.shared
        
        for (brand, values) in dataStore.cars {
            cars.append(
                Auto(
                    brand: brand,
                    model: values.model,
                    price: values.price,
                    description: values.description,
                    fuelConsumption: values.fuelConsumption
                )
            )
        }
        return cars
    }
}
