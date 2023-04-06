//
//  StatsCalculator.swift
//  PetrolTracker
//
//  Created by Ben Wheeler on 6/4/2023.
//

import Foundation
import SwiftUI
import CoreData

func avgDistance(logs: FetchedResults<Log>) -> Double
{
    var averageDistance: Double = 0
    if(logs.count != 0)
    {
        for session in logs
        {
            averageDistance += session.distance
        }
        averageDistance /= Double(logs.count)
    }
    return averageDistance
}

func avgFuel(logs: FetchedResults<Log>) -> Double
{
    var averageFuel: Double = 0
    if(logs.count != 0)
    {
        for session in logs
        {
            averageFuel += session.fuel
        }
        averageFuel /= Double(logs.count)
    }
    return averageFuel
}

func avgEfficiency(logs: FetchedResults<Log>) -> Double
{
    var averageEfficiency: Double = 0
    if(logs.count != 0)
    {
        for session in logs
        {
            averageEfficiency += session.efficiency
        }
        averageEfficiency /= Double(logs.count)
    }
    return averageEfficiency
}
