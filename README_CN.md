# LUTFilter-IOS

简单轻量的IOS`UIImage`滤镜, 以OpenGL和LUT图作为基础。
[中文](./README_CN.md) | [English](./README.md)

## 什么是LUT图

LUT全称Look-Up Table,可以理解为一个颜色查找表，以映射的方式，将原图一个像素点的颜色、亮度等数值映射到对应的另一组数值，达到滤镜效果，因为LUT图以png的格式存储，制作简单，复用性好 (LUT)。

直观来讲，LUT是一张长得像下面这样的图片。

![LUTImage](./LUT/Beagle.png)

LUT图有不同的尺寸，本项目采用64 * 64 * 64。

## Requirement

IOS 10.0+
Swift 4+

## Installation

### CocoaPods:

Add this to your `Podfile`

``` pod
pod 'LUTFilter'
```

## Usage

``` swift
let i = UIImage(named: "originalImage")
let lut = UIImage(named: "lut")
// The image flitered with lut
let filteredImage = i.applyLUTFilter(lut)
```

为减小库体积，本项目不内置滤镜，但是在`LUT`文件夹内提供了几张LUT图，可随意取用。

## Contribution

欢迎提PR.
