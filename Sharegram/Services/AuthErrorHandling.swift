//
//  AuthErrorHandling.swift
//  Sharegram
//
//  Created by Lucas Hubert on 08/02/24.
//

import Foundation

enum AuthErrorHandling: Int {
    case invalidCustomToken = 17000
    case customTokenMismatch = 17002
    case invalidCredential = 17004
    case userDisabled = 17005
    case operationNotAllowed = 17006
    case emailAlreadyInUse = 17007
    case invalidEmail = 17008
    case wrongPassword = 17009
    case tooManyRequests = 17010
    case userNotFound = 17011
    case accountExistsWithDifferentCredential = 17012
    case requiresRecentLogin = 17014
    case providerAlreadyLinked = 17015
    case noSuchProvider = 17016
    case invalidUserToken = 17017
    case networkError = 17020
    case userTokenExpired = 17021
    case invalidAPIKey = 17023
    case userMismatch = 17024
    case credentialAlreadyInUse = 17025
    case weakPassword = 17026
    case appNotAuthorized = 17028
    case expiredActionCode = 17029
    case invalidActionCode = 17030
    case invalidMessagePayload = 17031
    case invalidSender = 17032
    case invalidRecipientEmail = 17033
    case missingEmail = 17034
    case missingIosBundleID = 17036
    case missingAndroidPackageName = 17037
    case unauthorizedDomain = 17038
    case invalidContinueURI = 17039
    case missingContinueURI = 17040
    case missingPhoneNumber = 17041
    case invalidPhoneNumber = 17042
    case missingVerificationCode = 17043
    case invalidVerificationCode = 17044
    case missingVerificationID = 17045
    case invalidVerificationID = 17046
    case missingAppCredential = 17047
    case invalidAppCredential = 17048
    case sessionExpired = 17051
    case quotaExceeded = 17052
    case missingAppToken = 17053
    case notificationNotForwarded = 17054
    case appNotVerified = 17055
    case captchaCheckFailed = 17056
    case webContextAlreadyPresented = 17057
    case webContextCancelled = 17058
    case appVerificationUserInteractionFailure = 17059
    case invalidClientID = 17060
    case webNetworkRequestFailed = 17061
    case webInternalError = 17062
    case webSignInUserInteractionFailure = 17063
    case localPlayerNotAuthenticated = 17066
    case nullUser = 17067
    case dynamicLinkNotActivated = 17068
    case invalidProviderID = 17071
    case tenantIDMismatch = 17072
    case unsupportedTenantOperation = 17073
    case invalidDynamicLinkDomain = 17074
    case rejectedCredential = 17075
    case gameKitNotLinked = 17076
    case secondFactorRequired = 17078
    case missingMultiFactorSession = 17081
    case missingMultiFactorInfo = 17082
    case invalidMultiFactorSession = 17083
    case multiFactorInfoNotFound = 17084
    case adminRestrictedOperation = 17085
    case unverifiedEmail = 17086
    case secondFactorAlreadyEnrolled = 17087
    case maximumSecondFactorCountExceeded = 17088
    case unsupportedFirstFactor = 17089
    case emailChangeNeedsVerification = 17090
    case missingClientIdentifier = 17093
    case missingOrInvalidNonce = 17094
    case blockingCloudFunctionError = 17105
    case recaptchaNotEnabled = 17200
    case missingRecaptchaToken = 17201
    case invalidRecaptchaToken = 17202
    case invalidRecaptchaAction = 17203
    case missingClientType = 17204
    case missingRecaptchaVersion = 17205
    case invalidRecaptchaVersion = 17206
    case invalidReqType = 17207
    case recaptchaSDKNotLinked = 17208
    case keychainError = 17995
    case internalError = 17999
    case malformedJWT = 18000
    
    init?(errorCode: Int) {
        guard let errorCase = AuthErrorHandling(rawValue: errorCode) else {
            return nil
        }
        self = errorCase
    }
    
