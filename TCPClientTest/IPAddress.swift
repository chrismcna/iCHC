//
//  IPAddress.swift
//  TCPClientTest
//
//  Created by Yusuke Asai on 2016/10/28.
//  Copyright © 2016年 Yusuke Asai. All rights reserved.
//

import Foundation

public enum IPAddress {
    case IPV4(UInt32)
    case IPV6(UInt32, UInt32, UInt32, UInt32)
}

extension IPAddress {
    public var bitcoinData: NSData {
        let data = NSMutableData()
        
        switch self {
        case let .IPV4(word):
            data.appendUInt32(0, endianness: .BigEndian)
            data.appendUInt32(0, endianness: .BigEndian)
            data.appendUInt32(0xffff, endianness: .BigEndian)
            data.appendUInt32(word, endianness: .BigEndian)
        case let .IPV6(word0, word1, word2, word3):
            data.appendUInt32(word0, endianness: .BigEndian)
            data.appendUInt32(word1, endianness: .BigEndian)
            data.appendUInt32(word2, endianness: .BigEndian)
            data.appendUInt32(word3, endianness: .BigEndian)
        }
        
        return data
    }
    
    public static func fromBitcoinStream(_ stream: InputStream) -> IPAddress? {
     
        let word0 = stream.readUInt32(.BigEndian)
        if word0 == nil {
            print("Failed to parse word0 from IPAddress")
            return nil
        }
        
        let word1 = stream.readUInt32(.BigEndian)
        if word1 == nil {
            print("Failed to parse word1 from IPAddress")
            return nil
        }
        
        let word2 = stream.readUInt32(.BigEndian)
        if word2 == nil {
            print("Failed to parse word2 from IPAddress")
            return nil
        }
        
        let word3 = stream.readUInt32(.BigEndian)
        if word3 == nil {
            print("Failed to parse word3 from IPAddress")
            return nil
        }
        
        if word0! == 0 && word1! == 0 && word2! == 0xffff {
            return IPAddress.IPV4(word3!)
        }
        return IPAddress.IPV6(word0!, word1!, word2!, word3!)
    }
}