//
//  BudgetModel.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//
//var color: Color = .green
import SwiftUI

struct BudgetModel: Identifiable, Equatable {
    
    
    var id: UUID = UUID()
    var name: String = ""
    var icon: String = ""
    var spendAmount: String = ""
    var totalAmount: String = ""
    var leftAmount: String = ""
    var color: Color = .green
    var perSpend: Double = 0.0
    
    
    init(dict: NSDictionary) {
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.icon = dict.value(forKey: "icon") as? String ?? ""
        self.spendAmount = dict.value(forKey: "spendAmount") as? String ?? ""
        self.totalAmount = dict.value(forKey: "totalAmount") as? String ?? ""
        self.leftAmount = dict.value(forKey: "leftAmount") as? String ?? ""
        self.color = dict.value(forKey: "color") as? Color ?? .green
        self.perSpend = ( (Double(self.leftAmount ) ?? 0) / (Double(self.totalAmount) ?? 1.0) )
    }
    
    static func == (lhs: BudgetModel, rhs: BudgetModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}
