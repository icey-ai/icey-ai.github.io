// 可复制到 content/article/，也可运行 pnpm new 创建空白文章。
// 本目录不参与网站发布；复制后仍需将 draft 改为 false 才会发布。
#import "/typ/templates/blog.typ": *
#import "/typ/templates/article-helpers.typ": *
#show: main.with(
  title: "文章写作示例",
  desc: "头图、正文图片和折叠证明的用法。",
  date: "2026-09-19",
  lang: "zh",
  tags: ("math",),
  // public/ 下的文件会复制到网站根目录，cover 不写 /public 前缀。
  cover: "/assets/images/headers/2025-03-19-Calculus on Manifold.png",
  draft: true,
)

= 一个命题 <example>

对于实数 $a, b$，有 $a^2 + b^2 >= 2 a b$。

// 默认标题“证明”，默认折叠。
#proof[
  由平方非负可得：

  $ (a - b)^2 >= 0 => a^2 + b^2 >= 2 a b. $
]

// 可以改标题、默认展开，也可以在证明中使用普通 Typst 内容。
#proof(title: "Proof", open: true)[
  Equality holds if and only if $a = b$.
]

// 兼容迁移前已经使用的辅助函数，也适合“提示”“解答”等内容。
#details("提示")[从 $(a - b)^2$ 出发。]

= 正文图片

// 正文 image 读取的是仓库里的文件，所以需要 /public 前缀。
#figure(
  image("/public/assets/images/headers/2025-03-19-Calculus on Manifold.png", alt: "流形上的分析笔记头图"),
  caption: [示例图片。],
)
