//
//  ChaincoinTestnet.swift
//  TCPClientTest
//
//  Created by Yusuke Asai on 2016/12/08.
//  Copyright © 2016年 Yusuke Asai. All rights reserved.
//

import Foundation

public class Chaincoin: CoinKey {
    public init() {
        super.init(privateKeyPrefix: 0x3c, publicKeyPrefix: 0x1c)
    }
    
    public init(privateKeyHex: String) {
        super.init(privateKeyHex: privateKeyHex, privateKeyPrefix: 0x3c, publicKeyPrefix: 0x1c, skipPublicKeyGeneration: false, isCompressedPublicKeyAddress: true)
    }
    
    public init(privateKeyHex: String, publicKeyHex: String) {
        super.init(privateKeyHex: privateKeyHex, publicKeyHex: publicKeyHex, privateKeyPrefix: 0x3c, publicKeyPrefix: 0x1c, isCompressedPublicKeyAddress: true)
    }
    
    public init?(wif: String) {
        
        let wif_candidate = Wif(privateKeyPrefix: 0x3c)
        if wif_candidate.importWif(wif) {
            super.init(privateKeyHex: wif_candidate.privateKeyHexString, privateKeyPrefix: 0x3c, publicKeyPrefix: 0x1c, skipPublicKeyGeneration: false, isCompressedPublicKeyAddress: wif_candidate.isCompressedPublicKey)
            
        } else {
            return nil
        }
    }
}
