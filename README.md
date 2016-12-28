
# PyCon TW Official Guile App [![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/pycontw/pycontw-ios/develop/LICENSE) 
Forked froma PyConJP Github: https://github.com/pyconjp/pyconjp-ios

* Swift 3.x
* Xcode8.x
* iOS 9.0~

## SwiftLint建議
https://github.com/realm/SwiftLint

```sh
$brew install swiftlint
```

## fastlane

```sh
$gem install bundler
$bundle install --path vendor/bundle
$bundle exec fastlane init
```

## 使用Carthage管理Libraries
https://github.com/Carthage/Carthage

```sh
$brew install carthage
$carthage update --platform iOS
```

### 專案使用以下Libraries
* [Alamofire](https://github.com/Alamofire/Alamofire)
* [AlamofireImage](https://github.com/Alamofire/AlamofireImage)
* [RealmSwift](https://realm.io/docs/swift/latest/)

## Staging API之URL及basic認證方式
**Staging API的認證資料為工作人員驗證之用，請勿對外洩漏**   
API的URL、basic認證之使用者帳號及密碼請參照Scheme內的環境變數設定   
若要連接至Staging環境，請依照以下步驟設定(若為Production環境則無需設定)   

1. 從`New Scheme`建立新的Scheme (非共有設定，無須加入git管理)
2. `Edit Scheme` > `Run` > `Arguments` > `Enviroment Variables` 增加以下項目
    * APIBaseURL
    * APIAuthUser
    * APIAuthPassword

## License
[pycontw-ios](https://github.com/pycontw/pycontw-ios) is released under the [MIT License](LICENSE.md).


