-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 20, 2025 at 03:57 AM
-- Server version: 8.0.41
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dsjournal_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogauthor`
--

DROP TABLE IF EXISTS `blogauthor`;
CREATE TABLE IF NOT EXISTS `blogauthor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `BlogAuthor_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogauthor`
--

INSERT INTO `blogauthor` (`id`, `name`, `email`, `avatar`, `bio`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, 'Blog administrator and content creator', '2025-12-19 17:26:28.505', '2025-12-19 17:26:28.505');

-- --------------------------------------------------------

--
-- Table structure for table `blogcategory`
--

DROP TABLE IF EXISTS `blogcategory`;
CREATE TABLE IF NOT EXISTS `blogcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `BlogCategory_slug_key` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogcategory`
--

INSERT INTO `blogcategory` (`id`, `name`, `slug`, `createdAt`, `updatedAt`) VALUES
(1, 'Technology', 'technology', '2025-12-19 17:26:28.151', '2025-12-19 17:26:28.151'),
(2, 'Programming', 'programming', '2025-12-19 17:26:28.199', '2025-12-19 17:26:28.199'),
(3, 'Web Development', 'web-development', '2025-12-19 17:26:28.209', '2025-12-19 17:26:28.209'),
(4, 'Mobile Development', 'mobile-development', '2025-12-19 17:26:28.221', '2025-12-19 17:26:28.221'),
(5, 'AI & Machine Learning', 'ai-machine-learning', '2025-12-19 17:26:28.232', '2025-12-19 17:26:28.232'),
(6, 'DevOps', 'devops', '2025-12-19 17:26:28.239', '2025-12-19 17:26:28.239'),
(7, 'Database', 'database', '2025-12-19 17:26:28.248', '2025-12-19 17:26:28.248'),
(8, 'Cloud Computing', 'cloud-computing', '2025-12-19 17:26:28.257', '2025-12-19 17:26:28.257'),
(9, 'Cybersecurity', 'cybersecurity', '2025-12-19 17:26:28.267', '2025-12-19 17:26:28.267'),
(10, 'Design', 'design', '2025-12-19 17:26:28.277', '2025-12-19 17:26:28.277'),
(11, 'Tutorial', 'tutorial', '2025-12-19 17:26:28.286', '2025-12-19 17:26:28.286'),
(12, 'News', 'news', '2025-12-19 17:26:28.295', '2025-12-19 17:26:28.295'),
(13, 'Opinion', 'opinion', '2025-12-19 17:26:28.302', '2025-12-19 17:26:28.302'),
(14, 'Career', 'career', '2025-12-19 17:26:28.310', '2025-12-19 17:26:28.310'),
(15, 'Best Practices', 'best-practices', '2025-12-19 17:26:28.317', '2025-12-19 17:26:28.317'),
(16, 'Journal', 'journal', '2025-12-19 17:34:31.581', '2025-12-19 17:34:31.581');

-- --------------------------------------------------------

--
-- Table structure for table `blogpost`
--

