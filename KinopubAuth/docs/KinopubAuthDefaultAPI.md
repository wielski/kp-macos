# KinopubAuthDefaultAPI

All URIs are relative to *https://api.service-kp.com/oauth2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAccessToken**](KinopubAuthDefaultAPI.md#getaccesstoken) | **POST** /device? | 
[**getDeviceCode**](KinopubAuthDefaultAPI.md#getdevicecode) | **POST** /device | 
[**refreshAccessToken**](KinopubAuthDefaultAPI.md#refreshaccesstoken) | **POST** /device?? | 


# **getAccessToken**
```swift
    open class func getAccessToken(getAccessToken: GetAccessToken? = nil, completion: @escaping (_ data: AuthAccessToken?, _ error: Error?) -> Void)
```



OAuth Device Authentication Flow

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubAuth

let getAccessToken = GetAccessToken(grantType: "grantType_example", code: "code_example", clientId: "clientId_example", clientSecret: "clientSecret_example") // GetAccessToken |  (optional)

KinopubAuthDefaultAPI.getAccessToken(getAccessToken: getAccessToken) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **getAccessToken** | [**GetAccessToken**](GetAccessToken.md) |  | [optional] 

### Return type

[**AuthAccessToken**](AuthAccessToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceCode**
```swift
    open class func getDeviceCode(getDeviceCode: GetDeviceCode? = nil, completion: @escaping (_ data: AuthDeviceCode?, _ error: Error?) -> Void)
```



OAuth Device Authentication Flow

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubAuth

let getDeviceCode = GetDeviceCode(grantType: "grantType_example", clientId: "clientId_example", clientSecret: "clientSecret_example") // GetDeviceCode |  (optional)

KinopubAuthDefaultAPI.getDeviceCode(getDeviceCode: getDeviceCode) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **getDeviceCode** | [**GetDeviceCode**](GetDeviceCode.md) |  | [optional] 

### Return type

[**AuthDeviceCode**](AuthDeviceCode.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshAccessToken**
```swift
    open class func refreshAccessToken(refreshAccessToken: RefreshAccessToken? = nil, completion: @escaping (_ data: AuthAccessToken?, _ error: Error?) -> Void)
```



OAuth Device Authentication Flow

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubAuth

let refreshAccessToken = RefreshAccessToken(grantType: "grantType_example", refreshToken: "refreshToken_example", clientId: "clientId_example", clientSecret: "clientSecret_example") // RefreshAccessToken |  (optional)

KinopubAuthDefaultAPI.refreshAccessToken(refreshAccessToken: refreshAccessToken) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshAccessToken** | [**RefreshAccessToken**](RefreshAccessToken.md) |  | [optional] 

### Return type

[**AuthAccessToken**](AuthAccessToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

