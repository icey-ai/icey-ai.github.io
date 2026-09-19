import { publishedPosts, postUrl } from "../lib/posts";
export async function GET() {
  return Response.json((await publishedPosts()).map(post => ({ id: post.id, url: postUrl(post), ...post.data })));
}
