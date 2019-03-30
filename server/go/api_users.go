/*
 * go_flutter_exam User
 *
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * API version: 1.0.0
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

 package openapi

 import (
	 "encoding/json"
	 "net/http"
 )
 
 // UsersGet - get all user information
 func UsersGet(w http.ResponseWriter, r *http.Request) {
	 w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	 w.WriteHeader(http.StatusOK)
	 userMap := GetUserMap()
	 values := []*User{}
	 for _, v := range userMap {
		 values = append(values, v)
	 }
	 
	 json.NewEncoder(w).Encode(values)
 }
 