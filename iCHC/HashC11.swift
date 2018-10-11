//
//  Hash256+160.swift
//  TCPClientTest
//
//  Created by Yusuke Asai on 2016/11/29.
//  Copyright © 2016年 Yusuke Asai. All rights reserved.
//

import Foundation

public struct HashC11 {
    public static func digest(_ input: NSData) -> NSData {
        
        let data = C11.digest(input)
        return data
    }
    
    public static func hexStringDigest(_ hexStr: String) -> NSData {
        let data: NSData = C11.digest(SHA256.hexStringDigest(hexStr))
        return data
    }
    
    public static func digestHexString(_ input: NSData) -> String {
        return digest(input).toHexString()
    }
    
    public static func hexStringDigestHexString(_ hexStr: String) -> String {
        return hexStringDigest(hexStr).toHexString()
    }
    
}
