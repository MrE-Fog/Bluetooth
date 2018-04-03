//
//  LowEnergyState.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Possible Low Energy States and roles.
public enum LowEnergyState: UInt8, BitMaskOption {
    
    /// Scannable Advertising State
    case scannableAdvertising = 0b01 // 0x0001  // LE_STATE_SCAN_ADV
    
    /// Connectable Advertising State
    case connectableAdvertising = 0b10 // 0x0002  // LE_STATE_CONN_ADV
    
    /// Non-Connectable Advertising State
    case nonConnectableAdvertising = 0b100 // 0x0004 // LE_STATE_NONCONN_ADV
    
    /// High Duty Cycle Directed Advertising State
    case highDutyCycleDirectedAdvertising = 0b1000 // LE_STATE_HIGH_DIRECT_ADV 0x0008
    
    public static let all: Set<LowEnergyState> = [.scannableAdvertising,
                                                  .connectableAdvertising,
                                                  .nonConnectableAdvertising,
                                                  .highDutyCycleDirectedAdvertising]
}

public extension LowEnergyState {
    
    public var name: String {
        
        guard let name = lowEnergyStateNames[self]
            else { fatalError() }
        
        return name
    }
}

extension LowEnergyState: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

/// The states and state combinations that the link layer supports.
public enum LowEnergyStateSet: UInt64 {
    
    case state0 = 0b01
    case state1 = 0b10
    case state2 = 0b100
    case state3 = 0b1000
}

// MARK: - Values

public extension LowEnergyStateSet {
    
    public var states: BitMaskOptionSet<LowEnergyState> {
        
        guard let states = lowEnergyStates[self]
            else { fatalError("Invalid state \(self)") }
        
        return states
    }
}

// MARK: - Private Values

internal let lowEnergyStates: [LowEnergyStateSet: (BitMaskOptionSet<LowEnergyState>)] = [
    
    .state0: ([.nonConnectableAdvertising]),
    .state1: ([.scannableAdvertising]),
    .state2: ([.connectableAdvertising]),
    .state3: ([.highDutyCycleDirectedAdvertising])
]

internal let lowEnergyStateNames: [LowEnergyState: String] = [
    .scannableAdvertising: "Scannable Advertising State",
    .connectableAdvertising: "Connectable Advertising State",
    .nonConnectableAdvertising: "Non-connectable Advertising State",
    .highDutyCycleDirectedAdvertising: "High Duty Cycle Directed Advertising State"
    /*
{  4, "Low Duty Cycle Directed Advertising State"
{  5, "Active Scanning State"
{  6, "Passive Scanning State"
{  7, "Initiating State"
{  8, "Connection State (Master Role)"
{  9, "Connection State (Slave Role)"
{ 10, "Master Role & Master Role"
{ 11, "Slave Role & Slave Role"
{ 12, "Master Role & Slave Role"*/
]
