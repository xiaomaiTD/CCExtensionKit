# CCExtensionKit

##### Some custom categories for iOS with Objective-C. 

[![Version](https://img.shields.io/cocoapods/v/CCExtensionKit.svg?style=flat)](http://cocoapods.org/pods/CCExtensionKit)

[![License](https://img.shields.io/cocoapods/l/CCExtensionKit.svg?style=flat)](http://cocoapods.org/pods/CCExtensionKit)

[![Platform](https://img.shields.io/cocoapods/p/CCExtensionKit.svg?style=flat)](http://cocoapods.org/pods/CCExtensionKit)

### 中文说明请点击[[这里](https://github.com/VArbiter/CCExtensionKit/blob/master/README_CN.md)]

### Current Version 3.7.0

> pod 'CCExtensionKit' , '~> 3.7.0' // default is CCCore
> 
> > pod 'CCExtensionKit/CCFull' , '~> 3.7.0' . if you wanna install the whole Kit .

### Warning 
> CCLocalLib has no longer effect after version `2.2.3`
> 
> cause after `3.0.0` , CCLocalLib was renamed to `'CCExtensionKit'` .

### Note
> when install , default is `CCCore` , `CCCore` contains 
> 
> > `CCCommon` (Macros) , `CCProtocol` (Protocol) , `CCData` (NS Family), `CCView` (UI Family), `CCRuntime` (objc/ runtime associate)
> 
> when you wanna get to Full , install with `"CCExtensionKit/CCFull"` (note: `CCFull` had dependend on other vendors.)
> 
> **Instructions**
> 
> > CCCore : Core extensions . a abstract collection .
> 
> > CCFull : Full extensions (not included CCDataBase && CCCustom) . a abstract collection .
> 
> > CCExtensionAssets : Assets collection , preserve for future needs . (not available for now).
> 
> > CCCommon : Macros && Common tools .
> 
> > CCProtocol : CCProtocol . for CC . make all the sub-class of NSObject conforms to it .
> 
> > CCRuntime : Packaged for some runtime functions .
> 
> > CCDataBase : Wrappers for [`Realm`](https://github.com/realm/realm-cocoa) ('~> 2.10.0') && [`FCModel`](https://github.com/marcoarment/FCModel)
> 
> > CCRouter : a extension Package Router for [`MGJRouter`](https://github.com/meili/MGJRouter) ('~> 0.9.3') && perform actions .
> 
> > CCData :  a extension actions for NS family .
> 
> > CCView :  a extension actions for UI family .
> 
> > CCOrigin : a kit that for develop for custom views .
> 
> > CCCustom :  Custom classes or functions , dependend or based on other vendors .

### What's new ?
---
**2018-05-04 21:55:33**

> added `CCAuthentication` (CCCommon) for touch id && face id verify , `CCIAPManager`(CCOrigin) for in app purchase  .

**2018-04-23 18:53:35**

> make prefix all `cc_` . remove CCDataBase && CCCustom from CCFull .

**2017-12-22 15:59:44**

> translate all comment in header file into chinese .

**2017-11-28 12:39:59**

> rebuilt `CCBridgeWrapper` in `CCRouter` .

**2017-11-01 19:24:27**

> fix annoying warnings under Xcode 9.

**2017-09-15 17:56:19**

> rename 'CCLocalLib' to 'CCExtensionKit' .
> updated to '3.0.0'
> 

**2017-08-10 14:50:52**
  
> After writing `CCChainOperate` for almost a month , I figured , that , **THIS CAN BE A KIT !**
> 
> Therefore , `CCChainKit` was created . 👏👏👏 .
> 
> ~~👉👉👉 **[CCChainKit](https://github.com/VArbiter/CCChainKit)**~~
> probably I won't update CCChainKit for a long time , I don't have that time or energy to continue contribute on two repos .

**2017-08-06 15:38:09**

> Well ... I found that local libraries have some issues on spec dependency . Therefore , CCLocalLib was no longer a local lib. 
👏👏👏 -> now , jusy run `pod 'LocalLib' ` and cocoapods will do the rest .

**2017-07-01 19:49:01**
> I wrote a new library called `CCChainOperate` .
 Why I wrote it ?
>
> well , after years of writing objective-c , i figured some dis-advantage of it . such as you have to use `[]`  everywhere . i just hate that . 
> 
> but , as we all know , on the opposite side , `swift` was much better , easily to use , simple to unsderstand (though its haven't stable yet). 
> 
>  Someday , i find , that block , can actually can perform a style like swift , therefore `CCChainOperate ` was born (not complete yet , maybe , forever , but I'll try.).
>  
>  Also , heavily inspired by react-Objc .

### Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Requirements

Already done in pod spec.

### Installation

CCExtensionKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CCExtensionKit"
```

### Author

**ElwinFrederick, [elwinfrederick@163.com](elwinfrederick@163.com)**

### License

CCExtensionKit is available under the MIT license. See the LICENSE file for more info.
