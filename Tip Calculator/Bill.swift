//
//  Bill.swift
//  Tip Calculator
//
//  Created by Dorian Hawkins on 10/29/24.
//
struct Bill {
    var total_cost: Double = 0
    var food_items: [String] = []
    
    func calculateTipPerPerson(dinners: Int, percent: Double) -> Double {
        return (total_cost * percent)/Double(dinners)
    }
}

