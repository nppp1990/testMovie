# yj_moive

just for test assignment

## Getting Started

#### 资源文件生成

- 生成命令

```
fluttergen
```

- **flutter_gen**安装，参考 https://pub.dev/packages/flutter_gen

```
dart pub global activate flutter_gen
```

#### 国际化

1. 插件安装（如没有安装）
```
dart pub global activate get_cli
```
2. 编辑 ` [en_US.json](assets/locales/en_US.json) ` 和` [zh_CN.json](assets/locales/zh_CN.json) `
3. 生成对应代码在` [locales.g.dart](lib/generated/locales.g.dart) `

#### Json对象序列化反序列化

- 参考` [business](lib/network/model/business) `实现
- 具体可参考https://pub.dev/packages/json_serializable
- 命令：dart run build_runner build

