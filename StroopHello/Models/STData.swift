//
//  STData.swift
//  StroopHello
//
//  Created by Richard Sprague on 6/30/20.
//  Copyright © 2020 Richard Sprague. All rights reserved.
//

import SwiftUI
import Combine

final class STData: ObservableObject  {
    @Published var score = 0
    @Published var date = Date()

}
