# openapi.api.AddUserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userAddPost**](AddUserApi.md#userAddPost) | **POST** /user/add | Create a new User


# **userAddPost**
> userAddPost(user)

Create a new User

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AddUserApi();
var user = new User(); // User | user to create

try { 
    api_instance.userAddPost(user);
} catch (e) {
    print("Exception when calling AddUserApi->userAddPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | [**User**](User.md)| user to create | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

