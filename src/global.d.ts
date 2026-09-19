type ClientEnv = typeof import("astro:env/client");

declare module "*.typ?html&body" {
  const Component: import("astro/runtime/server/index.js").AstroComponentFactory;
  export default Component;
}

interface Window {
  postServer(
    url: string,
    opts?: { headers?: Record<string, string>; body?: any; method?: string }
  ): Promise<any>;
}
