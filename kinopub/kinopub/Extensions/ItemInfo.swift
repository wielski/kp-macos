//
//  ItemInfo.swift
//  kinopub
//
//  Created by Andrzej Wielski on 07.01.2023.
//

import KinopubApi

extension ItemInfo {
    public func isSerial() -> Bool {
        if let type = self.type {
            return type == ModelType.serial || type == ModelType.docuserial || type == ModelType.tvshow
        }
        return false
    }
}
