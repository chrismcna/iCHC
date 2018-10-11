//
//  SHA-256.swift
//  CoinCryptography
//
//  Created by Yusuke Asai on 2016/10/09.
//  Copyright © 2016年 Yusuke Asai. All rights reserved.
//

import Foundation

public struct C11 {
    
    public static func toByteArray<T>(_ value: T) -> [UInt8] {
        var value = value
        return withUnsafePointer(to: &value) {
            $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<T>.size) {
                Array(UnsafeBufferPointer(start: $0, count: MemoryLayout<T>.size))
            }
        }
    }
    public static func digest(_ input: NSData) -> NSData {
        let digestLength = 32;
        
        let c11Hash = input.c11();
        let hash = toByteArray(c11Hash).map { $0 };
        
        
        return NSData(bytes: hash, length: digestLength)
    }
    
    public static func hexStringDigest(_ input: String) -> NSData {
        let data = SHA256.dataFromHexString(input)
        return digest(data)
    }
    
    public static func hexStringDigest(_ input: NSData) -> String {
        //return hexStringFromData(digest(input))
        return digest(input).toHexString()
    }
    
    public static func hexStringDigest(_ input: String) -> String {
        let digest: NSData = hexStringDigest(input)
        return digest.toHexString()
    }
    
    
    public static func dataFromHexString(_ input: String) -> NSData {
        /*// Based on: http://stackoverflow.com/a/2505561/313633
         let data = NSMutableData()
         
         var string = ""
         
         for char in input.characters {
         string.append(char)
         if(string.characters.count == 2) {
         let scanner = Scanner(string: string)
         var value: CUnsignedInt = 0
         scanner.scanHexInt32(&value)
         data.append(&value, length: 1)
         string = ""
         }
         
         }
         
         return data as NSData*/
        
        //let hexNum = BigUInt(input, radix: 16)!
        
        //return hexNum.serialize() as NSData
        return input.hexStringToNSData()
    }
    
    /*public static func hexStringFromData(_ input: NSData) -> String {
     let sha256description = input.description as String
     
     // TODO: more elegant way to convert NSData to a hex string
     
     var result: String = ""
     
     for char in sha256description.characters {
     switch char {
     case "0", "1", "2", "3", "4", "5", "6", "7","8","9", "a", "b", "c", "d", "e", "f":
     result.append(char)
     default:
     result += ""
     }
     }
     
     return result
     }*/
}


