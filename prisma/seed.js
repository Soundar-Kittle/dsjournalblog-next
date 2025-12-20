const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
    console.log('Starting seed...');

    // Seed Blog Categories
    const categories = [
        { name: 'Technology', slug: 'technology' },
        { name: 'Programming', slug: 'programming' },
        { name: 'Web Development', slug: 'web-development' },
        { name: 'Mobile Development', slug: 'mobile-development' },
        { name: 'AI & Machine Learning', slug: 'ai-machine-learning' },
        { name: 'DevOps', slug: 'devops' },
        { name: 'Database', slug: 'database' },
        { name: 'Cloud Computing', slug: 'cloud-computing' },
        { name: 'Cybersecurity', slug: 'cybersecurity' },
        { name: 'Design', slug: 'design' },
        { name: 'Tutorial', slug: 'tutorial' },
        { name: 'News', slug: 'news' },
        { name: 'Opinion', slug: 'opinion' },
        { name: 'Career', slug: 'career' },
        { name: 'Best Practices', slug: 'best-practices' },
    ];

    console.log('Seeding categories...');
    for (const category of categories) {
        await prisma.blogCategory.upsert({
            where: { slug: category.slug },
            update: {},
            create: category,
        });
    }
    console.log(`✓ Created ${categories.length} categories`);

    // Seed Blog Tags
    const tags = [
        { name: 'JavaScript', slug: 'javascript' },
        { name: 'TypeScript', slug: 'typescript' },
        { name: 'React', slug: 'react' },
        { name: 'Next.js', slug: 'nextjs' },
        { name: 'Node.js', slug: 'nodejs' },
        { name: 'Python', slug: 'python' },
        { name: 'Java', slug: 'java' },
        { name: 'C#', slug: 'csharp' },
        { name: 'PHP', slug: 'php' },
        { name: 'Ruby', slug: 'ruby' },
        { name: 'Go', slug: 'go' },
        { name: 'Rust', slug: 'rust' },
        { name: 'Docker', slug: 'docker' },
        { name: 'Kubernetes', slug: 'kubernetes' },
        { name: 'AWS', slug: 'aws' },
        { name: 'Azure', slug: 'azure' },
        { name: 'GCP', slug: 'gcp' },
        { name: 'MongoDB', slug: 'mongodb' },
        { name: 'PostgreSQL', slug: 'postgresql' },
        { name: 'MySQL', slug: 'mysql' },
        { name: 'GraphQL', slug: 'graphql' },
        { name: 'REST API', slug: 'rest-api' },
        { name: 'Git', slug: 'git' },
        { name: 'Testing', slug: 'testing' },
        { name: 'Performance', slug: 'performance' },
    ];

    console.log('Seeding tags...');
    for (const tag of tags) {
        await prisma.blogTag.upsert({
            where: { slug: tag.slug },
            update: {},
            create: tag,
        });
    }
    console.log(`✓ Created ${tags.length} tags`);

    // Seed a sample author (optional)
    const author = await prisma.blogAuthor.upsert({
        where: { email: 'admin@example.com' },
        update: {},
        create: {
            name: 'Admin User',
            email: 'admin@example.com',
            bio: 'Blog administrator and content creator',
        },
    });
    console.log('✓ Created sample author');

    console.log('Seed completed successfully!');
}

main()
    .catch((e) => {
        console.error('Error during seed:', e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
