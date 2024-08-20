//
//  main.swift
//  StudySwift
//
//  Created by nylah.j on 2022/02/15.
//

import Foundation
import Combine

//[["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
//[["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]

TripPath().solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])
TripPath().solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])
