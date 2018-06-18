//
//  ChaincoinPrefixes.swift
//  SwiftBitcoin
//
//  Created by Yusuke Asai on 2017/07/28.
//  Copyright © 2017年 Yusuke Asai. All rights reserved.
//

import Foundation

public class ChaincoinPrefixes {
    
    public static var privatePrefix: UInt8 {
        if isChaincoinMainNet {
            return 0x9c
        } else {
            return 0xd8
        }
    }
    
    public static var pubKeyPrefix: UInt8 {
        if isChaincoinMainNet {
            return 0x1c
        } else {
            return 0x50
        }
    }
    
    public static var scriptHashPrefix: UInt8 {
        if isChaincoinMainNet {
            return 0x04
        } else {
            return 0x2c
        }
    }
    
}
