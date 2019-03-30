# openapi.api.UsersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8080/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersGet**](UsersApi.md#usersGet) | **GET** /users | get all user information


# **usersGet**
> List<User> usersGet()

get all user information

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new UsersApi();

try { 
    var result = api_instance.usersGet();
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->usersGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<User>**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

