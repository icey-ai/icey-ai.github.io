// @ts-check
import { defineConfig, envField } from "astro/config";
import sitemap from "@astrojs/sitemap";
import { typst } from "astro-typst";
import { loadEnv } from "vite";
import { tylant } from "@myriaddreamin/tylant";
import { resolve } from "node:path";
import rehypeTypstMath from "./src/plugins/rehype-typst-math.mjs";

// Please check `defineConfig/env` in astro.config.mjs for schema
const e = loadEnv(process.env.NODE_ENV || "", process.cwd(), "");
const {
  SITE,
  SITE_TITLE,
  URL_BASE,
  SITE_DESCRIPTION,
  SITE_OWNER,
  SITE_SOURCE_URL,
  SITE_LOGO,
} = e;

const EnvStr = (optional = true) =>
  envField.string({ context: "client", access: "public", optional });
const MustEnvStr = (optional = false) => EnvStr(optional);

export default defineConfig({
  // Whether to prefetch links while hovering.
  // See: https://docs.astro.build/en/guides/prefetch/
  prefetch: {
    prefetchAll: true,
  },

  site: SITE,
  base: URL_BASE || "/",
  trailingSlash: "always",

  markdown: {
    // astro-typst 0.12.4 still reads this legacy option on Astro 6 and passes
    // native MathML through it. Move when upstream supports the processor API.
    rehypePlugins: [rehypeTypstMath],
  },

  env: {
    schema: {
      SITE: MustEnvStr(),
      URL_BASE: EnvStr(),

      SITE_TITLE: EnvStr(),
      SITE_INDEX_TITLE: EnvStr(),
      SITE_DESCRIPTION: EnvStr(),

      // # Please remove them if you don't like to use backend.
      // `;` separated list of backend addresses
      BACKEND_ADDR: EnvStr(),
      BAIDU_VERIFICATION_CODE: EnvStr(),
      SITE_OWNER: EnvStr(),
      SITE_SOURCE_URL: EnvStr(),
    },
  },

  integrations: [
    sitemap({
      // Only canonical pages belong in the sitemap, not static redirect aliases.
      filter: (page) => {
        const path = new URL(page).pathname;
        return ![
          "/article/", "/friend/",
          "/article/calculus-on-manifold/", "/article/turing-machines/", "/article/cmu-15-855-ps1/",
        ].includes(path);
      },
    }),
    typst({
      // Always builds HTML files
      target: "html",
    }),
    tylant({
      title: SITE_TITLE,
      urlBase: (URL_BASE || "").replace(/\/$/, ""),
      locales: { root: { label: "简体中文", lang: "zh" } },
      description: SITE_DESCRIPTION,
      siteOwner: SITE_OWNER,
      siteSourceUrl: SITE_SOURCE_URL,
      siteLogo: SITE_LOGO,
      layouts: { minimal: {} },

      components: {
        minimal: {
          BaseHead: resolve("./src/components/BaseHead.astro"),
        },
      },
    }),
  ],

  vite: {
    build: {
      assetsInlineLimit(filePath, content) {
        const KB = 1024;
        return content.length < (filePath.endsWith(".css") ? 100 * KB : 4 * KB);
      },
    },
    ssr: {
      external: ["@myriaddreamin/typst-ts-node-compiler"],
      noExternal: ["@fontsource-variable/source-serif-4", "lxgw-wenkai-screen-web"],
    },
  },
});
