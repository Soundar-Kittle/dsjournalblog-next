export const runtime = "nodejs";

import { prisma } from "@/lib/prisma";
import BlogForm from "@/components/Dashboard/admin/BlogForm";
import { createBlogPost } from "../actions";

export default async function CreateBlogPage() {
    const [authors, categories, tags] = await Promise.all([
        prisma.blogAuthor.findMany({ orderBy: { name: "asc" } }),
        prisma.blogCategory.findMany({ orderBy: { name: "asc" } }),
        prisma.blogTag.findMany({ orderBy: { name: "asc" } }),
    ]);

    return (
        <div className="p-6">
            <h1 className="text-2xl font-semibold mb-6">
                Create Blog Post
            </h1>

            <BlogForm
                action={createBlogPost}
                authors={authors}
                categories={categories}
                tags={tags}
            />
        </div>
    );
}
