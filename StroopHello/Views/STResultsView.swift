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

        Text("Score:" + String(self.userData.score))
            .padding()
    }
    }
}

struct STResultsView_Previews: PreviewProvider {
    static var previews: some View {
        STResultsView()
    }
}
