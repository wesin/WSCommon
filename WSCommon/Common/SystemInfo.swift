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

open class SystemInfo {
    
    open static func getVersion() -> String {
        let infoDic = Bundle.main.infoDictionary!
        return infoDic["CFBundleShortVersionString"]! as! String
    }
    
    open static func getIosVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    open static func getUniqueID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    //Privacy
    /// 相机访问权限
    ///
    /// - Returns: <#return value description#>
    open static func cameraPrivacy() -> Bool {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            return false
        }
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        return status == .authorized
    }
    
    
    /// 申请相机权限
    ///
    /// - Parameter handle: <#handle description#>
    open static func requestCameraPrivacy(handle:@escaping (Bool) -> Void) {
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
    open static func photoPrivacy() -> Bool {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            return false
        }
        return PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized
    }
    
    
    /// 申请相册权限
    ///
    /// - Parameter handle: <#handle description#>
    open static func requestPhotoPrivacy(handle:@escaping (Bool) -> Void) {
        if photoPrivacy() {
            handle(true)
            return
        }
        PHPhotoLibrary.requestAuthorization { (status) in
            handle(status == .authorized)
        }
    }
    

    
}
