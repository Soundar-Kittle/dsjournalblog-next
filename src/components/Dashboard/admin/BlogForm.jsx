"use client";

import { useState } from "react";
import CKEditorField from "../Journals/Article/CKEditorField";
import MultiSelectInput from "@/components/ui/MultiSelectInput";



export default function BlogForm({
    action,
    authors = [],
    categories = [],
    tags = [],
}) {
    const [content, setContent] = useState("");

    return (
        <form action={action} className="space-y-6 max-w-5xl">
            {/* TITLE */}
            <div>
                <label className="block font-medium mb-1">Title</label>
                <input
                    name="title"
                    required
                    className="w-full border rounded px-3 py-2"
                />
            </div>

            {/* EXCERPT */}
            <div>
                <label className="block font-medium mb-1">Excerpt</label>
                <textarea
                    name="excerpt"
                    rows={3}
                    className="w-full border rounded px-3 py-2"
                />
            </div>

            {/* AUTHOR */}
            <div>
                <label className="block font-medium mb-1">Author</label>
                <select name="authorId" className="border rounded px-3 py-2 w-full">
                    <option value="">Select author</option>
                    {authors.map((a) => (
                        <option key={a.id} value={a.id}>
                            {a.name}
                        </option>
                    ))}
                </select>
            </div>

            {/* CONTENT (CKEDITOR) */}
            {/* CONTENT (CKEDITOR) */}
            <div className="relative z-10">
                <label className="block font-medium mb-1">Content</label>

                <div className="relative isolate">
                    <CKEditorField
                        value={content}
                        onChange={(data) => setContent(data)}
                        placeholder="Write blog content here…"
                    />
                </div>

                <input type="hidden" name="content" value={content} />
            </div>

            {/* CATEGORIES */}
            <MultiSelectInput
                label="Categories"
                name="categories"
                items={categories}
                placeholder="Add new category..."
                allowCustom={true}
            />


            {/* TAGS */}
            <MultiSelectInput
                label="Tags"
                name="tags"
                items={tags}
                placeholder="Add new tag..."
                allowCustom={true}
            />


            {/* STATUS */}
            <div>
                <label className="block font-medium mb-1">Status</label>
                <select
                    name="status"
                    defaultValue="DRAFT"
                    className="border rounded px-3 py-2"
                >
                    <option value="DRAFT">Draft</option>
                    <option value="PUBLISHED">Published</option>
                </select>
            </div>

            {/* SUBMIT */}
            <div className="pt-4">
                <button className="px-6 py-2 bg-black text-white rounded">
                    Save Blog Post
                </button>
            </div>
        </form>
    );
}
