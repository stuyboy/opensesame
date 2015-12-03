//
//  Constants.swift
//  OpenSesame
//
//  Created by Thad Hwang on 8/19/15.
//  Copyright (c) 2015 Thunderchicken Labs, LLC. All rights reserved.
//

/*

*/

import UIKit

// App constants
let IS_DEBUG: Bool = false

let APP_NAME: String = "Open Sesame"
let APP_ID: UInt = 0
let APP_DOMAIN = "com.thunderchickenlabs.opensesame"
let APP_DOWNLOAD_URL: String = "https://itunes.apple.com/us/app/id\(APP_ID)"
let APP_FIRST_OPEN = "AppFirstOpen"
let APP_FIRST_FAVORITE = "AppFirstFavorite"
let APP_LOCATION_PROMPT = "AppLocationPrompt"
let APP_LAST_LOCATION = "AppLastLocation"

let IS_IPHONE = UIDevice.currentDevice().userInterfaceIdiom == .Phone
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)
let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_5_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH <= 568.0
let IS_IPHONE_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0

let IPHONE_4_RATIO: CGFloat = 480.0/480.0
let IPHONE_5_RATIO: CGFloat  = 568.0/480.0
let IPHONE_6_RATIO: CGFloat  = 667.0/480.0
let IPHONE_6P_RATIO: CGFloat  = 736.0/480.0

// Font constants
let FONT_PRIMARY: String = "Raleway-Regular"
let FONT_LIGHT: String = "Raleway-Light"
let FONT_BOLD: String = "Raleway-SemiBold"

let FONTSIZE_XLARGE: CGFloat = IS_IPHONE_4_OR_LESS ? 22.0 : IS_IPHONE_5_OR_LESS ? 24.0 : 26.0
let FONTSIZE_LARGE: CGFloat = IS_IPHONE_4_OR_LESS ? 16.0 : IS_IPHONE_5_OR_LESS ? 18.0 : 20.0
let FONTSIZE_STANDARD: CGFloat = IS_IPHONE_4_OR_LESS ? 15.0 : IS_IPHONE_5_OR_LESS ? 16.0 : 18.0
let FONTSIZE_MEDIUM: CGFloat = IS_IPHONE_4_OR_LESS ? 14.0 : IS_IPHONE_5_OR_LESS ? 14.0 : 16.0
let FONTSIZE_SMALL: CGFloat = IS_IPHONE_4_OR_LESS ? 12.0 : IS_IPHONE_5_OR_LESS ? 12.0 : 14.0
let FONTSIZE_XSMALL: CGFloat = IS_IPHONE_4_OR_LESS ? 9.0 : IS_IPHONE_5_OR_LESS ? 9.0 : 11.0
let FONTSIZE_TINY: CGFloat = IS_IPHONE_4_OR_LESS ? 7.0 : IS_IPHONE_5_OR_LESS ? 7.0 : 8.5

// Color constants
let COLOR_PRIMARY: UInt = 0x2D2D2D
let COLOR_SECONDARY: UInt = 0xFFD166
let COLOR_TERTIARY: UInt = 0xEF476F
let COLOR_GREEN: UInt = 0x559A00 //0x4DBC6B
let COLOR_MINT: UInt = 0x06D6A0
let COLOR_YELLOW: UInt = 0xfcbf00
let COLOR_RED: UInt = 0xEF476F
let COLOR_BLUE: UInt = 0x26547C
let COLOR_LIGHT_BLUE: UInt = 0x387BB8
let COLOR_BRIGHT_BLUE: UInt = 0x0353A4
let COLOR_LIGHT_GRAY: UInt = 0xDDDDDD
let COLOR_MEDIUM_GRAY: UInt = 0x999999
let COLOR_DARK_GRAY: UInt = 0x555555
let COLOR_NEAR_BLACK: UInt = 0x222222
let COLOR_OFF_WHITE: UInt = 0xfafafa
let COLOR_CANCEL: UInt = 0xE1E1E1
let COLOR_OK: UInt = 0xF9F9F9

let OFFSET_XLARGE: CGFloat = 25.0
let OFFSET_LARGE: CGFloat = 20.0
let OFFSET_STANDARD: CGFloat = 15.0
let OFFSET_SMALL: CGFloat = 10.0
let OFFSET_XSMALL: CGFloat = 7.5
let OFFSET_TINY: CGFloat = 5.0
let OFFSET_STATUS_BAR: CGFloat = 15.0

let TRANSITION_TIME_FAST: Double = 0.15
let TRANSITION_TIME_NORMAL: Double = 0.30
let TRANSITION_TIME_SLOW: Double = 0.45
let OFFSCREEN_START_POS: CGFloat = 2000.0

let STATUS_BAR_HEIGHT: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
let DRAWER_WIDTH_RATIO: CGFloat = 0.7
let TOPNAV_BAR_SIZE: CGFloat = 50.0
let SEARCH_BAR_HEIGHT: CGFloat = 48.0
let SEARCH_BAR_OFFSET: CGFloat = 0.0

let LARGE_BUTTON_SIZE: CGFloat = 50.0
let STANDARD_BUTTON_SIZE: CGFloat = 44.0
let STANDARD_TAB_HEIGHT: CGFloat = 48.0
let STANDARD_BUTTON_HEIGHT: CGFloat = 44.0
let STANDARD_BUTTON_WIDTH: CGFloat = 250.0
let TABLE_ROW_HEIGHT: CGFloat = 48.0
