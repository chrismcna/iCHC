//
//  NetworkMagicBytes.swift
//  TCPClientTest
//
//  Created by Yusuke Asai on 2016/10/23.
//  Copyright © 2016年 Yusuke Asai. All rights reserved.
//

import Foundation

public class NetworkMagicBytes {
    //static let isMainNet = false
    
    public static func magicBytes() -> [UInt8] {
        if isChaincoinMainNet {
            return [0xa3, 0xd2, 0x7a, 0x03]
        } else {
            return [0xfb, 0xc2, 0x11, 0x02]
        }
    }
    
    static let checksumNum = 4
}
