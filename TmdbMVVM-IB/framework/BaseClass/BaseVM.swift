//
//  BaseVM.swift
//  TmdbMVVM-IB
//
//  Created by user on 01/03/23.
//

import Foundation

class BaseVM: NSObject {

    let isShowDialogLoading = Box(false)
    var isLoadingData = false

    let toastMessage = Box("")
}
