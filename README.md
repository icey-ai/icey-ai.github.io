[blog.icey-ai.com](https://blog.icey-ai.com)，使用 [Tylant](https://github.com/Myriad-Dreamin/tylant)、Astro 和 Typst。
文章写在 `.typ` 文件中，构建时生成静态 HTML 和 MathML。

## 本地运行

需要 Node.js 24、pnpm 11.22.0；独立预览或导出 PDF 使用 Typst 0.15.1。

```sh
pnpm install --frozen-lockfile
pnpm dev
```

打开终端显示的本地地址，通常为 `http://localhost:4321`。检查生产构建：

```sh
pnpm check
pnpm test:math
pnpm build
pnpm preview
```

网站构建使用锁定在 `pnpm-lock.yaml` 中的 Typst 编译器绑定，独立安装的 `typst` 命令用于编辑器预览和手动导出。

## 写文章

```sh
pnpm new my-first-post "我的第一篇文章"
```

编辑生成的 `content/article/my-first-post.typ`，完成后把 `draft: true` 改为 `draft: false`。
草稿不生成文章页面，也不会进入首页、搜索列表、标签、RSS 或 sitemap。
新文章的默认地址是 `/article/my-first-post/`；已有三篇文章通过 `permalink` 保留旧地址。

```typst
#import "/typ/templates/blog.typ": *
#import "/typ/templates/article-helpers.typ": *
#show: main.with(
  title: "我的第一篇文章",
  desc: "显示在列表和搜索结果中的摘要。",
  date: "2026-09-19",
  tags: ("math",),
  categories: ("note",),
  draft: false,
)

= 一个例子 <example>

行内公式 $a^2 + b^2 = c^2$，以及独立公式：

$ integral_0^1 x^2 dif x = 1/3 $

#proof[在这里写证明。]

正文脚注。#footnote[在这里写脚注。]
```

模板也支持 `author`、`lang`、`updated-date`、`cover`、`permalink` 和 `show-outline`。
有公式的标题和章节可加 `<label>`，用 `#link(<label>)[链接文字]` 引用。

### 头图与正文图片

将头图放入 `public/assets/images/headers/`，在文章现有的 `main.with(...)` 中加入：

```typst
cover: "/assets/images/headers/my-cover.jpg",
```

例如 `public/assets/images/headers/my-cover.jpg` 对应网站路径 `/assets/images/headers/my-cover.jpg`。
头图显示在文章标题区域，也用于分享预览；省略 `cover` 就不显示头图。
这是博客模板的元数据，PDF 预览不会显示网站头图。

正文图片用 Typst 自带的 `image`，需要文件路径中的 `/public` 前缀；需要图注时再包一层 `figure`：

```typst
#figure(
  image("/public/assets/images/example.png", alt: "图片说明"),
  caption: [这里是图注。],
)
```

### 证明块

文章顶部导入 `article-helpers.typ` 后，可以直接使用：

```typst
#proof[
  因为 $a >= 0$ 且 $b >= 0$，所以 $a + b >= 0$。
]

#proof(title: "Proof", open: true)[
  自定义标题，并在网页上默认展开。
]

#details("解答")[其他需要折叠的内容。]
```

`proof` 默认标题为“证明”、默认折叠；点击标题可以展开或收起，`open: true` 控制初始状态。
证明内容支持正常的 Typst 公式、段落、列表和链接；导出 PDF 时始终完整显示。
`proof` 和 `details` 是本仓库提供的函数，头图也由博客模板处理，均不需要你手写 HTML。
旧文章的 `#details("Proof")[...]` 继续可用，`details` 同样支持 `open: true`。

完整可复制示例见 [examples/post.typ](examples/post.typ)，它不参与网站发布。
`pnpm new` 生成的新文章也附有头图和证明块的写法提示。

### 编辑器与 PDF

Typst 的导入路径以仓库为根目录。VS Code / Tinymist 的 root 已在 `.vscode/settings.json` 中配置，打开此仓库文件夹即可；其他编辑器需要设置同样的 root。命令行导出示例：

```sh
typst compile --root . content/article/turing-machines.typ turing-machines.pdf
```

## 站点配置与部署

- `.env`：域名、标题、描述、作者；当前文件只有公开的站点信息，私人配置放入忽略的 `.env.local`。
- `src/pages/index.astro`：首页副标题和简介。
- `content/author.json`：About 页的头像、昵称、bio（简介或个性签名）和所在地；`content/other/about.typ`：后续补充的个人介绍。
- `src/styles/blog.css`：网页样式；`typ/templates/blog.typ`：文章元数据、HTML 与 PDF 模板。
- `src/components/Giscus.astro`：原有评论仓库与分类；`BaseHead.astro`：原有统计与验证配置。
- `public/CNAME`：自定义域名。

`.github/workflows/deploy.yml` 会在推送到 `master` 时检查、构建并部署到 GitHub Pages；PR 只运行检查和构建。

## 网页字体

中文使用霞鹜文楷屏幕阅读版（LXGW WenKai Screen），英文使用 Source Serif 4，网页公式使用 STIX Two Math。
正文为 18px、1.8 倍行高；英文提供可变字重、光学字号和真正的斜体，中文屏幕版只有常规字重，粗体由浏览器合成。

字体入口是 `src/styles/font.css`，英文必须排在中文字体之前，因为文楷本身也包含拉丁字母。
网页字体由本站提供，中文按 Unicode 分包加载；没有引用 Google Fonts 或 jsDelivr 的外部样式表。
Typst 的 PDF 字体继续由 `typ/templates/blog.typ` 单独控制。