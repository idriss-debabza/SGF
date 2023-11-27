-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 27 nov. 2023 à 13:16
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omekas`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE IF NOT EXISTS `api_key` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C912ED9D7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('0F6w9CdbGeBLc13ot9sdej78BgwSDsRx', 1, 'rayan', '$2y$10$XCsEAMfU6DXO/IYzMQr56ew526h3wzuWZeVsFwr7kMwV/i47sW8cq', 0x00000000000000000000000000000001, '2023-11-27 13:08:20', '2023-11-19 21:08:48');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `asset`
--

INSERT INTO `asset` (`id`, `owner_id`, `name`, `media_type`, `storage_id`, `extension`, `alt_text`) VALUES
(1, 1, '124441145_185368843164850_1550900648774087860_n.jpg', 'image/jpeg', '81ce1b03039e24d75f013d1b67bda53cde52f846', 'jpg', '');

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE IF NOT EXISTS `fulltext_search` (
  `id` int NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`resource`),
  KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(3, 'items', 1, 1, 'Rayan', 'rayan.koussa@outlook.fr\n1\n1\n1\n1\n1\n1\n100\nGeemeau96\nKOUSSA\n50\n100\nRayan\nRayan'),
(3, 'site_pages', 1, 1, 'Profil', 'Rayan\nTeste\r\n'),
(23, 'items', 1, 1, NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int NOT NULL,
  `primary_media_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(3, NULL),
