//
//  STResultsView.swift
//  StroopHello
//
//  Created by Richard Sprague on 7/9/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI




struct STResultsView: View {
    @EnvironmentObject var userData: STData
    
    var body: some View {
  
        VStack{
            Text("This is the Results View")
                .font(.title)
            
            List(userData.results, id:\.date){result in
                
                HStack{
                    Text("Score:" + String(result.score))
                    .padding()
                    Text(result.date.description)
                }
                
            }

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
        STResultsView()
    }
}
