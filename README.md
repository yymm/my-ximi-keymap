# my ximi firmware

reference:

- [BUILD GUIDE](https://github.com/sadekbaroudi/fingerpunch/blob/master/keyboards/ximi/v1/BUILDGUIDE.md)
- [ファームウェアについてのドキュメント(便利)](https://github.com/sadekbaroudi/qmk_firmware/blob/master/keyboards/fingerpunch/FIRMWARE.md)
- [ximiファームウェアのREADME](https://github.com/sadekbaroudi/qmk_firmware/blob/master/keyboards/fingerpunch/ximi/v1/readme.md)

# usage

## setup

```
make setup
```

setupは1回だけでok、sadekbaroudiさんのqmk_firmwareをcloneします。

Docker内部で操作するのでcloneしたあとは放置でok。

## build

```
make build_right
make build_left
```

uf2フォルダにright.uf2とleft.uf2が作成されます。

## flash

リセットボタンを押しながらUSB Type-Cを接続することで外部ストレージとして認識される。

buildで作成したuf2ファイルをフォルダにコピーすることでflashすることができます。

左にトラックパッド、右にトラックボールの構成にしているので左と右でそれぞれのビルド生成物をflashする必要があるので注意。