DROP TABLE IF EXISTS `blogpost`;
CREATE TABLE IF NOT EXISTS `blogpost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `coverImage` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('DRAFT','PUBLISHED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `publishedAt` datetime(3) DEFAULT NULL,
  `authorId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `BlogPost_slug_key` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogpost`
--

INSERT INTO `blogpost` (`id`, `slug`, `title`, `excerpt`, `content`, `coverImage`, `status`, `publishedAt`, `authorId`, `createdAt`, `updatedAt`) VALUES
(1, 'this-is-sample-journal-for-title-we-place-like', 'This is Sample Journal for title we place like', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ', '<h2 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:DauphinPlain;font-size:24px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:24px;margin:0px 0px 10px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">What is Lorem Ipsum?</h2><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong style=\"margin:0px;padding:0px;\">Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br><br>Where does it come from?</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<br>Why do we use it?</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br>Where can I get some?</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, 'DRAFT', NULL, 1, '2025-12-19 17:34:31.626', '2025-12-19 17:34:31.626'),
(2, 'sample-title-for-title', 'sample title for title', 'sample except', '<h2 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:DauphinPlain;font-size:24px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:24px;margin:0px 0px 10px;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">Where can I get some?</h2><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:&quot;Open Sans&quot;, Arial, sans-serif;font-size:14px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 15px;orphans:2;padding:0px;text-align:justify;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, 'DRAFT', NULL, 1, '2025-12-19 17:54:50.370', '2025-12-19 17:54:50.370');

-- --------------------------------------------------------

--
-- Table structure for table `blogtag`
--

DROP TABLE IF EXISTS `blogtag`;
CREATE TABLE IF NOT EXISTS `blogtag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `BlogTag_slug_key` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogtag`
--

INSERT INTO `blogtag` (`id`, `name`, `slug`, `createdAt`, `updatedAt`) VALUES
(1, 'JavaScript', 'javascript', '2025-12-19 17:26:28.324', '2025-12-19 17:26:28.324'),
(2, 'TypeScript', 'typescript', '2025-12-19 17:26:28.334', '2025-12-19 17:26:28.334'),
(3, 'React', 'react', '2025-12-19 17:26:28.343', '2025-12-19 17:26:28.343'),
(4, 'Next.js', 'nextjs', '2025-12-19 17:26:28.349', '2025-12-19 17:26:28.349'),
(5, 'Node.js', 'nodejs', '2025-12-19 17:26:28.356', '2025-12-19 17:26:28.356'),
(6, 'Python', 'python', '2025-12-19 17:26:28.362', '2025-12-19 17:26:28.362'),
(7, 'Java', 'java', '2025-12-19 17:26:28.370', '2025-12-19 17:26:28.370'),
(8, 'C#', 'csharp', '2025-12-19 17:26:28.377', '2025-12-19 17:26:28.377'),
(9, 'PHP', 'php', '2025-12-19 17:26:28.383', '2025-12-19 17:26:28.383'),
(10, 'Ruby', 'ruby', '2025-12-19 17:26:28.392', '2025-12-19 17:26:28.392'),
(11, 'Go', 'go', '2025-12-19 17:26:28.400', '2025-12-19 17:26:28.400'),
(12, 'Rust', 'rust', '2025-12-19 17:26:28.408', '2025-12-19 17:26:28.408'),
(13, 'Docker', 'docker', '2025-12-19 17:26:28.414', '2025-12-19 17:26:28.414'),
(14, 'Kubernetes', 'kubernetes', '2025-12-19 17:26:28.421', '2025-12-19 17:26:28.421'),
(15, 'AWS', 'aws', '2025-12-19 17:26:28.427', '2025-12-19 17:26:28.427'),
(16, 'Azure', 'azure', '2025-12-19 17:26:28.434', '2025-12-19 17:26:28.434'),
(17, 'GCP', 'gcp', '2025-12-19 17:26:28.440', '2025-12-19 17:26:28.440'),
(18, 'MongoDB', 'mongodb', '2025-12-19 17:26:28.447', '2025-12-19 17:26:28.447'),
(19, 'PostgreSQL', 'postgresql', '2025-12-19 17:26:28.454', '2025-12-19 17:26:28.454'),
(20, 'MySQL', 'mysql', '2025-12-19 17:26:28.462', '2025-12-19 17:26:28.462'),
(21, 'GraphQL', 'graphql', '2025-12-19 17:26:28.469', '2025-12-19 17:26:28.469'),
(22, 'REST API', 'rest-api', '2025-12-19 17:26:28.476', '2025-12-19 17:26:28.476'),
(23, 'Git', 'git', '2025-12-19 17:26:28.483', '2025-12-19 17:26:28.483'),
(24, 'Testing', 'testing', '2025-12-19 17:26:28.490', '2025-12-19 17:26:28.490'),
(25, 'Performance', 'performance', '2025-12-19 17:26:28.497', '2025-12-19 17:26:28.497');

-- --------------------------------------------------------

--
-- Table structure for table `_postcategories`
--

DROP TABLE IF EXISTS `_postcategories`;
CREATE TABLE IF NOT EXISTS `_postcategories` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_PostCategories_AB_unique` (`A`,`B`),
  KEY `_PostCategories_B_index` (`B`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_postcategories`
--

INSERT INTO `_postcategories` (`A`, `B`) VALUES
(16, 1),
(16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `_posttags`
--

DROP TABLE IF EXISTS `_posttags`;
CREATE TABLE IF NOT EXISTS `_posttags` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_PostTags_AB_unique` (`A`,`B`),
  KEY `_PostTags_B_index` (`B`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
CREATE TABLE IF NOT EXISTS `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('bbc768d6-d2ea-48c5-8fb8-fe93140ecba0', '18c034f870d46ff548a1042d2d926a91c3f65fb778b434f829ddc277458a3e54', '2025-12-11 18:22:36.092', '20251211182235_init_blog', NULL, NULL, '2025-12-11 18:22:35.851', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
