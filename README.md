# IceAndFireKit

[![CI Status](http://img.shields.io/travis/Brian/IceAndFireKit.svg?style=flat)](https://travis-ci.org/Brian/IceAndFireKit)
[![Version](https://img.shields.io/cocoapods/v/IceAndFireKit.svg?style=flat)](http://cocoapods.org/pods/IceAndFireKit)
[![License](https://img.shields.io/cocoapods/l/IceAndFireKit.svg?style=flat)](http://cocoapods.org/pods/IceAndFireKit)
[![Platform](https://img.shields.io/cocoapods/p/IceAndFireKit.svg?style=flat)](http://cocoapods.org/pods/IceAndFireKit)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Accessing API

Use the `IceAndFireRequestEngine` singleton to perform requests to fetch data for single objects or for a list of objects.

## 3 ways to fetch information

### Fetch object by id
Pass in an `id` and specify the return type in the completion handler to fetch an object. 

Example:
```
var houseObject : IceAndFireHouse?
IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObject(1) { (iceAndFireObject : IceAndFireHouse?, error : NSError?) -> Void in
houseObject = iceAndFireObject
}
```

### Fetch objects by page / limit

Fetches a page of objects from the API. Optional page and limit is used within the request for pagination. ResponseType is defined within the completionHandler 

Example:
```
var charactersArray : [IceAndFireCharacter]?
IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(2, limit: 10) { (iceAndFireObjects : [IceAndFireCharacter]?, error : NSError?) -> Void in
charactersArray = iceAndFireObjects
}
```

### Populate minimal object using its resource url

Populates a basic object using its resource URL. All objects returned from an API can contain other resource URLs. These objects are parsed into its specific type and its url popluated. This means you have a simple way to populate each of the "minified" objects

Example:
```
var book = IceAndFireBook(urlString: "http://anapioficeandfire.com/api/books/2")
IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObject(book) { (iceAndFireObject : IceAndFireBook?, error : NSError?) -> Void in
book = iceAndFireObject
}
```

## Pagination Links

Fetching pages will return an `IceAndFireLinkHeaders` object. This can contain 4 pagination NSURLs. `prev`, `next`, `first` and `last`. They will be a reference to the appropriate page based on the keyword.

These can be used for simple pagination chaining

## Requirements

## Installation

IceAndFireKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "IceAndFireKit"
```

## Author

Brian, brianmartinmurphy@gmail.com

## License

IceAndFireKit is available under the MIT license. See the LICENSE file for more info.
