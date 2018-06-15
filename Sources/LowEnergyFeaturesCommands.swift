//
//  LowEnergyFeaturesCommands.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Read Transmit Power Command
    ///
    /// The command is used to read the minimum and maximum transmit powers supported by the Controller.ReadTransmitPowerReturnParameter
    func lowEnergyReadTransmitPower(timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.ReadTransmitPowerReturnParameter {
        
        return try deviceRequest(HCILowEnergyCommand.ReadTransmitPowerReturnParameter.self, timeout: timeout)
    }
    
    /// LE Read RF Path Compensation Command
    ///
    /// The command is used to read the RF Path Compensation Values parameter used in the Tx Power Level and RSSI calculation.
    func lowEnergyReadRfPathCompensation(timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.ReadRfPathCompensationReturnParameter {
        
        return try deviceRequest(HCILowEnergyCommand.ReadRfPathCompensationReturnParameter.self, timeout: timeout)
    }
    
}
