//
//  STResultsView.swift
//  StroopHello
//
//  Created by Richard Sprague on 7/9/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI




struct STResultsView: View {
   // @EnvironmentObject var userData: STData
    
    @FetchRequest(
       // 2.
       entity: StroopData.entity(),
       // 3.
       sortDescriptors: [
        NSSortDescriptor(keyPath: \StroopData.date, ascending: true)
       ]
       //,predicate: NSPredicate(format: "genre contains 'Action'")
       // 4.
     ) var allData: FetchedResults<StroopData>


    
    var body: some View {
        
        VStack{
            Text("Results")
                .font(.title)
            HStack{
                Text("Score").padding()
                Text("Date").padding()
                Text("Duration").padding()
            }
            
            // List(userData.results, id:\.date){result in
            List(allData, id:\.date){result in
                
                HStack{
                    Text("Score:" + String(result.score))
                    .padding()
                   
                    //Text(result.date.description)
                    Text(String(result.date?.description ?? "no value" ))
                }
                
            }
            Text("end results view")

//            Text("Score:" + String(userData.latestResult().score))
//            .padding()
//
//            Text("Duration:" + userData.date.description)
//            .padding()
//
//        Text("Duration:" + String(userData.duration))
    }
    }
}

struct STResultsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return STResultsView().environment(\.managedObjectContext, context)
    }
}
