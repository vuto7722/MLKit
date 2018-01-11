//
//  EventsBus.swift
//  MX3Hydration
//
//  Created by Anh Vu on 11/16/17.
//  Copyright © 2017 MX3 Diagnostics. All rights reserved.
//

import Foundation

struct Events {
    struct GoToMeasure: BusEvent {}
    struct GoToHome: BusEvent {}
    // Manage Athlete
    struct AddAthlete: BusEvent {}
    struct ShowEmptyAthlete: BusEvent {}
    struct ShowEditPlayer: BusEvent {
        let playerId: String
    }
}
