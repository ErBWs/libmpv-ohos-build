# libmpv-ohos-build

在原仓库基础上增加了由 [@0Chencc](https://github.com/0Chencc) 为 Kazumi 编写的 [patch](./patches/ffmpeg/ffmpeg-hls-kazumi-combined.patch) 用于实现 hls 广告跳过功能。

## 如何开启广告跳过

```shell
demuxer-lavf-o=hls_ad_filter=1
```
