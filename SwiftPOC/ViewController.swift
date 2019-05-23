//
//  ViewController.swift
//  SwiftPOC
//
//  Created by Mailyn Sajorda on 23/05/2019.
//  Copyright © 2019 Mailyn Sajorda. All rights reserved.
//

import UIKit
import DACircularProgress
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import GTMAppAuth
import GTMSessionFetcher
import GoogleSignIn
import HCSStarRatingView
import MBCircularProgressBar
import MBProgressHUD
import MKDropdownMenu
import NSData_Base64
import OCMock
import PhoneCountryCodePicker
import TwilioChatClient
import TwilioVideo
import UAAppReviewManager
import UIImage_PDF
import iOS_MagnifyingGlass
import libPhoneNumber_iOS
import InAppSettingsKit
import MMDrawerController

class ViewController: UIViewController {

    @IBOutlet weak var daCircularProgressView: DACircularProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var fbShareButton: FBSDKShareButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DACircularProgress
        daCircularProgressView.progress = 0.25
        daCircularProgressView.progressTintColor = .red
        daCircularProgressView.trackTintColor = .blue
        progressLabel.text = "\(daCircularProgressView.progress * 100)" + "%"
        
        // FBSDKCoreKit
        FBSDKAppEvents.logEvent(FBSDKAppEventNameInitiatedCheckout, valueToSum: 50)
        
        // FBSDKLoginKit
        let loginManager: FBSDKLoginManager = FBSDKLoginManager.init()
        loginManager.logOut()
        
        // FBSDKSharekit
        let content = FBSDKShareLinkContent()
        content.contentURL = URL(string: "google.com")
        content.quote = "Google"
        fbShareButton.shareContent = content
        
        // GTMAppAuth
        let issuer: URL = URL.init(fileURLWithPath:"https://accounts.google.com")
        OIDAuthorizationService.discoverConfiguration(forIssuer: issuer, completion: {
            (configuration, error) in
            
        })
        
        // GTMSessionFetcher
        let urlRequest: URLRequest = URLRequest.init(url: issuer)
        let sessionFetcher = GTMSessionFetcher.init(request: urlRequest)
        print(sessionFetcher.destinationFileURL ?? "")
        
        // Google Analytics
        let gai = GAI.sharedInstance()
        gai?.logger.logLevel = .error
        
        // Google SignIn
        let signIn: GIDSignIn = GIDSignIn.sharedInstance()
        print(signIn.clientID ?? "")
        
        // HCSStarRatingView
        let ratingView = HCSStarRatingView.init()
        ratingView.minimumValue = 1;
        
        // MBCircularProgressBar
        let progressBar = MBCircularProgressBarView.init()
        progressBar.maxValue = 1.0
        
        // MBProgressHUD
        let mbProgressBar = MBProgressHUD.init(view: self.view)
        mbProgressBar.show(animated: true)
        
        // MKDropdownMenu
        let mkDropdownMenu = MKDropdownMenu.init()
        mkDropdownMenu.allowsMultipleRowsSelection = true
        
        // NSData_Base64"
        let data: Data? = "Café".data(using: .utf8)
        print(data?.base64EncodedString() ?? "")
        
        // NewRelic
        NewRelic.recordMetric(withName: "MetricName", category: "MetricCategory")
        
        // OCMock
        let ocmock = OCMockObject.init()
        ocmock?.verify()
        
        // PhoneCountryCodePicker
        let pccpVC = PCCPViewController.init()
        if pccpVC.isUsingChinese {
            print("Chinese")
        }
    
        // TwilioChatClient
        TwilioChatClient.setLogLevel(.debug)
        
        // TwilioVideo
        TwilioVideo.setLogLevel(.all)
        
        // UAAppReviewManager
        UAAppReviewManager.setAppID("12345")
        
        // UIImage_PDF
        let image: UIImage = UIImage.init(pdfNamed: "icon-coin-star.pdf", at: CGSize.init(width: 72, height: 72))
        imageView.setImage(image)
        
        // iOS_MagnifyingGlass
        let magnifyingGlass = ACMagnifyingGlass.init()
        magnifyingGlass.viewToMagnify = progressLabel
        
        // libPhoneNumber_iOS
        let nbPhoneNumber = NBPhoneNumber.init()
        print(nbPhoneNumber.countryCode ?? "")
        
        // InAppSettingsKit
        let slider = IASKSlider.init()
        print(slider.key ?? "")
        
        // MMDrawerController
        let drawer =  MMDrawerController.init()
        drawer.closeDrawer(animated: true, completion: nil)
        
        // WebViewJavascriptBridge
        let jsBridge = WebViewJavascriptBridge.init()
        jsBridge._evaluateJavascript("jsString")
        
        // TTTAttributedLabel
        let attLabel = TTTAttributedLabel.init(frame: CGRect.zero)
        attLabel.setText("test")
        
        // RNCryptor
        let rnCryptor = RNCryptor.init()
        rnCryptor.add(data)
        
        // AudioStreamer
        let audioStreamer = AudioStreamer.init()
        audioStreamer.calculatedBitRate()
        
        // Jwt
        Jwt.base64Encode(withBytes: data)
        
        // OAuthCore
        let url: NSURL = NSURL.init(string: "google.com")!
        print(url.ab_actualPath() ?? "")
    }
}

