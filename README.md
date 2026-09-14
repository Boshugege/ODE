# 常微分方程课程笔记

基于 Typst 编写的常微分方程（ODE）课堂笔记与讲义。排版模板通过 `@local/zhaji:0.1.0` 引入。

## 目录结构

```text
ODE/
├── book.typ            # 全书合订本总入口（封面 + 目录 + 全部章节）
├── notes/              # 课堂笔记（每课独立文件，支持单课即时预览）
│   ├── 01.typ
│   ├── 02.typ
│   └── ...
├── figures/            # 课程插图（相图、方向场、数值曲线等）
└── out/                # 编译输出 PDF（受 .gitignore 保护）
```

## 编译方法

日常编写使用 VS Code 打开本目录，配合 Tinymist 插件实现保存即编译与毫秒级实时预览。

亦可在终端直接编译：

```bash
# 编译某一课
typst compile notes/01.typ out/notes/01.pdf

# 编译整本合订讲义
typst compile book.typ out/book.pdf

# 实时监听预览某一课
typst watch notes/01.typ
```

## 模板依赖

本仓库样式依赖本地模板包 `@local/zhaji:0.1.0`。
模板源码位于独立仓库 [typst-zhaji](../typst-zhaji)。
