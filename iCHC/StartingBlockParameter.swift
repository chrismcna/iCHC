//
//  StartingBlockParameter.swift
//  SwiftBitcoin
//
//  Created by Yusuke Asai on 2017/08/10.
//  Copyright © 2017年 Yusuke Asai. All rights reserved.
//

import Foundation

let startingBlockHash: String = "00000000004bc0fd059489843c0175492ad78cc1804bf74f45acb11582c2c43f"
let startingBlockHeight: Int = 1629244


//let startingBlockHash: String = "00000040c13caa821b7425462a64a7ae8cc7edfd0d802ddf065416c9705ef15f"
//let startingBlockHeight: Int = 10000

//let startingBlockHash: String = "00000000003d04da709df109de75aeff13ff2156f280dd5b20a05d5a7457ed69"
//let startingBlockHeight: Int = 1242085

//let startingBlockHash: String = "000000003d6e2baae124ab7275f76d322d87fec31ab70e3aab54b6102bdd5641"
//let startingBlockHeight: Int = 1209840

//let startingBlockHash: String = "00000000e8ec362c3cca17ed6f7c3bd52f9c905a9a72a10c6e8299cf0736694d"
//let startingBlockHeight: Int = 1156484

var latestBlockHash: String {
    let blockChainInfo = BlockChainInfo.loadItem()!
    return blockChainInfo.lastBlockHash
}

var latestBlockHeight: Int {
    let blockChainInfo = BlockChainInfo.loadItem()!
    return blockChainInfo.lastBlockHeight
}


var firstCreatedBlock: SHA256Hash {
    
    if isChaincoinMainNet {
        return SHA256Hash("00000f639db5734b2b861ef8dbccc33aebd7de44d13de000a12d093bcc866c64".hexStringToNSData())
    } else {
        return SHA256Hash("0000082f5939c2154dbcba35f784530d12e9d72472fcfaf29674ea312cdf4c83".hexStringToNSData())
    }

}