    func errorMessage() -> String {
            switch self {
            case .invalidCustomToken:
                return "Invalid custom token."
            case .customTokenMismatch:
                return "Custom token mismatch."
            case .invalidCredential:
                return "Invalid credential."
            case .userDisabled:
                return "User account has been disabled."
            case .operationNotAllowed:
                return "Operation not allowed."
            case .emailAlreadyInUse:
                return "Email is already in use."
            case .invalidEmail:
                return "Invalid email."
            case .wrongPassword:
                return "Invalid password."
            case .tooManyRequests:
                return "Too many requests. Try again later."
            case .userNotFound:
                return "User not found."
            case .accountExistsWithDifferentCredential:
                return "Account exists with different credentials."
            case .requiresRecentLogin:
                return "Action requires recent login."
            case .providerAlreadyLinked:
                return "Provider is already linked to another account."
            case .noSuchProvider:
                return "No such provider."
            case .invalidUserToken:
                return "Invalid user token."
            case .networkError:
                return "Network error occurred."
            case .userTokenExpired:
                return "User token has expired."
            case .invalidAPIKey:
                return "Invalid API key."
            case .userMismatch:
                return "User mismatch."
            case .credentialAlreadyInUse:
                return "Credential is already in use."
            case .weakPassword:
                return "Weak password."
            case .appNotAuthorized:
                return "App is not authorized."
            case .expiredActionCode:
                return "Expired action code."
            case .invalidActionCode:
                return "Invalid action code."
            case .invalidMessagePayload:
                return "Invalid message payload."
            case .invalidSender:
                return "Invalid sender."
            case .invalidRecipientEmail:
                return "Invalid recipient email."
            case .missingEmail:
                return "Missing email."
            case .missingIosBundleID:
                return "Missing iOS bundle ID."
            case .missingAndroidPackageName:
                return "Missing Android package name."
            case .unauthorizedDomain:
                return "Unauthorized domain."
            case .invalidContinueURI:
                return "Invalid continue URI."
            case .missingContinueURI:
                return "Missing continue URI."
            case .missingPhoneNumber:
                return "Missing phone number."
            case .invalidPhoneNumber:
                return "Invalid phone number."
            case .missingVerificationCode:
                return "Missing verification code."
            case .invalidVerificationCode:
                return "Invalid verification code."
            case .missingVerificationID:
                return "Missing verification ID."
            case .invalidVerificationID:
                return "Invalid verification ID."
            case .missingAppCredential:
                return "Missing app credential."
            case .invalidAppCredential:
                return "Invalid app credential."
            case .sessionExpired:
                return "Session expired."
            case .quotaExceeded:
                return "Quota exceeded."
            case .missingAppToken:
                return "Missing app token."
            case .notificationNotForwarded:
                return "Notification not forwarded."
            case .appNotVerified:
                return "App not verified."
            case .captchaCheckFailed:
                return "Captcha check failed."
            case .webContextAlreadyPresented:
                return "Web context already presented."
            case .webContextCancelled:
                return "Web context cancelled."
            case .appVerificationUserInteractionFailure:
                return "App verification user interaction failure."
            case .invalidClientID:
                return "Invalid client ID."
            case .webNetworkRequestFailed:
                return "Web network request failed."
            case .webInternalError:
                return "Web internal error."
            case .webSignInUserInteractionFailure:
                return "Web sign-in user interaction failure."
            case .localPlayerNotAuthenticated:
                return "Local player not authenticated."
            case .nullUser:
                return "Null user."
            case .dynamicLinkNotActivated:
                return "Dynamic link not activated."
            case .invalidProviderID:
                return "Invalid provider ID."
            case .tenantIDMismatch:
                return "Tenant ID mismatch."
            case .unsupportedTenantOperation:
                return "Unsupported tenant operation."
            case .invalidDynamicLinkDomain:
                return "Invalid dynamic link domain."
            case .rejectedCredential:
                return "Rejected credential."
            case .gameKitNotLinked:
                return "GameKit not linked."
            case .secondFactorRequired:
                return "Second factor required."
            case .missingMultiFactorSession:
                return "Missing multi-factor session."
            case .missingMultiFactorInfo:
                return "Missing multi-factor info."
            case .invalidMultiFactorSession:
                return "Invalid multi-factor session."
            case .multiFactorInfoNotFound:
                return "Multi-factor info not found."
            case .adminRestrictedOperation:
                return "Admin restricted operation."
            case .unverifiedEmail:
                return "Unverified email."
            case .secondFactorAlreadyEnrolled:
                return "Second factor already enrolled."
            case .maximumSecondFactorCountExceeded:
                return "Maximum second factor count exceeded."
            case .unsupportedFirstFactor:
                return "Unsupported first factor."
            case .emailChangeNeedsVerification:
                return "Email change needs verification."
            case .missingClientIdentifier:
                return "Missing client identifier."
            case .missingOrInvalidNonce:
                return "Missing or invalid nonce."
            case .blockingCloudFunctionError:
                return "Blocking cloud function error."
            case .recaptchaNotEnabled:
                return "ReCAPTCHA not enabled."
            case .missingRecaptchaToken:
                return "Missing ReCAPTCHA token."
            case .invalidRecaptchaToken:
                return "Invalid ReCAPTCHA token."
            case .invalidRecaptchaAction:
                return "Invalid ReCAPTCHA action."
            case .missingClientType:
                return "Missing client type."
            case .missingRecaptchaVersion:
                return "Missing ReCAPTCHA version."
            case .invalidRecaptchaVersion:
                return "Invalid ReCAPTCHA version."
            case .invalidReqType:
                return "Invalid request type."
            case .recaptchaSDKNotLinked:
                return "ReCAPTCHA SDK not linked."
            case .keychainError:
                return "Keychain error."
            case .internalError:
                return "Internal error."
            case .malformedJWT:
                return "Malformed JWT."
            }
        }
}
