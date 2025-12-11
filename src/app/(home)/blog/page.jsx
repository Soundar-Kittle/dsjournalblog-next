import { notFound } from "next/navigation";
import PageHeader from "@/components/Home/PageHeader";
import Breadcrumbs from "@/components/ui/Breadcrumbs";


export async function generateStaticParams() {
    return []; // add slugs if needed
}

export default async function BlogPost({ params }) {
    const { slug } = params;

    // Example: Replace with DB/API call
    const article = {
        title: `Blog: ${slug}`,
        content: "<p>This is a dynamic blog article page.</p>",
    };

    if (!article) return notFound();

    return (
        <div className="bg-white">
            <PageHeader title="Blog" />
            <Breadcrumbs
                parents={[{ menu_label: "Blog", menu_link: "/blog" }]}
            />
            <div className="">
                <h1 className="text-4xl font-bold mb-6">{article?.title ? article?.title : ""}</h1>

                <div
                    className="prose"
                    dangerouslySetInnerHTML={{ __html: article?.content ? article?.content : "" }}
                />
            </div>
        </div>
    );
}
