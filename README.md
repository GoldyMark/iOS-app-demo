# iOS-app-demo

## 简介
本app是模仿电商app做的一个demo，旨在学习iOS开发。由于是边学边做，代码写得很粗糙，没有过多组织，UI方面更是不用说了。
由于只是出于学习目的而制作，有些子页面并没有去实现，只是简单一个弹框显示。

## 开发和测试环境
- SDK:iOS 8.2;
- 模拟器分辨率：iPhone 5s;

## 学习内容
- AutoLayout布局；
- Storyboard的使用；
- UIViewController的生命周期；
- 常用viewController的使用方法，包括UITabBarViewController、UICollectionViewController、UITableViewController、UINavgationViewController； 
- 熟悉了部分API；
- 学习使用部分基本组件，包括UIButton、UILabel、UISearchBar、UIAlertView；
- 学习重用UICollectionViewCell和UITableViewCell；

## 预览
### 首页
![首页](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/preview/home.png)

### 搜索框
![搜索](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/preview/search.png)

### 发现页面
![发现](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/preview/discover.png)

### 品牌页面
![品牌](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/preview/brands.png)

### 购物车正常状态
![购物车正常状态](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/preview/shoppingCartNormal.png)

### 购物车编辑状态
![购物车编辑状态](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/preview/shoppingCartEditing.png)

### 个人中心
![个人中心](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/preview/personalCenter.png)

### 登陆界面
![登陆](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/preview/login.png)

## 暂时已知BUG
- 在ODHomeViewController里设置了选中商品时背景色为绿色，不选中时背景色为蓝色，但点击商品时下方的某些单元格的背景色也会同时变为绿色（例如：点击商品1，下方某商品的背景色同时也变成绿色，至于是商品几，不同分辨率的情况下不同），而且来回滚动的话其他cell会随机变成绿色（也不算是随机，但结果会随滚动速度而异）。Log了indexPath查看也没有发现有重复的现象，估计问题是出在cell的重用上，可能是对UICollectionView和UITableView的显示机制还不是很了解。最后google之也无果（有人说是bug，暂未求证），如下图所示：
![bug1](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/bug/bug1.png)
- 上述bug经多次测试，可理解为：点击第一页的商品1后，第二页的商品n（位置同商品1）的背景色也会变成绿色，但明明两个cell的indexPath是不同的，不知道为什么会获取到同一个，如下图所示：
![bug2](https://raw.githubusercontent.com/GoldyMark/iOS-app-demo/master/images/bug/bug2.png)

## 不足之处
- 搜索框有个黑色边框，不论设置CALayer的属性还是searchBar的边框属性都消不去，暂时未知原因；
- UITabBar限制颇多，像微博那种好看的tabBar看来是自定义的，有机会学习一下用Interface Builder自定义tabBar；
- cell之间的间距，如果不在代码里写，而在storyboard里面设置好像无效，暂未知怎样调整；
- UICollectionView、UITableView的滚动有点卡顿，不知道是模拟器问题还是机器配置问题还是程序问题，感觉像是程序没优化的原因；

## 需完善的功能
- 用ZXing实现扫描二维码、条形码功能；
- 注册通知中心，实现信息推送；
- 写个自定义的搜索框?