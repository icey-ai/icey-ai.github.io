import { getCollection, type CollectionEntry } from "astro:content";
export type Post = CollectionEntry<"blog">;
export function postUrl(post: Post) {
  return post.data.permalink ?? `/article/${post.id}/`;
}
export async function publishedPosts() {
  return (await getCollection("blog", ({ data }) => !data.draft))
    .sort((a, b) => b.data.date.valueOf() - a.data.date.valueOf());
}
export function tagUrl(tag: string) {
  return `/tags/${encodeURIComponent(tag)}/`;
}
