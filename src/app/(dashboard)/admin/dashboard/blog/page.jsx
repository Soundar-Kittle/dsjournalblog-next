import React from 'react';
import Link from 'next/link';

const page = () => {
    return (
        <div>
            <Link
                href="/admin/dashboard/blog/create-blog"
                className="px-4 py-2 bg-black text-white rounded"
            >
                + New Post
            </Link>
        </div>
    )
}

export default page