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
            
//            List(self.userData.results, id: \.self){result in Text(result.score)
//            }

            Text("Score:" + String(self.userData.latestResult().score))
            .padding()

            Text("Duration:" + self.userData.date.description)
            .padding()
            
        Text("Duration:" + String(self.userData.duration))
    }
    }
}

struct STResultsView_Previews: PreviewProvider {
    static var previews: some View {
        STResultsView()
    }
}
