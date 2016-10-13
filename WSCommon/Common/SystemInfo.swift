//
//  SystemInfo.swift
//  HupunErp
//
//  Created by 何文新 on 15/4/20.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import Foundation
import AVFoundation
import Photos
//import "sys/utsname.h"

class SystemInfo {
    
    static func getVersion() -> String {
        let infoDic = Bundle.main.infoDictionary!
        return infoDic["CFBundleShortVersionString"]! as! String
    }
    
    static func getIosVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    static func getPhoneMode() -> String {
        let model = OCCommonFunc.getMachineVersion()
//        print(model)
        return model!
//        return UIDevice.currentDevice().model
    }
    
    static func getUniqueID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    
    static func getSystemInfo() -> [String:String] {
        var infoDic = [String:String]()
        infoDic["appversion"] = getVersion()
        infoDic["device"] = getUniqueID()
        infoDic["model"] = getPhoneMode()
        infoDic["type"] =  "IOS"
        infoDic["version"] = getIosVersion()
        return infoDic
    }
    
    //Privacy
    /// 相机访问权限
    ///
    /// - Returns: <#return value description#>
    static func cameraPrivacy() -> Bool {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            return false
        }
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        return status == .authorized
    }
    
    
    /// 申请相机权限
    ///
    /// - Parameter handle: <#handle description#>
    static func requestCameraPrivacy(handle:@escaping (Bool) -> Void) {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            handle(false)
            return
        }
        if cameraPrivacy() {
            handle(true)
            return
        }
        AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: handle)
    }
    
    
    /// 获取相册权限
    ///
    /// - Returns: <#return value description#>
    static func photoPrivacy() -> Bool {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            return false
        }
        return PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized
    }
    
    
    /// 申请相册权限
    ///
    /// - Parameter handle: <#handle description#>
    static func requestPhotoPrivacy(handle:@escaping (Bool) -> Void) {
        if photoPrivacy() {
            handle(true)
            return
        }
        PHPhotoLibrary.requestAuthorization { (status) in
            handle(status == .authorized)
        }
    }
    

    
}
