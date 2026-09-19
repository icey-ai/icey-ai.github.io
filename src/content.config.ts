import { glob } from "astro/loaders";
import { defineCollection } from "astro:content";
import { z } from "astro/zod";

export const collections = {
  blog: defineCollection({
    loader: glob({ base: "./content/article", pattern: "**/*.typ" }),
    schema: z.object({
      title: z.string(),
      author: z.string().default("Icey AI"),
      description: z.string().default(""),
      date: z.coerce.date(),
      updatedDate: z.coerce.date().optional(),
      image: z.string().optional(),
      tags: z.array(z.string()).default([]),
      categories: z.array(z.string()).default([]),
      lang: z.string().default("zh"),
      permalink: z.string().regex(/^\/(?!\/).*\/$/).optional(),
      draft: z.boolean().default(false),
    }),
  }),
};
