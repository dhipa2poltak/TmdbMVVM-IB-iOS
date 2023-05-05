//
//  BaseVM.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation

open class BaseVM: NSObject {

    public let isShowDialogLoading = Box(false)
    public var isLoadingData = false

    public let errorMessage = Box("")
}
