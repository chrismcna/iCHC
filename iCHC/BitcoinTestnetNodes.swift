//
//  ChaincoinTestnetNodes.swift
//  SwiftBitcoin
//
//  Created by Yusuke Asai on 2017/08/23.
//  Copyright © 2017年 Yusuke Asai. All rights reserved.
//

import Foundation

public class ChaincoinTestnetNodes {
   
    public static var randomNode: String {
        let random = arc4random() % 2
        return nodes[Int(random)]
    }
    
    
    private static var nodes: [String] {
        return ["chaincoinexplorer.co.uk", "198.245.55.106"]
    }
    
}