(23, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE IF NOT EXISTS `item_item_set` (
  `item_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`item_set_id`),
  KEY `IDX_6D0C9625126F525E` (`item_id`),
  KEY `IDX_6D0C9625960278D7` (`item_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE IF NOT EXISTS `item_set` (
  `id` int NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE IF NOT EXISTS `item_site` (
  `item_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`site_id`),
  KEY `IDX_A1734D1F126F525E` (`item_id`),
  KEY `IDX_A1734D1FF6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(3, 2),
(23, 2);

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `ingester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int DEFAULT NULL,
  `lang` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  KEY `IDX_6A2CA10C126F525E` (`item_id`),
  KEY `item_position` (`item_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230601060113'),
('20230713101012');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE IF NOT EXISTS `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('qmKzNWiY9kPs7aNXNyC3IfhSLquYAOnk', 2, '2023-11-27 11:53:18', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(247, 1, 8, 'username', 'nom d\'utilisateur', 'Le nom d\'utilisateur de l\'utilisateur'),
(248, 1, 8, 'email', 'email', 'L\'adresse email de l\'utilisateur'),
(249, 1, 8, 'password', 'mot de passe', 'Le mot de passe de l\'utilisateur'),
(250, 1, 8, 'loyaltyPoints', 'points de fidélité', 'Les points de fidélité de l\'utilisateur'),
(251, 1, 8, 'hasOrder', 'a une commande', 'L\'utilisateur a passé une commande'),
(252, 1, 8, 'orderNumber', 'numéro de commande', 'Le numéro de la commande'),
(253, 1, 8, 'productName', 'nom du produit', 'Le nom du produit'),
(254, 1, 8, 'productLoyaltyPoints', 'points de fidélité du produit', 'Les points de fidélité gagnés en achetant le produit'),
(255, 1, 9, 'ID_Utilisateur', 'ID_Utilisateur', NULL),
(256, 1, 9, 'Nom', 'Nom', NULL),
(257, 1, 9, 'Prenom', 'Prenom', NULL),
(258, 1, 9, 'Email', 'Email', NULL),
(259, 1, 9, 'MotDePasse', 'MotDePasse', NULL),
(260, 1, 9, 'AutresInfos', 'AutresInfos', NULL),
(261, 1, 9, 'ID_Achat', 'ID_Achat', NULL),
(262, 1, 9, 'ID_Utilisateur_Achat', 'ID_Utilisateur_Achat', NULL),
(263, 1, 9, 'DateAchat', 'DateAchat', NULL),
(264, 1, 9, 'MontantTotal', 'MontantTotal', NULL),
(265, 1, 9, 'ID_Produit', 'ID_Produit', NULL),
(266, 1, 9, 'NomProduit', 'NomProduit', NULL),
(267, 1, 9, 'Description', 'Description', NULL),
(268, 1, 9, 'Prix', 'Prix', NULL),
(269, 1, 9, 'StockDisponible', 'StockDisponible', NULL),
(270, 1, 9, 'ID_Point', 'ID_Point', NULL),
(271, 1, 9, 'ID_Utilisateur_Points', 'ID_Utilisateur_Points', NULL),
(272, 1, 9, 'NombrePoints', 'NombrePoints', NULL),
(273, 1, 9, 'ID_Historique', 'ID_Historique', NULL),
(274, 1, 9, 'ID_Utilisateur_Historique', 'ID_Utilisateur_Historique', NULL),
(275, 1, 9, 'NombrePoints_Historique', 'NombrePoints_Historique', NULL),
(276, 1, 9, 'TypeOperation', 'TypeOperation', NULL),
(277, 1, 9, 'DateOperation', 'DateOperation', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `resource_template_id` int DEFAULT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  KEY `title` (`title`(190))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(3, 1, 115, 7, NULL, 'Rayan', 1, '2023-11-26 17:39:39', '2023-11-26 17:40:56', 'Omeka\\Entity\\Item'),
(23, 1, 2, 7, NULL, NULL, 1, '2023-11-27 13:08:20', '2023-11-27 13:08:20', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE IF NOT EXISTS `resource_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(112, 1, 8, 'user', 'Utilisateur', 'Un utilisateur du site e-commerce'),
(113, 1, 8, 'order', 'Commande', 'Une commande passée par un utilisateur'),
(114, 1, 8, 'product', 'Produit', 'Un produit acheté dans une commande'),
(115, NULL, 9, 'Utilisateurs', 'Utilisateurs', NULL),
(116, NULL, 9, 'Achats', 'Achats', NULL),
(117, NULL, 9, 'Produits', 'Produits', NULL),
(118, NULL, 9, 'PointsFidelite', 'PointsFidelite', NULL),
(119, NULL, 9, 'HistoriquePoints', 'HistoriquePoints', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE IF NOT EXISTS `resource_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `title_property_id` int DEFAULT NULL,
  `description_property_id` int DEFAULT NULL,
  `label` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(7, 1, NULL, NULL, NULL, 'Shop');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
CREATE TABLE IF NOT EXISTS `resource_template_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_template_id` int NOT NULL,
  `property_id` int NOT NULL,
  `alternate_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `data_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  KEY `IDX_4689E2F1549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(48, 7, 260, NULL, NULL, 1, NULL, 0, 0, NULL),
(49, 7, 263, NULL, NULL, 2, NULL, 0, 0, NULL),
(50, 7, 277, NULL, NULL, 3, NULL, 0, 0, NULL),
(51, 7, 267, NULL, NULL, 4, NULL, 0, 0, NULL),
(52, 7, 258, NULL, NULL, 5, NULL, 0, 0, NULL),
(53, 7, 261, NULL, NULL, 6, NULL, 0, 0, NULL),
(54, 7, 273, NULL, NULL, 7, NULL, 0, 0, NULL),
(55, 7, 270, NULL, NULL, 8, NULL, 0, 0, NULL),
(56, 7, 265, NULL, NULL, 9, NULL, 0, 0, NULL),
(57, 7, 255, NULL, NULL, 10, NULL, 0, 0, NULL),
(58, 7, 262, NULL, NULL, 11, NULL, 0, 0, NULL),
(59, 7, 274, NULL, NULL, 12, NULL, 0, 0, NULL),
(60, 7, 271, NULL, NULL, 13, NULL, 0, 0, NULL),
(61, 7, 264, NULL, NULL, 14, NULL, 0, 0, NULL),
(62, 7, 259, NULL, NULL, 15, NULL, 0, 0, NULL),
(63, 7, 256, NULL, NULL, 16, NULL, 0, 0, NULL),
(64, 7, 272, NULL, NULL, 17, NULL, 0, 0, NULL),
(65, 7, 275, NULL, NULL, 18, NULL, 0, 0, NULL),
(66, 7, 266, NULL, NULL, 19, NULL, 0, 0, NULL),
(67, 7, 257, NULL, NULL, 20, NULL, 0, 0, NULL),
(68, 7, 268, NULL, NULL, 21, NULL, 0, 0, NULL),
(69, 7, 269, NULL, NULL, 22, NULL, 0, 0, NULL),
(70, 7, 276, NULL, NULL, 23, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('8co493la9fud36aqmmf7ovqbtv', 0x5f5f4c616d696e61737c613a31323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313031323732372e3637313734393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22676b646e31386e323837756f386a6e6f706371657233716e7075223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393033333135363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313031353936393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313031363331353b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313031363139313b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393236383831343b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393034323032363b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393034323034363b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303437343739353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313031363031333b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303433363833323b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226365663562373861666136346261313861366433353936353730313066326333223b733a33323a223038363931316563316664643930333631393232303664383632313330653230223b7d733a343a2268617368223b733a36353a2230383639313165633166646439303336313932323036643836323133306532302d6365663562373861666136346261313861366433353936353730313066326333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223762373865653331326236646534316238363566633638336365613634366661223b733a33323a223864333862313931326364303036623839353763626665653431653764306233223b7d733a343a2268617368223b733a36353a2238643338623139313263643030366238393537636266656534316537643062332d3762373865653331326236646534316238363566633638336365613634366661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223064643864653635333030396164326435646137633232656135623062306138223b733a33323a223134333863613332383039653365343634306461306638353134306366363838223b733a33323a223061326539383366386363383764323433636231653731346238303034363032223b733a33323a223730313636653238316562343361313931626330646130316237636362336439223b733a33323a223666653434646438336665633630313832626532623734343663666337646530223b733a33323a223132653135303832356461386264366437333562653835303035373034373963223b733a33323a226565373265396232356363666163643464326333313563646562663539396639223b733a33323a223334653063656266643435646530356537346535613333623161373936396666223b733a33323a223532343335353338356666646238356664653633653335376639636131393539223b733a33323a226134346661383632346436303761366333323238393638626635613665313061223b7d733a343a2268617368223b733a36353a2261343466613836323464363037613663333232383936386266356136653130612d3532343335353338356666646238356664653633653335376639636131393539223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223933663431373337666639386532633563343361643561303133353433643632223b733a33323a226366386136386435656630303564626564326131303736666262386561643834223b733a33323a223063633633646262373934316164393536343130616361386234333861653432223b733a33323a226662643363366133316437323038626234373432323963336362356361663664223b733a33323a223132343966626333383732616366656438636333356166323939653934323964223b733a33323a223232636139646336666536353833386333316532613861396534616333366366223b733a33323a223566396463356466336535616462636332353331363830663561346133336338223b733a33323a226438653037326365303762613737613435656565666363303135363837383433223b733a33323a223865326265666263383533346630366132643364393065343335393130653633223b733a33323a223030623261323936366331373532613233613134646632623562333535636436223b733a33323a223963623738366531316463323230363366633333366634646333643230373963223b733a33323a223762613735393238356336393135386230326132386531373536363737653065223b733a33323a226264363837613737653931396237353463663730643830396664336535326634223b733a33323a226334646635646564343834303532336361373461333334343336353162653363223b733a33323a223630303234376264633838323364643238396436623262376634353761306437223b733a33323a226132316465383364343134383336373863346265343039663061343737626262223b7d733a343a2268617368223b733a36353a2261323164653833643431343833363738633462653430396630613437376262622d3630303234376264633838323364643238396436623262376634353761306437223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226465323435383731376264386333366230386339663232663239363432383062223b733a33323a226336333337303862326336373237366530383939623938353135323437383034223b7d733a343a2268617368223b733a36353a2263363333373038623263363732373665303839396239383531353234373830342d6465323435383731376264386333366230386339663232663239363432383062223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223561343239303363306666303164363164623536666138323965373331356533223b733a33323a223965656132626435396261306231633764353736396266303937353730373531223b7d733a343a2268617368223b733a36353a2239656561326264353962613062316337643537363962663039373537303735312d3561343239303363306666303164363164623536666138323965373331356533223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223337306437396438313030623061636339313330346438316138633562383733223b733a33323a223439633634396430636464356636313331343461663166376538663135343862223b7d733a343a2268617368223b733a36353a2234396336343964306364643566363133313434616631663765386631353438622d3337306437396438313030623061636339313330346438316138633562383733223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226464333337633634656134343833656431323766373732663337383537626334223b733a33323a226534393135333765353638643134623861386630613131646238373734646633223b733a33323a223038363130376237386334326635633335623561383737636638366335313739223b733a33323a223061323330396434316430366634623561306566336431663839396433636131223b7d733a343a2268617368223b733a36353a2230613233303964343164303666346235613065663364316638393964336361312d3038363130376237386334326635633335623561383737636638366335313739223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223134646164303362396563636165393139636265383336376234336137313166223b733a33323a226361333962386135393966393235343437653931366338666130323338376165223b7d733a343a2268617368223b733a36353a2263613339623861353939663932353434376539313663386661303233383761652d3134646164303362396563636165393139636265383336376234336137313166223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223131333830396333633339393836643163343464643561376635333037343431223b733a33323a226132643163343533393433373734363131356263383064326562303838353137223b733a33323a223763356666333037383634303863353965346366313532316566326263303835223b733a33323a226466393031636638383433393431366232396162646663373635613461653238223b7d733a343a2268617368223b733a36353a2264663930316366383834333934313662323961626466633736356134616532382d3763356666333037383634303863353965346366313532316566326263303835223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701012727);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('aa7lq2k01pkjtm1acu2u50o9p7', 0x5f5f4c616d696e61737c613a31313a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313039303931342e31353338393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6a6a6e6d7138656a666b6132333173676e3139363966346a6f223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313031373037343b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313032333432353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039333233333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039343530343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313039343531343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313032333438303b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313032333835323b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313032333733363b7d733a34353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313032343039393b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223062393738626539386430393366363837353536636231333037613233353736223b733a33323a226436613763383636376363636433316562303339333762643038363166646538223b7d733a343a2268617368223b733a36353a2264366137633836363763636364333165623033393337626430383631666465382d3062393738626539386430393366363837353536636231333037613233353736223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226239633465623733336462363339653738316564636230623462356433343537223b733a33323a223234666664663133633331656530633865323766323239303935616330333933223b733a33323a226261383233323939363637313965653863663637646334656162393630613932223b733a33323a223565326365643766343965313333636433643737383564393238616431626339223b733a33323a223135633064343233663063333034636166383433366137373834333833646161223b733a33323a226136333638386163353838323539663966313836323931663737373066366137223b733a33323a223762643064643133316263353465303530313230643830373062323636353539223b733a33323a226530333736366263373533323338613461363066363764613430633136343932223b7d733a343a2268617368223b733a36353a2265303337363662633735333233386134613630663637646134306331363439322d3762643064643133316263353465303530313230643830373062323636353539223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226131663935383661313831623439663233616132303062353931303830353164223b733a33323a223564343232303763393937393238376365316434633663366139303632636262223b733a33323a226364383761323762323065326634373861346533653432323337336439343665223b733a33323a226133616661383464373035376333633133663536663237646362353237636364223b7d733a343a2268617368223b733a36353a2261336166613834643730353763336331336635366632376463623532376363642d6364383761323762323065326634373861346533653432323337336439343665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3133303a7b733a33323a226631396463666162336536333366666234333130643537356430643765326238223b733a33323a226234326532653664353831633636386465303436326630613266613462656531223b733a33323a226231346463353935376161626436323662663865373165303336636664356236223b733a33323a223434656633303831373361666364656135663866666235633062313833653331223b733a33323a223764636433633337623139656665633332376166323661303537633361623432223b733a33323a223362316161306432663137616637346430663537386463396564646265393332223b733a33323a223733346430636330663062386338356563313833663262313966613730333664223b733a33323a226538383930393663663563383465633666336536336639623333656362326137223b733a33323a223762656162303037663335663361313862316531623932323662666130386431223b733a33323a223130393839363536316366656664346436353037393261343163643431393961223b733a33323a223035333261306330316535353066346262663434633030353362396139656563223b733a33323a223934306633353861303362373963393236396361333939653230656332363363223b733a33323a223432653265383062386239643464636262356433366137383533303665313665223b733a33323a223265353164643839383837366133396437623732383963316565616263373063223b733a33323a223936396631373863663361663731373063663833623765333737656335383963223b733a33323a223639353462653537316131393266386263643333373237623935383464323633223b733a33323a226437626531316239346366626464303838373962663666633931636431623639223b733a33323a223861633037393634653139373331356631323861643131323839316135643836223b733a33323a223035303037636637633362636630666335646532623165383936333732366332223b733a33323a223561396435613834373065376465356164643638313936646338343962383537223b733a33323a226666306664633332616433643134323562643862643036346161393234636331223b733a33323a223162613662313738363730313633336235336639343836313665396138333633223b733a33323a223237323436396434366163333965623766336330616562346139666439303038223b733a33323a223961383265346465633165343836383631666231313133303661653664323333223b733a33323a226461333964633563333038373139373938653834376361666535663365323363223b733a33323a223261383565316662356537353836306163643464306637666663623236383465223b733a33323a226335343565306232666664663930393037356534373666643764623365333566223b733a33323a223933663766633962313539316263666262623861386164313436383165366537223b733a33323a223630396536303562306238316136363338393231643736396438363161313330223b733a33323a223231383135373263353539303233636538323364336166353436633738396436223b733a33323a223462373663326133393166306632323765623437346632636230353139333938223b733a33323a226335343132653966636232316465356261306264373738643036323935643762223b733a33323a223234613533633833306265386638303933373137303031386330366632323233223b733a33323a223563373562666632326164376638633664396339313931343736343930623465223b733a33323a223632646663313263653932663337613065313530346165306236316436646631223b733a33323a226666343734643463396637306464626465303863383361323963616231653331223b733a33323a226161623330363066663636396638356661643866613232643863333035613063223b733a33323a223430336439323838623833643864363333393161303830313938653638333531223b733a33323a223130653539376435623337633764636361643330333466326564393736623234223b733a33323a226439626438333230636335653161303537353931383363353836663666613739223b733a33323a223737356435383663363934323762366164393138666634623834303731353232223b733a33323a223565363937623465666430633736386436303337333130346138663235663566223b733a33323a223066313131306536393766343336663535396232623536653463366333623231223b733a33323a223661653363323866373966656632663235393061333266626634346564623535223b733a33323a223033313661333034616237386231663135363837326333393538386266306165223b733a33323a223363653635303262316239666132366131313836383534353031663263303539223b733a33323a223037303430346231386234356131626564626163373866376336623833363666223b733a33323a223037356261623139383330383566393438323933353137366638343466343233223b733a33323a223036633131373037356563386539353334316333623931376134366262313930223b733a33323a223336346230323161366332386331313963303763326339396462643237363265223b733a33323a226663383465663566616264623830653363646433333330626336353731396562223b733a33323a223237343236313438656432313934326230393836363061323931323066613061223b733a33323a223430303737623432646137333235376534613934626138646663323639366665223b733a33323a226461633166383833303835333430343630323233366433323564623734376165223b733a33323a226336383532393964633038623030663763646262333735303232666331333730223b733a33323a226539623037633964363361386336626636316632633631373064326238323034223b733a33323a223637363161626234396638613162393430613032646262363765333366626465223b733a33323a226539636336376461346130643436303063346564323364336666613662333534223b733a33323a223636363664326166393261376439396163653832613834396630353066633337223b733a33323a226434366463343130323636623233363066366364646633303833343230363531223b733a33323a223464656563313334316537643965613765323664356265656238346261393932223b733a33323a226339376162376432356339363637373565333536643337613966383337353464223b733a33323a226537663863336664616661656632376635643130616232343966343339346163223b733a33323a223638366238333566656531616632393231623138333132323566646134653864223b733a33323a223738313665383231663565653135383934333461396630623237323561646438223b733a33323a226130656133623662653231623866393834343137633037396230316138623932223b733a33323a223161383763373662613834653362386432616466363433613931313437633765223b733a33323a223039303238663963633862666533313432623233353933623736303763666661223b733a33323a226165376636353264303664656337383361626165323365363064643364666631223b733a33323a226563646232653162346139373165343634666461666131306363396566633631223b733a33323a223536386164336532666536313633393262346562653763623531366465616566223b733a33323a223539663238636565353263616333643835303133356531346330636435363333223b733a33323a226165663562663863383430366330373263313734346534393539376161333737223b733a33323a223666633732663738353432366232646161373031633930363337366231366466223b733a33323a226638613063386639376438323832656437633366323437383434333032636237223b733a33323a226134323335313461656464326561333466326633396465323235373839636539223b733a33323a223637396461393061333536353337623338376535323866613430643837303736223b733a33323a223661373666613932386563666235613764396362653631393833616161313463223b733a33323a223432366136663766623232306563613061323137636139643863386362656334223b733a33323a223633313032323532653134626562656666313535373261356535366339633733223b733a33323a223437356530313563303139323533613839363535313933313164396131353364223b733a33323a226638663664343335633731316132336662396131323262333061323533396239223b733a33323a226338313938616237313964643134616436653834393665663739333630373962223b733a33323a223632313362333735623532303334613165303534393063653937393761633565223b733a33323a223563373431633531653064333738366630366132626261623061396339393430223b733a33323a223066633439393837316666323262666564306638303464653333646536383035223b733a33323a223766636165396463353862303839656339643737343839626162343466396536223b733a33323a223635373231613764383731363534663362346266653438393664353265386137223b733a33323a223339323261623532363661616433303633343230643263393166666631633234223b733a33323a226334313539626231656565306432666535366534336561336635613831636362223b733a33323a223164353731383338353462373832623235383662373364616337363533613362223b733a33323a223834373864393636336531663137636664633639396661323430343831613465223b733a33323a223732386561656132343736336666613761346333616366636230383462393032223b733a33323a223634316638636235303463633162326437626261353864613463316630353638223b733a33323a223431396132303236653034663063626430613061353439376462636562636465223b733a33323a226263353664393931303366396139643264653861366466326165616461353439223b733a33323a223033663664306130323939633836366561386335326535613530626362656633223b733a33323a226439313364383662363231323265313138643431636137663963383032393265223b733a33323a226233356134623362633463623330626263303530643737643534623161333563223b733a33323a223531366163373130353366313539363839333037656532646663323637363030223b733a33323a223734303335386264653264656265353733356134653734316331376435383730223b733a33323a226666366637613265303031373532623330636437333930333736393961343465223b733a33323a223532613835656638633766666662653938376262663334646533323339646634223b733a33323a223234303431646661333737303561313839386262306530386130633361373537223b733a33323a226166656164376432343638303566313562383061396334383537613634366237223b733a33323a223534363365343561363464363334623037666335396535316136303034306163223b733a33323a226336613837323636376530393865363764626466643839613463306438653964223b733a33323a223330663163323433666461353561356332346361663234663465306532633435223b733a33323a223030393237663437373232653733613864393264633834346266626664373763223b733a33323a223837626533343636366262303364353839663264383033343732353064316465223b733a33323a223963643461633939353131393230613066326639323533633464656362663665223b733a33323a226435643564623838336564643062343538363233343466616664343331653863223b733a33323a223334366635373334613864323736613238366339663832653461623064666237223b733a33323a223439366663303338656531623438626430316335643864626261376335336165223b733a33323a223734353038393137376637326637383631333233633830363936663464636633223b733a33323a226364306530643638373763326431343963313362373037386534333164393066223b733a33323a223564333134663761323839393731393637643365326533323030633834333230223b733a33323a223066626239373561393165303834353235323365653664376231303262336365223b733a33323a226630643733643739613834393531353166336437396231313638343632653638223b733a33323a226334343766633366353535356430656434336231633363363034343132303634223b733a33323a223435326634393332613866313264323561306164653731633136366266363537223b733a33323a223138343734653062343637653562386465656136616334303031613938666165223b733a33323a223433376163343930383930356436636461656436333239376431353439346637223b733a33323a226335653561383663353862373563303533656465303364343061643737613234223b733a33323a226362666236616139323162383437633263636636313365623236326264323466223b733a33323a223938643463356539356239313331626132393233363539616565333939623965223b733a33323a223762343438316564613935336332346530396264393864326633393832393161223b733a33323a223938653161643932386438306137313333393864353865656266623164313539223b733a33323a223739613037303664383061633432626362653737633837393337303135313930223b733a33323a223938303436326334323838333137623962313764383531653535313962616466223b733a33323a223631613132316238346333626239336166633263633631353133396164316633223b733a33323a226566613565363761396663616334353662623234313230363430643131623661223b733a33323a223062656338666239623562326337663733313436323238326465376562616165223b733a33323a223730306639343863323066393731373164663530643962636366623739613762223b733a33323a223830393637336361363935376438613036326439326139353734363235636339223b733a33323a223565343863363863383265613037633533333463393531386235366639393330223b733a33323a226663393064383834653166613831393932613934316666363361303538666139223b733a33323a223461333365656465626562646638346636383336323265366362363763333234223b733a33323a223237386636343764333135653632643337303765363462393439376562636565223b733a33323a226231353164366432333831383462366464396161333938373431313339613036223b733a33323a223334313730393736653937323833366237646338633330393462393066636262223b733a33323a226665313834363961306631313361356163353962346231333636346234623632223b733a33323a226266613332623235383734356233626462363733363834666535613638633462223b733a33323a226564663464303062656130303038653534363666346265393733653131663432223b733a33323a223262373939346138633139373961663333333766303736393738346633613032223b733a33323a226635623233373737633562356236336630633033336565633534353834383862223b733a33323a226632323864393737333336613662316264303034613732316537303361396633223b733a33323a223565616163663733316363666534626563303434343836313061343366616563223b733a33323a223961653661323137323035386539383330366437656264306232333431663635223b733a33323a223365306635363534376535653235623533626665656634346633646431353731223b733a33323a223535653765633632373131343533653331613065363634376562656534663332223b733a33323a226533653338663766373330366462653933363663646261313262336562316333223b733a33323a223136396532613632306135323665656638616338656137346261343765356634223b733a33323a226266316231663465616333356161346235373862316466353839373265393035223b733a33323a223132646161373662633165386363326139353931303161623330383232666530223b733a33323a226464333233323037366139393638313530643365383032333366646263356138223b733a33323a226635636433343662643536366566353932333130633134383264636632333835223b733a33323a226538373864396262353162343238376331656130616266616231383366383764223b733a33323a223366383938636131323964643633363266616361333566383234323235306632223b733a33323a223661323732353233653537316635643838383566326432623365386661326432223b733a33323a226131363431376130636336303338306632336263666666643932396361373234223b733a33323a226337656132623535633639636263616232303439653930373231613133326635223b733a33323a223935616231646238323132663064633932323138656131373132373237326366223b733a33323a223137336462623030633138623662613966663565653066373564363764313836223b733a33323a223036386630323533373563363339623836646234326430633934326134346664223b733a33323a223330306538353437646431333866366164613038373361643336353566383536223b733a33323a226165366463376264313836363239376466663062313935663761306662643935223b733a33323a226137346134663562303739336465316230376465626530363564623635316466223b733a33323a223330363433363839643031383162663865313534303231396639323031393039223b733a33323a226530356333373837316636643435333266393865396331303830643462383236223b733a33323a226434323335663134366562363335336463303161333534633430326463326365223b733a33323a223436336132343432636565303835633337633961323665383037353233343561223b733a33323a226133636431333363363636343062396133373866646265383061323934663439223b733a33323a223835363137616639653062383933343237333730343532626630316131376234223b733a33323a223963376138336131666634323234653336313936303936636565653631363935223b733a33323a223662316532393964306531323761656666636339393537376638366461303836223b733a33323a223634323265316464306135313336396238643433343039373832316137376366223b733a33323a223834363066386265336634333763346335343133653739363265356666643133223b733a33323a226536643165353762333163363234313666333836326361393965653461353664223b733a33323a223232623738663366373930376138306639343863643033646465363434346135223b733a33323a226662626137643836323465353131663766653432376339396361366138633933223b733a33323a226430343835623838613161303966366366326638353539383136336431613861223b733a33323a223965633263666662353036643961326266376365396531646233633661343534223b733a33323a226263363330613332333537366464306130616239343633303133323537343433223b733a33323a226332376630663433393135656334326361303332393737373763313765346431223b733a33323a223239386262323830643761646165353363633066333264326663393530326565223b733a33323a223561333535616332636239343035363032366637343432623732633436636434223b733a33323a223862373534363731333661653737306232383733646236323037333762373831223b733a33323a223530383133616462366632383236656465613339313032333263313064383964223b733a33323a226365346664336631303163353239353439623333626433343761386239386564223b733a33323a226531386439613037303030653366633834666666363465623662613330356564223b733a33323a223630646465376230326136313630306238333930373439316437613333626532223b733a33323a226563393562373833323638613933376233366132313262333265663937323164223b733a33323a223739376435353739643934626337613439626431383365393537643139666430223b733a33323a226438386338386234386639346663346361653330386132623535386566346138223b733a33323a223431366165613366386130396361386663383130613464643763613138353235223b733a33323a223630356363393238656631323830653037353435336431396563313230636438223b733a33323a223963353166366266336433646230663232663337656634343461663634383635223b733a33323a226636663538323164323761323265313430316137316464653033363535346263223b733a33323a223263626435653338313635663464613938643133323036303534363966323863223b733a33323a226562306361653664346232323834376362353862616230313435383636393264223b733a33323a223535643438353363303536366566366466323731633139613566653762633037223b733a33323a223966633464666261313461613331343932353636666464353830333362343633223b733a33323a223631643337616233306439333934613235643132303234653864663764616262223b733a33323a223733643363376134316464303733626635656461316133636239636236346537223b733a33323a226363386264626430353739633130633664613562316365383861313035346563223b733a33323a223430613336393330393733616633373932303530643031353765663238373664223b733a33323a223934666536366331333439393937646134333730333133376430326536633936223b733a33323a223732336361333932333562653432333734616366383834336232313361393639223b733a33323a223230386237373334666561303138383164326163393432363466336137666463223b733a33323a226632323762636337393033633166353935303938616237366532613763393165223b733a33323a223134306666386465353236353363656630353466643233396336313634313366223b733a33323a226466303932613633636362383332373162386138653264353732333330363433223b733a33323a226431663463613466646464373762623064396332326364646635623565393066223b733a33323a226265316134626437313136656638643563373738363864653730353963363562223b733a33323a223635626336323833343333306433333230666166323530313831626162323363223b733a33323a223733613665303334353238326130653537313930366537303466333530666364223b733a33323a223361663333323164626430353630613632396465333032663134633537356363223b733a33323a223737643535623633653638306235633638306561653238306139636232656162223b733a33323a226363633063306162363664323135613232646137626662396137356235633161223b733a33323a223063326564323038643965336338363764633461303932363763363138333063223b733a33323a223065336462356463366561393931356363353464303562363234313562396433223b733a33323a226161333463333431643061646531626139653261303437653733303965636537223b733a33323a223463363234666663623238376136336230313135366662353064313862326639223b733a33323a226662663464356436383732363539303935303630663639323239623038633334223b733a33323a223566353532623264616230333234616633383265323566346435616237643333223b733a33323a226130353866623939303035623230613539333237636362373731653533303237223b733a33323a223263373062336338643364363330623639326533373036333062333632643165223b733a33323a223032613764646262643864396336346638316563356133326266363532623139223b733a33323a223966663335383438333563396234363563613366343135323737333539346333223b733a33323a226431393362326565336465613666326137303831363763626365323035313364223b733a33323a223231313365366534613364663461303963346331363936376462353062613139223b733a33323a223239386530313661373064366461643230656461376330316631356263383033223b733a33323a223266633832343538306436343339336366326139363064616461393439303164223b733a33323a226134343337663237636533316162633938373161333332356662356232313431223b733a33323a223236396166363531663164333836663831363666373661373663656464366337223b733a33323a223064323566306661633537663135356630396436303962363962383361346661223b733a33323a223166383538656633353133353762613461366437306266623366643733396537223b733a33323a223464633765626666396236623438633433386236373130656161376134383435223b733a33323a223634323238656632363838303039336131653265346434613638353334366163223b733a33323a223733633630333134366439363430373530356536366165643031313535336537223b733a33323a223737393539636530326233303133333234366433373062383666343566376463223b733a33323a223563356361633663366266666664306434373831383861666439376663353731223b733a33323a223962326263646533346531666435623234303030386366363964313665616530223b733a33323a226363633932373761616134323266303562376566356330333730306166306337223b733a33323a223465323434616430386564303033346561373433656263303136363033346537223b733a33323a226134353938336438393339646233386166353238666639663339363064333264223b733a33323a223862663235656139303964636235636565623137643830336532636236636565223b733a33323a223037396536636432373339373033663036303363333234326130653565326132223b733a33323a223432353562383264313437363833326637313566393037626536393236343637223b733a33323a226265303331383932383139663861353136653463393864373966643432363638223b733a33323a226261643832653133326432316438623533316332316464653766383730383532223b733a33323a223566396534653236303835333236376638613761383137323637373937323363223b733a33323a223030633838663466353338626363623434323762333630383432333863613761223b733a33323a223262396436663432336339353265316561623862633465616261333835356162223b733a33323a226234313663623262303964643333663133346266663162326532313932666433223b733a33323a226461636337303765303133346361373539366161383065666531306566373135223b733a33323a226536656539353263306536333130626336633239646561383363386232356265223b733a33323a226131353430356534333130363133353533356231333933323537343462303061223b733a33323a226365373634343664643835353035303863636166393866396366386339616530223b7d733a343a2268617368223b733a36353a2263653736343436646438353530353038636361663938663963663863396165302d6131353430356534333130363133353533356231333933323537343462303061223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a226637303662633335396563363166323433353733636336623831623133636365223b733a33323a223562613861616633636434343639616530306433666533313436366430656563223b733a33323a223131356432366662653631313565336431356434353337316436643834646664223b733a33323a226132316235316534666334633562383065356161323536623835633936303431223b733a33323a223636653338323131653061386166656333346235316565316666636436366130223b733a33323a223633623062363864396430316232393165616161306530343637616139366661223b733a33323a223034623731343961383232336532386364303835376461626337356130653866223b733a33323a223465656265386362623537613965663633633335363538306636646666616635223b733a33323a223732653136393065646239373634303832306439323234386163363963346233223b733a33323a226439343231343565633037623933313064363136336634346332313634646134223b733a33323a223363326164643037643631326336396665656162656561653532613637343934223b733a33323a223338313065356137353533613532633637633061653366373135653462306236223b733a33323a223066613132653431303733323732373130666532313666393332626266626133223b733a33323a223831623038356531366336636636313033346164616638616461373439383535223b733a33323a223837346337663835623530316332323363643331393863353862343239633831223b733a33323a226361376662323137326630363164323565646562386230333364303264666337223b733a33323a223430333530393534313733666239353565353830663963333865353336316438223b733a33323a223233613763376535333232366632343435373839643939313031626130356663223b7d733a343a2268617368223b733a36353a2232336137633765353332323666323434353738396439393130316261303566632d3430333530393534313733666239353565353830663963333865353336316438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223331346463313735386466366533653466396432626366363438393063373464223b733a33323a223232613034656334613737393363656661353337633461393563623035613033223b733a33323a223437383938386538353130353239636464636264383130633134323138653238223b733a33323a223236333030373561343763346232663865323536613237393139633364303365223b733a33323a226262613665323032666332336138323366323333613664313433396436343462223b733a33323a226633643334663466646363613033396438336335376466333566303463643664223b7d733a343a2268617368223b733a36353a2266336433346634666463636130333964383363353764663335663034636436642d6262613665323032666332336138323366323333613664313433396436343462223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223964643835343332633737373630346638373839613034346664373034643537223b733a33323a226230303465323734306565653437656537303231313331396465323330663339223b733a33323a226437376661653833393864663231636533666239373436326662396365383936223b733a33323a223239343434656539623438373432333261313535643738333133326230393035223b7d733a343a2268617368223b733a36353a2232393434346565396234383734323332613135356437383331333262303930352d6437376661653833393864663231636533666239373436326662396365383936223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226663323564643363373434616662376539336436363036613134333165353332223b733a33323a226365623537653439656163313733323835396135613466393239653637353666223b7d733a343a2268617368223b733a36353a2263656235376534396561633137333238353961356134663932396536373536662d6663323564643363373434616662376539336436363036613134333165353332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223539393364333239333635393838336264633932363830663535383062363161223b733a33323a223630363936643139376562616362323434386335326366336232353630383838223b733a33323a226238633038306132343236666664396433393536353030643039613263626639223b733a33323a223931626366613030626261386363633837383835663637663134383962633264223b733a33323a226666303366623431633935633339306233313964643263333465326338373962223b733a33323a226338646133336132383030323062666266353237363763633562656532623635223b733a33323a223263346531326331616639353865643361666333303532643635623735613365223b733a33323a223461373738373636623963326661616130633935306539333133626133393063223b733a33323a223562633335643662353466396239633332616138303834613038326262646538223b733a33323a226338623238643035363333643365613832643930613461363733663039633330223b733a33323a223638646261313637313762393865646534353034653665333664326334643835223b733a33323a226562323863366336626561333134313461376238613463616438323465366434223b733a33323a226237333433363761653964326336666638663139363938346630326436663733223b733a33323a223666303232393265353230623163303662663731653237366431623839313361223b733a33323a226265323765653965613363653838353635343166356230303539343262323464223b733a33323a223164363564373436393233646564386433366265633435363264326333373561223b7d733a343a2268617368223b733a36353a2231643635643734363932336465643864333662656334353632643263333735612d6265323765653965613363653838353635343166356230303539343262323464223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701090914),
('eia1faup8hg584gd045kj995p7', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313031333438302e3634323737353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227267657336716675686f336e3675636576683875723430626132223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313031363333393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313031363335333b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313031373033373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313031363534393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223737313238396363336139316239363838653131353435633935373331386239223b733a33323a223665343363303961333865373566393139623665663064343635643262353933223b733a33323a226562366163343931393839626538383037313434663766333433623764616336223b733a33323a223933626363623439326132316232663931373962613762356231346134366565223b733a33323a226235646664386632303235386334303731343731343461353163393161333338223b733a33323a223938646535333138636136396137343637306437656334626336663534373330223b7d733a343a2268617368223b733a36353a2239386465353331386361363961373436373064376563346263366635343733302d6235646664386632303235386334303731343731343461353163393161333338223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223834333233333739376566626263336464646339643464363239363435623233223b733a33323a226563333466383634643834343764623933336462393138353262363239396638223b7d733a343a2268617368223b733a36353a2265633334663836346438343437646239333364623931383532623632393966382d3834333233333739376566626263336464646339643464363239363435623233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a223736646533663331616536666261666463623832626637333762643936313633223b733a33323a223336623661373366633531363437393836336332386438653131303038313330223b733a33323a226633366434313038653432316239326136653734336532633566396631306537223b733a33323a223132366330643933653862356637653265383639626538636165613232626564223b733a33323a226463376239353137623232316464396632643237666163343264616261343032223b733a33323a223435393230323330363736653930633032616632653163383038343262633037223b733a33323a226461323064666430343763386630316365653739646335393162356332643637223b733a33323a223564326238326464323162633938316330363564626561356637336364353462223b733a33323a223833316535393661316365306137386434643135346366653031356638343166223b733a33323a226163343364616538326136613839363264383963656632356433386236386562223b733a33323a226139666263333436363531613039313336666562313739623832383835356561223b733a33323a223663623339336139393365323036653131383533316332656330326131336231223b733a33323a223837636335613065326561393761393662333533633032376630626331313732223b733a33323a226663646461613064396661626230663639356535346138613238633335366338223b733a33323a223637616634643035656566303131366134373636336534653533363665323963223b733a33323a226364396663656664366463313133623163616566363438346466653531363733223b733a33323a226133373135313735633339646535653064663736663235626134306664373164223b733a33323a223532386130313130646133663632353665313735313131326164373636303630223b733a33323a226136343536353036306432613138633235353739323663316535313863323665223b733a33323a223730353830643133393064363538383330653930343138373965363830333531223b733a33323a226261363963633366303538616561626134353435633565346535333239306632223b733a33323a226433383732303031356562313965356266373236656430373061626232396333223b7d733a343a2268617368223b733a36353a2264333837323030313565623139653562663732366564303730616262323963332d6261363963633366303538616561626134353435633565346535333239306632223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226632663132653439383261633264653961333834383365373530646333666561223b733a33323a223939663061633463336537386638653431643566336433386165393166653531223b733a33323a223633336434653131623864626163633334326133356232303736636137653963223b733a33323a223334316335656139353762306266346634323235626237646364613363316139223b7d733a343a2268617368223b733a36353a2233343163356561393537623062663466343232356262376463646133633161392d3633336434653131623864626163633334326133356232303736636137653963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701013480),
('of6bratchj1hp2epndp0m9rrd5', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303433333631342e30323435343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f66366272617463686a3168703265706e6470306d3972726435223b7d7d, 1700433614);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"rayan.koussa@etud.univ-paris8.fr\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Thyp\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.0.4\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int DEFAULT NULL,
  `homepage_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `navigation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  KEY `IDX_694309E47E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `thumbnail_id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(2, NULL, NULL, 1, 'shop', 'default', 'Shop', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Browse\",\"query\":\"\"},\"links\":[]},{\"type\":\"page\",\"links\":[],\"data\":{\"id\":3,\"label\":null}}]', '[]', '2023-11-26 17:35:25', '2023-11-26 17:36:02', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
CREATE TABLE IF NOT EXISTS `site_block_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `block_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_236473FEE9ED820C` (`block_id`),
  KEY `IDX_236473FE126F525E` (`item_id`),
  KEY `IDX_236473FEEA9FDD75` (`media_id`),
  KEY `block_position` (`block_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_block_attachment`
--

INSERT INTO `site_block_attachment` (`id`, `block_id`, `item_id`, `media_id`, `caption`, `position`) VALUES
(1, 8, 3, NULL, '<p>Teste</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE IF NOT EXISTS `site_item_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  KEY `IDX_D4CE134F6BD1646` (`site_id`),
  KEY `IDX_D4CE134960278D7` (`item_set_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

DROP TABLE IF EXISTS `site_page`;
CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  KEY `IDX_2F900BD9F6BD1646` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(2, 2, 'welcome', 'Welcome', 1, '2023-11-26 17:35:25', '2023-11-26 17:35:25'),
(3, 2, 'profil', 'Profil', 1, '2023-11-26 17:36:02', '2023-11-26 17:41:39');

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE IF NOT EXISTS `site_page_block` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `layout` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C593E731C4663E4` (`page_id`),
  KEY `page_position` (`page_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(4, 2, 'html', '{\"html\":\"    <p>Welcome to your new site. This is an example page.<\\/p>\\r\\n    <ul>\\r\\n        <li>This is a bullet list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ul>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <ol>\\r\\n        <li>This is an ordered list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ol>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <blockquote>This is a blockquote.<\\/blockquote>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <div><a href=\\\"#\\\">This text is a link, which currently points to nothing.<\\/a><\\/div>\\r\\n    <p><strong>This text is bold, in a &lt;strong&gt; tag.<\\/strong><\\/p>\\r\\n    <p><em>This text is italicized, in an &lt;em&gt; tag.<\\/em><\\/p>\\r\\n    <p><u>This text is underlined, in a &lt;u&gt; tag.<\\/u><\\/p>\\r\\n    <p><s>This text has a strikethrough, in a &lt;s&gt; tag.<\\/s><\\/p>\\r\\n    <p>This text is <sub>subscript<\\/sub> and <sup>superscript<\\/sup> using &lt;sub&gt; and &lt;sup&gt;, which can be used for adding notes and citations.<\\/p>\\r\\n    <hr \\/>\\r\\n    <h1>This is an H1 title. It is bigger than the Page Title, which is rendered in H2.<\\/h1>\\r\\n    <h2>This is an H2 header, the same size as the Page Title.<\\/h2>\\r\\n    <h3>This is an H3 subheader.<\\/h3>\\r\\n    <h4>This is an H4 subheader.<\\/h4>\\r\\n    <h5>This is an H5 subheader.<\\/h5>\\r\\n    <h6>This is an H6 subheader.<\\/h6>\"}', 1),
(5, 2, 'lineBreak', '{\"break_type\":\"opaque\"}', 2),
(6, 2, 'html', '{\"html\":\"    <h2 style=\\\"font-style:italic;\\\">This is the \\\"Italic Title\\\" block style.<\\/h2>\\r\\n    <h3 style=\\\"color:#aaaaaa;font-style:italic;\\\">This is the \\\"Subtitle\\\" block style.<\\/h3>\\r\\n    <div style=\\\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\\\">This is the \\\"Special Container\\\" block style.<\\/div>\\r\\n    <p><span class=\\\"marker\\\">This is the \\\"Marker\\\" inline style. <\\/span><\\/p>\\r\\n    <p><big>This is the \\\"Big\\\" inline style.<\\/big> This is normal text.<\\/p>\\r\\n    <p><small>This text is inside a \\\"small\\\" inline style.<\\/small> This is normal text.<\\/p>\\r\\n    <p><code>This is the \\\"Computer Code\\\" inline style.<\\/code><\\/p>\\r\\n    <p><span dir=\\\"rtl\\\">\\u0644\\u0643\\u0646 \\u0644\\u0627 \\u0628\\u062f \\u0623\\u0646 \\u0623\\u0648\\u0636\\u062d \\u0644\\u0643 \\u0623\\u0646 \\u0643\\u0644 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0623\\u0641\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0645\\u063a\\u0644\\u0648\\u0637\\u0629 \\u062d\\u0648\\u0644 \\u0627\\u0633\\u062a\\u0646\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0646\\u0634\\u0648\\u0629 \\u0648\\u062a\\u0645\\u062c\\u064a\\u062f \\u0627\\u0644\\u0623\\u0644\\u0645 \\u064a\\u0639\\u0631\\u0636 \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0646\\u0635 \\u0645\\u0646 \\u0627\\u0644\\u064a\\u0645\\u064a\\u0646 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u064a\\u0633\\u0627\\u0631.<\\/span><\\/p>\"}', 3),
(7, 3, 'pageTitle', '[]', 1),
(8, 3, 'itemShowCase', '{\"thumbnail_type\":\"large\",\"show_title_option\":\"item_title\"}', 2);

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE IF NOT EXISTS `site_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  KEY `IDX_C0401D6FA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(2, 2, 1, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE IF NOT EXISTS `site_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `IDX_64D05A53F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'rayan.koussa@etud.univ-paris8.fr', 'Rayan', '2023-11-03 16:39:16', '2023-11-03 16:39:16', '$2y$10$8QzBkacI7Cf32WyaAEysFOj.kq/KtL2rWvzGNv1PonNjqUH8hDIum', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel', '2023-11-27 11:53:18', '2023-11-27 11:53:48', '$2y$10$qUoM/jA.E0OZaaQXZF0wS.xHHcRDvY5UgJlLSYmV16wEjuh2.DNJa', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`user_id`),
  KEY `IDX_C779A692A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

DROP TABLE IF EXISTS `value`;
CREATE TABLE IF NOT EXISTS `value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_id` int NOT NULL,
  `property_id` int NOT NULL,
  `value_resource_id` int DEFAULT NULL,
  `value_annotation_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  KEY `IDX_1D77583489329D25` (`resource_id`),
  KEY `IDX_1D775834549213EC` (`property_id`),
  KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  KEY `value` (`value`(190)),
  KEY `uri` (`uri`(190))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(3, 3, 258, NULL, NULL, 'literal', '', 'rayan.koussa@outlook.fr', NULL, 1),
(4, 3, 273, NULL, NULL, 'literal', '', '1', NULL, 1),
(5, 3, 270, NULL, NULL, 'literal', '', '1', NULL, 1),
(6, 3, 255, NULL, NULL, 'literal', '', '1', NULL, 1),
(7, 3, 262, NULL, NULL, 'literal', '', '1', NULL, 1),
(8, 3, 274, NULL, NULL, 'literal', '', '1', NULL, 1),
(9, 3, 271, NULL, NULL, 'literal', '', '1', NULL, 1),
(10, 3, 264, NULL, NULL, 'literal', '', '100', NULL, 1),
(11, 3, 259, NULL, NULL, 'literal', '', 'Geemeau96', NULL, 1),
(12, 3, 256, NULL, NULL, 'literal', '', 'KOUSSA', NULL, 1),
(13, 3, 272, NULL, NULL, 'literal', '', '50', NULL, 1),
(14, 3, 275, NULL, NULL, 'literal', '', '100', NULL, 1),
(15, 3, 257, NULL, NULL, 'literal', '', 'Rayan', NULL, 1),
(16, 3, 1, NULL, NULL, 'literal', '', 'Rayan', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

DROP TABLE IF EXISTS `value_annotation`;
CREATE TABLE IF NOT EXISTS `value_annotation` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE IF NOT EXISTS `vocabulary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `namespace_uri` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  KEY `IDX_9099C97B7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(8, 1, 'http://example.org/ecommerce/', 'ecm', 'Commerce', ''),
(9, 1, 'http://example.com/', 'sh', 'Shop', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
