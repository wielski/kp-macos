# KinopubDefaultAPI

All URIs are relative to *https://api.service-kp.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addItemToBookmarkFolder**](KinopubDefaultAPI.md#additemtobookmarkfolder) | **POST** /bookmarks/add | 
[**addTimeMark**](KinopubDefaultAPI.md#addtimemark) | **GET** /watching/marktime | 
[**clearHistoryForItem**](KinopubDefaultAPI.md#clearhistoryforitem) | **POST** /history/clear-for-item | 
[**clearHistoryForMedia**](KinopubDefaultAPI.md#clearhistoryformedia) | **POST** /history/clear-for-media | 
[**clearHistoryForSeason**](KinopubDefaultAPI.md#clearhistoryforseason) | **POST** /history/clear-for-season | 
[**createBookmarkFolder**](KinopubDefaultAPI.md#createbookmarkfolder) | **POST** /bookmarks/create | 
[**getBookmarkFolders**](KinopubDefaultAPI.md#getbookmarkfolders) | **GET** /bookmarks | 
[**getBookmarkFoldersByItem**](KinopubDefaultAPI.md#getbookmarkfoldersbyitem) | **GET** /bookmarks/get-item-folders | 
[**getBookmarkItems**](KinopubDefaultAPI.md#getbookmarkitems) | **GET** /bookmarks/{id} | 
[**getCollection**](KinopubDefaultAPI.md#getcollection) | **GET** /collections/view | 
[**getCollectionList**](KinopubDefaultAPI.md#getcollectionlist) | **GET** /collections | 
[**getContentTypes**](KinopubDefaultAPI.md#getcontenttypes) | **GET** /types | 
[**getCountries**](KinopubDefaultAPI.md#getcountries) | **GET** /countries | 
[**getCurrentDevice**](KinopubDefaultAPI.md#getcurrentdevice) | **GET** /device/current | 
[**getCurrentUser**](KinopubDefaultAPI.md#getcurrentuser) | **GET** /user | 
[**getDeviceById**](KinopubDefaultAPI.md#getdevicebyid) | **GET** /device/{id} | 
[**getDeviceSettings**](KinopubDefaultAPI.md#getdevicesettings) | **GET** /device/{id}/settings | 
[**getDevicesList**](KinopubDefaultAPI.md#getdeviceslist) | **GET** /device | 
[**getFreshItems**](KinopubDefaultAPI.md#getfreshitems) | **GET** /items/fresh | 
[**getGenres**](KinopubDefaultAPI.md#getgenres) | **GET** /genres | 
[**getHistory**](KinopubDefaultAPI.md#gethistory) | **GET** /history | 
[**getHotItems**](KinopubDefaultAPI.md#gethotitems) | **GET** /items/hot | 
[**getItem**](KinopubDefaultAPI.md#getitem) | **GET** /items/{id} | 
[**getItemComments**](KinopubDefaultAPI.md#getitemcomments) | **GET** /items/comments | 
[**getItemTrailer**](KinopubDefaultAPI.md#getitemtrailer) | **GET** /items/trailer | 
[**getItemsByFilter**](KinopubDefaultAPI.md#getitemsbyfilter) | **GET** /items | 
[**getMediaLinks**](KinopubDefaultAPI.md#getmedialinks) | **GET** /items/media-links | 
[**getMediaVideoLink**](KinopubDefaultAPI.md#getmediavideolink) | **GET** /items/media-video-link | 
[**getPopularItems**](KinopubDefaultAPI.md#getpopularitems) | **GET** /items/popular | 
[**getServerLocations**](KinopubDefaultAPI.md#getserverlocations) | **GET** /references/server-location | 
[**getSimilarItems**](KinopubDefaultAPI.md#getsimilaritems) | **GET** /items/similar | 
[**getStreamingTypes**](KinopubDefaultAPI.md#getstreamingtypes) | **GET** /references/streaming-type | 
[**getTvChannels**](KinopubDefaultAPI.md#gettvchannels) | **GET** /tv | 
[**getVideoQualities**](KinopubDefaultAPI.md#getvideoqualities) | **GET** /references/video-quality | 
[**getVoiceoverAuthors**](KinopubDefaultAPI.md#getvoiceoverauthors) | **GET** /references/voiceover-author | 
[**getVoiceoverTypes**](KinopubDefaultAPI.md#getvoiceovertypes) | **GET** /references/voiceover-type | 
[**getWatchingMovies**](KinopubDefaultAPI.md#getwatchingmovies) | **GET** /watching/movies | 
[**getWatchingSeries**](KinopubDefaultAPI.md#getwatchingseries) | **GET** /watching/serials | 
[**getWatchingStatus**](KinopubDefaultAPI.md#getwatchingstatus) | **GET** /watching | 
[**notifyDevice**](KinopubDefaultAPI.md#notifydevice) | **POST** /device/notify | 
[**removeBookmarkFolder**](KinopubDefaultAPI.md#removebookmarkfolder) | **POST** /bookmarks/remove-folder | 
[**removeDeviceById**](KinopubDefaultAPI.md#removedevicebyid) | **POST** /device/{id}/remove | 
[**removeItemFromBookmarkFolder**](KinopubDefaultAPI.md#removeitemfrombookmarkfolder) | **POST** /bookmarks/remove-item | 
[**searchItems**](KinopubDefaultAPI.md#searchitems) | **GET** /items/search | 
[**toggleItemInBookmarkFolder**](KinopubDefaultAPI.md#toggleiteminbookmarkfolder) | **POST** /bookmarks/toggle-item | 
[**toggleWatchList**](KinopubDefaultAPI.md#togglewatchlist) | **GET** /watching/togglewatchlist | 
[**toggleWatchedStatus**](KinopubDefaultAPI.md#togglewatchedstatus) | **GET** /watching/toggle | 
[**unlinkCurrentDevice**](KinopubDefaultAPI.md#unlinkcurrentdevice) | **POST** /device/unlink | 
[**updateDeviceSettings**](KinopubDefaultAPI.md#updatedevicesettings) | **POST** /device/{id}/settings | 
[**voteForItem**](KinopubDefaultAPI.md#voteforitem) | **GET** /items/vote | 


# **addItemToBookmarkFolder**
```swift
    open class func addItemToBookmarkFolder(addItemToBookmarkFolderRequest: AddItemToBookmarkFolderRequest, completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Add item to bookmark folder

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let addItemToBookmarkFolderRequest = addItemToBookmarkFolder_request(item: 123, folder: 123) // AddItemToBookmarkFolderRequest | Object with item id and folder id

KinopubDefaultAPI.addItemToBookmarkFolder(addItemToBookmarkFolderRequest: addItemToBookmarkFolderRequest) { (response, error) in
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
 **addItemToBookmarkFolderRequest** | [**AddItemToBookmarkFolderRequest**](AddItemToBookmarkFolderRequest.md) | Object with item id and folder id | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addTimeMark**
```swift
    open class func addTimeMark(id: Int64, video: Int64, time: Int64, season: Int, completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Mark watching time

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Item id
let video = 987 // Int64 | Video id
let time = 987 // Int64 | Time in seconds
let season = 987 // Int | Seson number (only for series)

KinopubDefaultAPI.addTimeMark(id: id, video: video, time: time, season: season) { (response, error) in
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
 **id** | **Int64** | Item id | 
 **video** | **Int64** | Video id | 
 **time** | **Int64** | Time in seconds | 
 **season** | **Int** | Seson number (only for series) | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clearHistoryForItem**
```swift
    open class func clearHistoryForItem(clearHistoryForMediaRequest: ClearHistoryForMediaRequest, completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Clear history by item id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let clearHistoryForMediaRequest = clearHistoryForMedia_request(id: 123) // ClearHistoryForMediaRequest | Object with item id

KinopubDefaultAPI.clearHistoryForItem(clearHistoryForMediaRequest: clearHistoryForMediaRequest) { (response, error) in
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
 **clearHistoryForMediaRequest** | [**ClearHistoryForMediaRequest**](ClearHistoryForMediaRequest.md) | Object with item id | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clearHistoryForMedia**
```swift
    open class func clearHistoryForMedia(clearHistoryForMediaRequest: ClearHistoryForMediaRequest, completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Clear history by media id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let clearHistoryForMediaRequest = clearHistoryForMedia_request(id: 123) // ClearHistoryForMediaRequest | Object with media id

KinopubDefaultAPI.clearHistoryForMedia(clearHistoryForMediaRequest: clearHistoryForMediaRequest) { (response, error) in
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
 **clearHistoryForMediaRequest** | [**ClearHistoryForMediaRequest**](ClearHistoryForMediaRequest.md) | Object with media id | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clearHistoryForSeason**
```swift
    open class func clearHistoryForSeason(clearHistoryForMediaRequest: ClearHistoryForMediaRequest, completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Clear history by season id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let clearHistoryForMediaRequest = clearHistoryForMedia_request(id: 123) // ClearHistoryForMediaRequest | Object with season id

KinopubDefaultAPI.clearHistoryForSeason(clearHistoryForMediaRequest: clearHistoryForMediaRequest) { (response, error) in
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
 **clearHistoryForMediaRequest** | [**ClearHistoryForMediaRequest**](ClearHistoryForMediaRequest.md) | Object with season id | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createBookmarkFolder**
```swift
    open class func createBookmarkFolder(createBookmarkFolderRequest: CreateBookmarkFolderRequest, completion: @escaping (_ data: CreateBookmarkFolder200Response?, _ error: Error?) -> Void)
```



Create bookmark folder

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let createBookmarkFolderRequest = createBookmarkFolder_request(title: "title_example") // CreateBookmarkFolderRequest | Object with title

KinopubDefaultAPI.createBookmarkFolder(createBookmarkFolderRequest: createBookmarkFolderRequest) { (response, error) in
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
 **createBookmarkFolderRequest** | [**CreateBookmarkFolderRequest**](CreateBookmarkFolderRequest.md) | Object with title | 

### Return type

[**CreateBookmarkFolder200Response**](CreateBookmarkFolder200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBookmarkFolders**
```swift
    open class func getBookmarkFolders(completion: @escaping (_ data: GetBookmarkFolders200Response?, _ error: Error?) -> Void)
```



Get bookmark folders

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getBookmarkFolders() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetBookmarkFolders200Response**](GetBookmarkFolders200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBookmarkFoldersByItem**
```swift
    open class func getBookmarkFoldersByItem(item: Int64? = nil, completion: @escaping (_ data: GetBookmarkFoldersByItem200Response?, _ error: Error?) -> Void)
```



Get bookmark folders list by item id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let item = 987 // Int64 | Item id (optional)

KinopubDefaultAPI.getBookmarkFoldersByItem(item: item) { (response, error) in
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
 **item** | **Int64** | Item id | [optional] 

### Return type

[**GetBookmarkFoldersByItem200Response**](GetBookmarkFoldersByItem200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBookmarkItems**
```swift
    open class func getBookmarkItems(id: Int64, completion: @escaping (_ data: GetBookmarkItems200Response?, _ error: Error?) -> Void)
```



Get bookmark folder items

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Id of bookmark

KinopubDefaultAPI.getBookmarkItems(id: id) { (response, error) in
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
 **id** | **Int64** | Id of bookmark | 

### Return type

[**GetBookmarkItems200Response**](GetBookmarkItems200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCollection**
```swift
    open class func getCollection(id: Int64? = nil, completion: @escaping (_ data: GetCollection200Response?, _ error: Error?) -> Void)
```



Get collection

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Collection id (optional)

KinopubDefaultAPI.getCollection(id: id) { (response, error) in
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
 **id** | **Int64** | Collection id | [optional] 

### Return type

[**GetCollection200Response**](GetCollection200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCollectionList**
```swift
    open class func getCollectionList(title: String, sort: GetCollectionListSortParameter? = nil, perpage: Int64? = nil, page: Int64? = nil, completion: @escaping (_ data: GetCollectionList200Response?, _ error: Error?) -> Void)
```



Get collections list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let title = "title_example" // String | Title for search
let sort = getCollectionList_sort_parameter() // GetCollectionListSortParameter | Sort by field. Char '-' at the end is DESC (optional)
let perpage = 987 // Int64 | Results on one page (optional)
let page = 987 // Int64 | Page number (optional)

KinopubDefaultAPI.getCollectionList(title: title, sort: sort, perpage: perpage, page: page) { (response, error) in
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
 **title** | **String** | Title for search | 
 **sort** | [**GetCollectionListSortParameter**](.md) | Sort by field. Char &#39;-&#39; at the end is DESC | [optional] 
 **perpage** | **Int64** | Results on one page | [optional] 
 **page** | **Int64** | Page number | [optional] 

### Return type

[**GetCollectionList200Response**](GetCollectionList200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getContentTypes**
```swift
    open class func getContentTypes(completion: @escaping (_ data: [ContentType]?, _ error: Error?) -> Void)
```



Returns content types

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getContentTypes() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**[ContentType]**](ContentType.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCountries**
```swift
    open class func getCountries(completion: @escaping (_ data: [Country]?, _ error: Error?) -> Void)
```



Returns countries

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getCountries() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**[Country]**](Country.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentDevice**
```swift
    open class func getCurrentDevice(completion: @escaping (_ data: GetDeviceById200Response?, _ error: Error?) -> Void)
```



Returns current device

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getCurrentDevice() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetDeviceById200Response**](GetDeviceById200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentUser**
```swift
    open class func getCurrentUser(completion: @escaping (_ data: GetCurrentUser200Response?, _ error: Error?) -> Void)
```



Returns current user information

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getCurrentUser() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetCurrentUser200Response**](GetCurrentUser200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceById**
```swift
    open class func getDeviceById(id: Int64, completion: @escaping (_ data: GetDeviceById200Response?, _ error: Error?) -> Void)
```



Returns device by id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | id of device

KinopubDefaultAPI.getDeviceById(id: id) { (response, error) in
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
 **id** | **Int64** | id of device | 

### Return type

[**GetDeviceById200Response**](GetDeviceById200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeviceSettings**
```swift
    open class func getDeviceSettings(id: Int64, completion: @escaping (_ data: GetDeviceSettings200Response?, _ error: Error?) -> Void)
```



Returns device settings

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | id of device

KinopubDefaultAPI.getDeviceSettings(id: id) { (response, error) in
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
 **id** | **Int64** | id of device | 

### Return type

[**GetDeviceSettings200Response**](GetDeviceSettings200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDevicesList**
```swift
    open class func getDevicesList(completion: @escaping (_ data: GetDevicesList200Response?, _ error: Error?) -> Void)
```



Returns devices list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getDevicesList() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetDevicesList200Response**](GetDevicesList200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFreshItems**
```swift
    open class func getFreshItems(type: [String]? = nil, perpage: Int64? = nil, page: Int64? = nil, completion: @escaping (_ data: GetItemsByFilter200Response?, _ error: Error?) -> Void)
```



Fresh items shortcut

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let type = ["inner_example"] // [String] | Video content types (optional)
let perpage = 987 // Int64 | Results on one page (optional)
let page = 987 // Int64 | Page number (optional)

KinopubDefaultAPI.getFreshItems(type: type, perpage: perpage, page: page) { (response, error) in
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
 **type** | [**[String]**](String.md) | Video content types | [optional] 
 **perpage** | **Int64** | Results on one page | [optional] 
 **page** | **Int64** | Page number | [optional] 

### Return type

[**GetItemsByFilter200Response**](GetItemsByFilter200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGenres**
```swift
    open class func getGenres(completion: @escaping (_ data: [Genre]?, _ error: Error?) -> Void)
```



Returns genres

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getGenres() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**[Genre]**](Genre.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHistory**
```swift
    open class func getHistory(perpage: Int64? = nil, page: Int64? = nil, completion: @escaping (_ data: GetHistory200Response?, _ error: Error?) -> Void)
```



Returns history of views

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let perpage = 987 // Int64 | Results on one page (optional)
let page = 987 // Int64 | Page number (optional)

KinopubDefaultAPI.getHistory(perpage: perpage, page: page) { (response, error) in
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
 **perpage** | **Int64** | Results on one page | [optional] 
 **page** | **Int64** | Page number | [optional] 

### Return type

[**GetHistory200Response**](GetHistory200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHotItems**
```swift
    open class func getHotItems(type: [String]? = nil, perpage: Int64? = nil, page: Int64? = nil, completion: @escaping (_ data: GetItemsByFilter200Response?, _ error: Error?) -> Void)
```



Hot items shortcut

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let type = ["inner_example"] // [String] | Video content types (optional)
let perpage = 987 // Int64 | Results on one page (optional)
let page = 987 // Int64 | Page number (optional)

KinopubDefaultAPI.getHotItems(type: type, perpage: perpage, page: page) { (response, error) in
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
 **type** | [**[String]**](String.md) | Video content types | [optional] 
 **perpage** | **Int64** | Results on one page | [optional] 
 **page** | **Int64** | Page number | [optional] 

### Return type

[**GetItemsByFilter200Response**](GetItemsByFilter200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItem**
```swift
    open class func getItem(id: Int64, completion: @escaping (_ data: GetItem200Response?, _ error: Error?) -> Void)
```



Returns item by id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Item id

KinopubDefaultAPI.getItem(id: id) { (response, error) in
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
 **id** | **Int64** | Item id | 

### Return type

[**GetItem200Response**](GetItem200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemComments**
```swift
    open class func getItemComments(id: Int64? = nil, completion: @escaping (_ data: GetItemComments200Response?, _ error: Error?) -> Void)
```



Item comments

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Item id (optional)

KinopubDefaultAPI.getItemComments(id: id) { (response, error) in
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
 **id** | **Int64** | Item id | [optional] 

### Return type

[**GetItemComments200Response**](GetItemComments200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemTrailer**
```swift
    open class func getItemTrailer(id: Int64? = nil, sid: String? = nil, completion: @escaping (_ data: GetItemTrailer200Response?, _ error: Error?) -> Void)
```



Item trailer

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Item id (optional)
let sid = "sid_example" // String | Trailer id (optional)

KinopubDefaultAPI.getItemTrailer(id: id, sid: sid) { (response, error) in
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
 **id** | **Int64** | Item id | [optional] 
 **sid** | **String** | Trailer id | [optional] 

### Return type

[**GetItemTrailer200Response**](GetItemTrailer200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemsByFilter**
```swift
    open class func getItemsByFilter(type: [String]? = nil, title: String? = nil, genre: [Int64]? = nil, country: [Int64]? = nil, year: String? = nil, finished: Finished_getItemsByFilter? = nil, actor: [String]? = nil, letter: String? = nil, conditions: GetItemsByFilterConditionsParameter? = nil, force: Force_getItemsByFilter? = nil, sort: GetItemsByFilterSortParameter? = nil, quality: [Int64]? = nil, perpage: Int64? = nil, page: Int64? = nil, completion: @escaping (_ data: GetItemsByFilter200Response?, _ error: Error?) -> Void)
```



Returns items by filter

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let type = ["inner_example"] // [String] | Video content types (optional)
let title = "title_example" // String | Search by title (optional)
let genre = [123] // [Int64] | Genres (optional)
let country = [123] // [Int64] | Countries (optional)
let year = "year_example" // String | Year or year interval (delimeted by -) (optional)
let finished = 987 // Int64 | Finished status, 0 or 1 (optional)
let actor = ["inner_example"] // [String] | Actors. Actor1,Actor2+Actor3 (optional)
let letter = "letter_example" // String | First letter of title (optional)
let conditions = "TODO" // GetItemsByFilterConditionsParameter | Simple conditions for filter (optional)
let force = "force_example" // String | Skip quality filters (optional)
let sort = getItemsByFilter_sort_parameter() // GetItemsByFilterSortParameter | Sort by field. Char '-' at the end is DESC (optional)
let quality = [123] // [Int64] | Quality (optional)
let perpage = 987 // Int64 | Results on one page (optional)
let page = 987 // Int64 | Page number (optional)

KinopubDefaultAPI.getItemsByFilter(type: type, title: title, genre: genre, country: country, year: year, finished: finished, actor: actor, letter: letter, conditions: conditions, force: force, sort: sort, quality: quality, perpage: perpage, page: page) { (response, error) in
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
 **type** | [**[String]**](String.md) | Video content types | [optional] 
 **title** | **String** | Search by title | [optional] 
 **genre** | [**[Int64]**](Int64.md) | Genres | [optional] 
 **country** | [**[Int64]**](Int64.md) | Countries | [optional] 
 **year** | **String** | Year or year interval (delimeted by -) | [optional] 
 **finished** | **Int64** | Finished status, 0 or 1 | [optional] 
 **actor** | [**[String]**](String.md) | Actors. Actor1,Actor2+Actor3 | [optional] 
 **letter** | **String** | First letter of title | [optional] 
 **conditions** | [**GetItemsByFilterConditionsParameter**](.md) | Simple conditions for filter | [optional] 
 **force** | **String** | Skip quality filters | [optional] 
 **sort** | [**GetItemsByFilterSortParameter**](.md) | Sort by field. Char &#39;-&#39; at the end is DESC | [optional] 
 **quality** | [**[Int64]**](Int64.md) | Quality | [optional] 
 **perpage** | **Int64** | Results on one page | [optional] 
 **page** | **Int64** | Page number | [optional] 

### Return type

[**GetItemsByFilter200Response**](GetItemsByFilter200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaLinks**
```swift
    open class func getMediaLinks(mid: Int64? = nil, completion: @escaping (_ data: GetMediaLinks200Response?, _ error: Error?) -> Void)
```



Returns files and subtitles

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let mid = 987 // Int64 | Media id (optional)

KinopubDefaultAPI.getMediaLinks(mid: mid) { (response, error) in
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
 **mid** | **Int64** | Media id | [optional] 

### Return type

[**GetMediaLinks200Response**](GetMediaLinks200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMediaVideoLink**
```swift
    open class func getMediaVideoLink(file: String? = nil, type: ModelType_getMediaVideoLink? = nil, completion: @escaping (_ data: GetMediaVideoLink200Response?, _ error: Error?) -> Void)
```



Returns url by file path and streaming type

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let file = "file_example" // String | File path (optional)
let type = "type_example" // String | Streaming type (optional)

KinopubDefaultAPI.getMediaVideoLink(file: file, type: type) { (response, error) in
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
 **file** | **String** | File path | [optional] 
 **type** | **String** | Streaming type | [optional] 

### Return type

[**GetMediaVideoLink200Response**](GetMediaVideoLink200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPopularItems**
```swift
    open class func getPopularItems(type: [String]? = nil, perpage: Int64? = nil, page: Int64? = nil, completion: @escaping (_ data: GetItemsByFilter200Response?, _ error: Error?) -> Void)
```



Popular items shortcut

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let type = ["inner_example"] // [String] | Video content types (optional)
let perpage = 987 // Int64 | Results on one page (optional)
let page = 987 // Int64 | Page number (optional)

KinopubDefaultAPI.getPopularItems(type: type, perpage: perpage, page: page) { (response, error) in
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
 **type** | [**[String]**](String.md) | Video content types | [optional] 
 **perpage** | **Int64** | Results on one page | [optional] 
 **page** | **Int64** | Page number | [optional] 

### Return type

[**GetItemsByFilter200Response**](GetItemsByFilter200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getServerLocations**
```swift
    open class func getServerLocations(completion: @escaping (_ data: GetServerLocations200Response?, _ error: Error?) -> Void)
```



Returns server locations

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getServerLocations() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetServerLocations200Response**](GetServerLocations200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSimilarItems**
```swift
    open class func getSimilarItems(id: Int64? = nil, completion: @escaping (_ data: GetItemsByFilter200Response?, _ error: Error?) -> Void)
```



Returns items by filter

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Item id (optional)

KinopubDefaultAPI.getSimilarItems(id: id) { (response, error) in
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
 **id** | **Int64** | Item id | [optional] 

### Return type

[**GetItemsByFilter200Response**](GetItemsByFilter200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStreamingTypes**
```swift
    open class func getStreamingTypes(completion: @escaping (_ data: GetStreamingTypes200Response?, _ error: Error?) -> Void)
```



Returns streaming types

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getStreamingTypes() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetStreamingTypes200Response**](GetStreamingTypes200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTvChannels**
```swift
    open class func getTvChannels(completion: @escaping (_ data: GetTvChannels200Response?, _ error: Error?) -> Void)
```



TV channels list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getTvChannels() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetTvChannels200Response**](GetTvChannels200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVideoQualities**
```swift
    open class func getVideoQualities(completion: @escaping (_ data: GetVoiceoverAuthors200Response?, _ error: Error?) -> Void)
```



Returns available video qualities

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getVideoQualities() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetVoiceoverAuthors200Response**](GetVoiceoverAuthors200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVoiceoverAuthors**
```swift
    open class func getVoiceoverAuthors(completion: @escaping (_ data: GetVoiceoverAuthors200Response?, _ error: Error?) -> Void)
```



Returns voiceover authors

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getVoiceoverAuthors() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetVoiceoverAuthors200Response**](GetVoiceoverAuthors200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVoiceoverTypes**
```swift
    open class func getVoiceoverTypes(completion: @escaping (_ data: GetVoiceoverTypes200Response?, _ error: Error?) -> Void)
```



Returns voiceover types

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getVoiceoverTypes() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetVoiceoverTypes200Response**](GetVoiceoverTypes200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWatchingMovies**
```swift
    open class func getWatchingMovies(completion: @escaping (_ data: GetWatchingMovies200Response?, _ error: Error?) -> Void)
```



Get watching movies

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.getWatchingMovies() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**GetWatchingMovies200Response**](GetWatchingMovies200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWatchingSeries**
```swift
    open class func getWatchingSeries(subscribed: Subscribed_getWatchingSeries, completion: @escaping (_ data: GetWatchingSeries200Response?, _ error: Error?) -> Void)
```



Get watching series

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let subscribed = 987 // Int | Show only subscribed series if 1

KinopubDefaultAPI.getWatchingSeries(subscribed: subscribed) { (response, error) in
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
 **subscribed** | **Int** | Show only subscribed series if 1 | 

### Return type

[**GetWatchingSeries200Response**](GetWatchingSeries200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWatchingStatus**
```swift
    open class func getWatchingStatus(id: Int64, video: Int64? = nil, season: Int64? = nil, completion: @escaping (_ data: GetWatchingStatus200Response?, _ error: Error?) -> Void)
```



Get watching status of item

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Item id
let video = 987 // Int64 | Video number (optional)
let season = 987 // Int64 | Season number (only for series) (optional)

KinopubDefaultAPI.getWatchingStatus(id: id, video: video, season: season) { (response, error) in
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
 **id** | **Int64** | Item id | 
 **video** | **Int64** | Video number | [optional] 
 **season** | **Int64** | Season number (only for series) | [optional] 

### Return type

[**GetWatchingStatus200Response**](GetWatchingStatus200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notifyDevice**
```swift
    open class func notifyDevice(notifyDeviceRequest: NotifyDeviceRequest, completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Notify device info

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let notifyDeviceRequest = notifyDevice_request(title: "title_example", hardware: "hardware_example", software: "software_example") // NotifyDeviceRequest | Device info

KinopubDefaultAPI.notifyDevice(notifyDeviceRequest: notifyDeviceRequest) { (response, error) in
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
 **notifyDeviceRequest** | [**NotifyDeviceRequest**](NotifyDeviceRequest.md) | Device info | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeBookmarkFolder**
```swift
    open class func removeBookmarkFolder(removeBookmarkFolderRequest: RemoveBookmarkFolderRequest, completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Remove bookmark folder

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let removeBookmarkFolderRequest = removeBookmarkFolder_request(folder: 123) // RemoveBookmarkFolderRequest | Object with folder id

KinopubDefaultAPI.removeBookmarkFolder(removeBookmarkFolderRequest: removeBookmarkFolderRequest) { (response, error) in
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
 **removeBookmarkFolderRequest** | [**RemoveBookmarkFolderRequest**](RemoveBookmarkFolderRequest.md) | Object with folder id | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeDeviceById**
```swift
    open class func removeDeviceById(id: Int64, completion: @escaping (_ data: RemoveDeviceById200Response?, _ error: Error?) -> Void)
```



Remove device by id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | id of device

KinopubDefaultAPI.removeDeviceById(id: id) { (response, error) in
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
 **id** | **Int64** | id of device | 

### Return type

[**RemoveDeviceById200Response**](RemoveDeviceById200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeItemFromBookmarkFolder**
```swift
    open class func removeItemFromBookmarkFolder(addItemToBookmarkFolderRequest: AddItemToBookmarkFolderRequest, completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Remove item from bookmark folder

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let addItemToBookmarkFolderRequest = addItemToBookmarkFolder_request(item: 123, folder: 123) // AddItemToBookmarkFolderRequest | Object with item id and folder id

KinopubDefaultAPI.removeItemFromBookmarkFolder(addItemToBookmarkFolderRequest: addItemToBookmarkFolderRequest) { (response, error) in
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
 **addItemToBookmarkFolderRequest** | [**AddItemToBookmarkFolderRequest**](AddItemToBookmarkFolderRequest.md) | Object with item id and folder id | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchItems**
```swift
    open class func searchItems(q: String? = nil, type: [String]? = nil, field: Field_searchItems? = nil, perpage: Int64? = nil, page: Int64? = nil, sectioned: Sectioned_searchItems? = nil, completion: @escaping (_ data: SearchItems200Response?, _ error: Error?) -> Void)
```



Search items

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let q = "q_example" // String | Search query (optional)
let type = ["inner_example"] // [String] | Video content types (optional)
let field = "field_example" // String | Search in field (optional)
let perpage = 987 // Int64 | Results on one page (optional)
let page = 987 // Int64 | Page number (optional)
let sectioned = 987 // Int | Sectioned 1 or 0. Defines output type, if 1 - (optional)

KinopubDefaultAPI.searchItems(q: q, type: type, field: field, perpage: perpage, page: page, sectioned: sectioned) { (response, error) in
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
 **q** | **String** | Search query | [optional] 
 **type** | [**[String]**](String.md) | Video content types | [optional] 
 **field** | **String** | Search in field | [optional] 
 **perpage** | **Int64** | Results on one page | [optional] 
 **page** | **Int64** | Page number | [optional] 
 **sectioned** | **Int** | Sectioned 1 or 0. Defines output type, if 1 - | [optional] 

### Return type

[**SearchItems200Response**](SearchItems200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **toggleItemInBookmarkFolder**
```swift
    open class func toggleItemInBookmarkFolder(addItemToBookmarkFolderRequest: AddItemToBookmarkFolderRequest, completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Toggle item in bookmark folder. Add or remove based on state

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let addItemToBookmarkFolderRequest = addItemToBookmarkFolder_request(item: 123, folder: 123) // AddItemToBookmarkFolderRequest | Object with item id and folder id

KinopubDefaultAPI.toggleItemInBookmarkFolder(addItemToBookmarkFolderRequest: addItemToBookmarkFolderRequest) { (response, error) in
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
 **addItemToBookmarkFolderRequest** | [**AddItemToBookmarkFolderRequest**](AddItemToBookmarkFolderRequest.md) | Object with item id and folder id | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **toggleWatchList**
```swift
    open class func toggleWatchList(id: Int64, completion: @escaping (_ data: ToggleWatchList200Response?, _ error: Error?) -> Void)
```



Toggle watchlist (for series)

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Series item id

KinopubDefaultAPI.toggleWatchList(id: id) { (response, error) in
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
 **id** | **Int64** | Series item id | 

### Return type

[**ToggleWatchList200Response**](ToggleWatchList200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **toggleWatchedStatus**
```swift
    open class func toggleWatchedStatus(id: Int64, video: Int64, season: Int, completion: @escaping (_ data: ToggleWatchedStatus200Response?, _ error: Error?) -> Void)
```



Toggle watched status

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Item id
let video = 987 // Int64 | Video id
let season = 987 // Int | Seson number (only for series)

KinopubDefaultAPI.toggleWatchedStatus(id: id, video: video, season: season) { (response, error) in
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
 **id** | **Int64** | Item id | 
 **video** | **Int64** | Video id | 
 **season** | **Int** | Seson number (only for series) | 

### Return type

[**ToggleWatchedStatus200Response**](ToggleWatchedStatus200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unlinkCurrentDevice**
```swift
    open class func unlinkCurrentDevice(completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Unlink current device

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi


KinopubDefaultAPI.unlinkCurrentDevice() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDeviceSettings**
```swift
    open class func updateDeviceSettings(id: Int64, requestBody: [String: UpdateDeviceSettingsRequestValue], completion: @escaping (_ data: UnlinkCurrentDevice200Response?, _ error: Error?) -> Void)
```



Update device settings

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | id of device
let requestBody = "TODO" // [String: UpdateDeviceSettingsRequestValue] | Map with setting key and value

KinopubDefaultAPI.updateDeviceSettings(id: id, requestBody: requestBody) { (response, error) in
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
 **id** | **Int64** | id of device | 
 **requestBody** | [**[String: UpdateDeviceSettingsRequestValue]**](UpdateDeviceSettingsRequestValue.md) | Map with setting key and value | 

### Return type

[**UnlinkCurrentDevice200Response**](UnlinkCurrentDevice200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **voteForItem**
```swift
    open class func voteForItem(id: Int64? = nil, like: Like_voteForItem? = nil, completion: @escaping (_ data: VoteForItem200Response?, _ error: Error?) -> Void)
```



Vote for item

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import KinopubApi

let id = 987 // Int64 | Item id (optional)
let like = 987 // Int | Like or not (1/0) (optional)

KinopubDefaultAPI.voteForItem(id: id, like: like) { (response, error) in
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
 **id** | **Int64** | Item id | [optional] 
 **like** | **Int** | Like or not (1/0) | [optional] 

### Return type

[**VoteForItem200Response**](VoteForItem200Response.md)

### Authorization

[AccessToken](../README.md#AccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

