//
//  ImagePickerProtocol.swift
//  HupunErpPad
//
//  Created by 何文新 on 2016/10/12.
//  Copyright © 2016年 Hupun. All rights reserved.
//

import UIKit

protocol ImagePickerProtocol {
    func pickerImage<VC:UIViewController>(isCamera:Bool,  vct:VC, from rect:CGRect) where VC: UIImagePickerControllerDelegate, VC: UINavigationControllerDelegate
}

extension ImagePickerProtocol {
    
    func pickerImage<VC:UIViewController>(isCamera:Bool,  vct:VC, from rect:CGRect) where VC: UIImagePickerControllerDelegate, VC: UINavigationControllerDelegate {
        func selectPhoto(isCamera:Bool) {
            let imageVC = UIImagePickerController()
            imageVC.delegate = vct
            imageVC.allowsEditing = true
            
            imageVC.sourceType = isCamera ? .camera : .photoLibrary
            if isCamera {
                imageVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                vct.view.window?.rootViewController?.present(imageVC, animated: true, completion: nil)
            } else {
              let  popVc = UIPopoverController(contentViewController: imageVC)
                popVc.setContentSize(vct.view.bounds.size, animated: true)
                popVc.present(from: rect, in: vct.view, permittedArrowDirections: UIPopoverArrowDirection.up, animated: true)
            }
        }
        
        if isCamera {
            SystemInfo.requestCameraPrivacy() {
                result in
                if result {
                    selectPhoto(isCamera: true)
                }
            }
        } else {
            SystemInfo.requestPhotoPrivacy() {
                result in
                if result {
                    selectPhoto(isCamera: false)
                }
            }
        }
    }
}


