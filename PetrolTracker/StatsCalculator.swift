//
//  StatsCalculator.swift
//  PetrolTracker
//
//  Created by Ben Wheeler on 6/4/2023.
//

import Foundation
import SwiftUI
import CoreData

func avgDistance(sessions: FetchedResults<Log>) -> Double
{
    var averageDistance: Double = 0
    if(sessions.count != 0)
    {
        for session in sessions
        {
            averageDistance += session.distance
        }
        averageDistance /= Double(sessions.count)
    }
    return averageDistance
}

func avgFuel(sessions: FetchedResults<Log>) -> Double
{
    var averageFuel: Double = 0
    if(sessions.count != 0)
    {
        for session in sessions
        {
            averageFuel += session.fuel
        }
        averageFuel /= Double(sessions.count)
    }
    return averageFuel
}

func avgEfficiency(sessions: FetchedResults<Log>) -> Double
{
    var averageEfficiency: Double = 0
    if(sessions.count != 0)
    {
        for session in sessions
        {
            averageEfficiency += session.efficiency
        }
        averageEfficiency /= Double(sessions.count)
    }
    return averageEfficiency
}
