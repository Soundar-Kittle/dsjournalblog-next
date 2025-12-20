"use server";

import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import slugify from "slugify";

export async function createPost(formData) {
    const title = formData.get("title");
    const excerpt = formData.get("excerpt");
    const content = formData.get("content");
    const status = formData.get("status");
    const authorId = Number(formData.get("authorId"));

    const categoryIds = formData.getAll("categories").map(Number);
    const tagIds = formData.getAll("tags").map(Number);

    const slug = slugify(title, { lower: true, strict: true });

    await prisma.blogpost.create({
        data: {
            title,
            slug,
            excerpt,
            content,
            status,
            authorId,
            publishedAt: status === "PUBLISHED" ? new Date() : null,
            categories: {
                connect: categoryIds.map((id) => ({ id })),
            },
            tags: {
                connect: tagIds.map((id) => ({ id })),
            },
        },
    });

    revalidatePath("/admin/dashboard/blog");
}
