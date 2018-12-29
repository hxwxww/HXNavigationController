# HXNavigationController
HXNavigationController仿微信导航栏实现


 ![image](https://github.com/Wen-hx/HXNavigationController/raw/master/screenshots/screenshot.gif)


## 简单介绍

- 仿微信导航栏的实现，让你的导航栏过渡平滑，赏心悦目。
- 使用简单，只需要在viewDidLoad中设置想要的效果即可：
```
hx_backgroundColor = .white
hx_tintColor = .red
hx_titleColor = .red
hx_barStyle = .default
```
- 支持 appearance统一设置，在AppDelegate的application(didFinishLaunchingWithOptions:)中设置即可：
```
let navigationBar = UINavigationBar.appearance()
navigationBar.barTintColor = .red
navigationBar.tintColor = .white
navigationBar.barStyle = .black
navigationBar.titleTextAttributes = [
NSAttributedString.Key.foregroundColor: UIColor.white,
NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
]
```

更具体的用法请下载 Demo 查看。
