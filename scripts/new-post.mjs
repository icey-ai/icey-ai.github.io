import { mkdir, writeFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';

const [slug, title = slug, ...extra] = process.argv.slice(2);
if (slug === '--help' || slug === '-h') {
  console.log('用法：pnpm new <英文短横线文件名> "文章标题"');
  process.exit(0);
}
if (!slug || !/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(slug) || extra.length) {
  console.error('用法：pnpm new my-first-post "我的第一篇文章"');
  process.exit(1);
}

const directory = new URL('../content/article/', import.meta.url);
const file = new URL(`${slug}.typ`, directory);
const source = `#import "/typ/templates/blog.typ": *
#import "/typ/templates/article-helpers.typ": *
#show: main.with(
  title: ${JSON.stringify(title)},
  desc: "",
  date: "${new Date().toISOString().slice(0, 10)}",
  tags: (),
  // 图片放入 public/assets/images/headers/，这里填写网站路径：
  // cover: "/assets/images/headers/my-cover.jpg",
  draft: true,
)

= 开始

在这里开始写作。

// 证明块：#proof[在这里写证明和公式。]
// 自定义标题并默认展开：#proof(title: "Proof", open: true)[证明内容。]
`;
try {
  await mkdir(directory, { recursive: true });
  await writeFile(file, source, { encoding: 'utf8', flag: 'wx' });
  console.log(`已创建 ${fileURLToPath(file)}\n将 draft 改为 false 后，文章会出现在网站上。`);
} catch (error) {
  if (error.code === 'EEXIST') {
    console.error(`文章已存在：${slug}.typ`);
    process.exitCode = 1;
  } else {
    throw error;
  }
}
