//
//  PrivacyRequestManager.swift
//  
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import AVFoundation

public protocol PrivacyRequestManagerInterface: AnyObject {
    var isCameraPermissionGranted: Bool { get }
    func requestCameraPermission(completionHandler: @escaping (Bool) -> Void)
}

public class PrivacyRequestManager: PrivacyRequestManagerInterface {

    public init() { }

    public var isCameraPermissionGranted: Bool {
        #if os(tvOS)
        guard #available(tvOS 17.0, *) else {
            return false
        }
        #endif
        return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    }

    public func requestCameraPermission(completionHandler: @escaping (Bool) -> Void) {
        #if os(tvOS)
        guard #available(tvOS 17.0, *) else {
            DispatchQueue.main.async {
                completionHandler(false)
            }
            return
        }
        #endif
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                completionHandler(granted)
            }
        }
    }
}
