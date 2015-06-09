# MTLayerManager 

## 概要

基於ScreenView上可以加入Label及ImageView，並且新增的物件可以旋轉、平移、縮放及編輯。

## 如何使用

- [下載 MTLayerManager](https://github.com/iMittap/MTLayerManager/archive/develop.zip)並壓縮至任一目錄下。
- 於欲使用的專案，加入目標路徑(MTLayerManager/Source)的所有.h.m檔。
- import "MTLayerSceneView.h"檔案。

## 操作說明

### `.h檔` 定義 MTLayerSceneView

```objective-c
@property (weak, nonatomic) IBOutlet MTLayerSceneView *m_pMTLayerScene;
```

### `.m檔` 呼叫函式

#### 新增 圖片物件

```objective-c
- (nonnull instancetype) initWithFrame:(CGRect)frame WithImage:(nullable UIImage *)pImg;
```

```objective-c
[self.m_pMTLayerScene addImageItem:[UIImage imageNamed:pstrImgName] Style:nil];
```

#### 新增 文字物件

```objective-c
- (nonnull instancetype) initWithFrame:(CGRect)frame WithString:(nullable NSString *)pstrText;
```

```objective-c
[self.m_pMTLayerScene addLabelItem:message Style:nil]
```

## License
MTLayerManager is released under the MIT license. See LICENSE for details.。