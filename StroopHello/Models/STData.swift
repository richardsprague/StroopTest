//
//  STData.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/30/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI
import Combine

struct sessionData: Identifiable{
    var id = UUID()
    var score: Int
    var date: Date
    var duration: Double
    
    init(score:Int, date:Date, duration:Double){
        self.score = score
        self.date = date
        self.duration = duration
        self.id = UUID()
    }
}

final class STData: ObservableObject  {
    @Published var score = 0
    @Published var date = Date()
    var duration: Double = 0.0
    
    var results: [sessionData] = []
    
    func addResult(result:sessionData){
        results.append(result)
    }
    
    func addResult(){
        results.append(sessionData(score: self.score, date: self.date, duration: self.duration))
    }
    
    func latestResult() -> sessionData {
        return(self.results.last ?? sessionData(score: -1, date: Date(), duration: 0))
    }
}
