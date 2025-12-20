"use server";

import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import slugify from "slugify";

export async function createBlogPost(formData) {
    const title = formData.get("title");
    const excerpt = formData.get("excerpt");
    const content = formData.get("content");
    const status = formData.get("status");
    const authorId = Number(formData.get("authorId") || null);

    // Get existing category and tag IDs
    const categoryIds = formData.getAll("categories").map(Number);
    const tagIds = formData.getAll("tags").map(Number);

    // Get new category and tag names
    const newCategoryNames = formData.getAll("categoriesNew");
    const newTagNames = formData.getAll("tagsNew");

    if (!title || !content) {
        throw new Error("Title and content are required");
    }

    const slug = slugify(title, { lower: true, strict: true });

    // Create or find categories (prevent duplicate slug errors)
    const createdCategories = await Promise.all(
        newCategoryNames.map(async (name) => {
            const categorySlug = slugify(name, { lower: true, strict: true });

            // Try to find existing category with this slug
            const existing = await prisma.blogCategory.findUnique({
                where: { slug: categorySlug },
            });

            if (existing) {
                return existing;
            }

            // If not found, create new one
            return prisma.blogCategory.create({
                data: {
                    name,
                    slug: categorySlug,
                },
            });
        })
    );

    // Create or find tags (prevent duplicate slug errors)
    const createdTags = await Promise.all(
        newTagNames.map(async (name) => {
            const tagSlug = slugify(name, { lower: true, strict: true });

            // Try to find existing tag with this slug
            const existing = await prisma.blogTag.findUnique({
                where: { slug: tagSlug },
            });

            if (existing) {
                return existing;
            }

            // If not found, create new one
            return prisma.blogTag.create({
                data: {
                    name,
                    slug: tagSlug,
                },
            });
        })
    );

    // Combine existing and new IDs
    const allCategoryIds = [
        ...categoryIds,
        ...createdCategories.map((c) => c.id),
    ];
    const allTagIds = [...tagIds, ...createdTags.map((t) => t.id)];

    await prisma.blogPost.create({
        data: {
            title,
            slug,
            excerpt,
            content,
            status,
            publishedAt: status === "PUBLISHED" ? new Date() : null,
            authorId,
            categories: {
                connect: allCategoryIds.map((id) => ({ id })),
            },
            tags: {
                connect: allTagIds.map((id) => ({ id })),
            },
        },
    });

    revalidatePath("/admin/dashboard/blog");
}
