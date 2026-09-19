import rss from "@astrojs/rss";
import type { APIContext } from "astro";
import { kSiteTitle, kSiteDescription } from "$consts";
import { publishedPosts, postUrl } from "../lib/posts";

export async function GET(context: APIContext) {
  return rss({
    title: kSiteTitle, description: kSiteDescription, site: context.site!,
    items: (await publishedPosts()).map(post => ({
      title: post.data.title, description: post.data.description,
      pubDate: post.data.date, categories: post.data.tags, link: postUrl(post),
    })),
    customData: "<language>zh-CN</language>",
  });
}
