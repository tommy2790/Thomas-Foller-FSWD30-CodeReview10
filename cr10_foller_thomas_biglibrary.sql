-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 06, 2018 at 02:54 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_foller_thomas_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_ID` int(10) UNSIGNED NOT NULL,
  `author_name` varchar(50) COLLATE utf8_german2_ci NOT NULL,
  `author_surname` varchar(50) COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_ID`, `author_name`, `author_surname`) VALUES
(1, 'JK', 'Rowling'),
(2, 'Dan', 'Brown'),
(3, 'Ernest', 'Hemingway'),
(4, 'Stephen', 'King'),
(5, 'Charles', 'Dickens');

-- --------------------------------------------------------

--
-- Table structure for table `loan_table`
--

CREATE TABLE `loan_table` (
  `loan_ID` int(10) UNSIGNED NOT NULL,
  `fk_user_ID` int(10) UNSIGNED NOT NULL,
  `fk_media_ID` int(10) UNSIGNED NOT NULL,
  `start_loan` date NOT NULL,
  `end_loan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_ID` int(10) UNSIGNED NOT NULL,
  `fk_author_ID` int(10) UNSIGNED NOT NULL,
  `fk_publisher_ID` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_german2_ci NOT NULL,
  `ISBN` int(11) NOT NULL,
  `short_description` text COLLATE utf8_german2_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_ID`, `fk_author_ID`, `fk_publisher_ID`, `title`, `ISBN`, `short_description`, `type`) VALUES
(4, 1, 1, 'Harry Potter', 264599, 'Harry Potter has no idea how famous he is. That\'s because he\'s being raised by his miserable aunt and uncle who are terrified Harry will learn that he\'s really a wizard, just as his parents were. But everything changes when Harry is summoned to attend an infamous school for wizards, and he begins to discover some clues about his illustrious birthright. From the surprising way he is greeted by a lovable giant, to the unique curriculum and colorful faculty at his unusual school, Harry finds himself drawn deep inside a mystical world he never knew existed and closer to his own noble destiny.', 'book'),
(5, 2, 2, 'Inferno', 95123, 'Harvard professor of symbology Robert Langdon awakens in an Italian hospital, disoriented and with no recollection of the past thirty-six hours, including the origin of the macabre object hidden in his belongings. With a relentless female assassin trailing them through Florence, he and his resourceful doctor, Sienna Brooks, are forced to flee. Embarking on a harrowing journey, they must unravel a series of codes, which are the work of a brilliant scientist whose obsession with the end of the world is matched only by his passion for one of the most influential masterpieces ever written, Dante Alighieri\'s The Inferno. \r\n ', 'book'),
(8, 3, 3, 'The Old Man and the Sea', 591259, 'The Old Man and the Sea is one of Hemingway\'s most enduring works. Told in language of great simplicity and power, it is the story of an old Cuban fisherman, down on his luck, and his supreme ordeal -- a relentless, agonizing battle with a giant marlin far out in the Gulf Stream. \r\n\r\nHere Hemingway recasts, in strikingly contemporary style, the classic theme of courage in the face of defeat, of personal triumph won from loss. Written in 1952, this hugely successful novella confirmed his power and presence in the literary world and played a large part in his winning the 1954 Nobel Prize for Literature.', 'book'),
(9, 4, 4, 'The Dark Tower I: The Gunslinger', 42385, '“An impressive work of mythic magnitude that may turn out to be Stephen King’s greatest literary achievement” (The Atlanta Journal-Constitution), The Gunslinger is the first volume in the epic Dark Tower Series.\r\n\r\nA #1 national bestseller, The Gunslinger introduces readers to one of Stephen King’s most powerful creations, Roland of Gilead: The Last Gunslinger. He is a haunting figure, a loner on a spellbinding journey into good and evil. In his desolate world, which mirrors our own in frightening ways, Roland tracks The Man in Black, encounters an enticing woman named Alice, and begins a friendship with the boy from New York named Jake.\r\n', 'book'),
(11, 5, 5, 'Oliver Twist', 23458, 'The story of Oliver Twist - orphaned, and set upon by evil and adversity from his first breath - shocked readers when it was published. After running away from the workhouse and pompous beadle Mr Bumble, Oliver finds himself lured into a den of thieves peopled by vivid and memorable characters - the Artful Dodger, vicious burglar Bill Sikes, his dog Bull\'s Eye, and prostitute Nancy, all watched over by cunning master-thief Fagin. Combining elements of Gothic Romance, the Newgate Novel and popular melodrama, Dickens created an entirely new kind of fiction, scathing in its indictment of a cruel society, and pervaded by an unforgettable sense of threat and mystery.', 'book');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_ID` int(10) UNSIGNED NOT NULL,
  `publisher_name` varchar(50) COLLATE utf8_german2_ci NOT NULL,
  `adress` varchar(100) COLLATE utf8_german2_ci NOT NULL,
  `size` varchar(10) COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_ID`, `publisher_name`, `adress`, `size`) VALUES
(1, 'Hachette', 'Oxford street 1', 'big'),
(2, 'HarperCollins', 'Downing Street 1', 'big'),
(3, 'Macmillan', 'Round Street 1', 'big'),
(4, 'Penguin Random House', 'Broadway Street 2', 'big'),
(5, 'Simon & Schuster', 'Bleecker St 3', 'small');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(10) UNSIGNED NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
  `userPass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userName`, `userEmail`, `userPass`) VALUES
(3, 'Nina', 'nina@nina.at', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12'),
(4, 'Thomas', 'thomasfoller@gmail.com', 'd38681074467c0bc147b17a9a12b9efa8cc10bcf545f5b0bcc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_ID`),
  ADD UNIQUE KEY `author_ID` (`author_ID`);

--
-- Indexes for table `loan_table`
--
ALTER TABLE `loan_table`
  ADD PRIMARY KEY (`loan_ID`),
  ADD UNIQUE KEY `loan_ID` (`loan_ID`),
  ADD KEY `fk_user_ID` (`fk_user_ID`),
  ADD KEY `fk_media_ID` (`fk_media_ID`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_ID`),
  ADD UNIQUE KEY `media_ID` (`media_ID`),
  ADD KEY `fk_author_ID` (`fk_author_ID`),
  ADD KEY `fk_publisher_ID` (`fk_publisher_ID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_ID`),
  ADD UNIQUE KEY `publisher_ID` (`publisher_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `user_ID` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `loan_table`
--
ALTER TABLE `loan_table`
  MODIFY `loan_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `loan_table`
--
ALTER TABLE `loan_table`
  ADD CONSTRAINT `loan_table_ibfk_1` FOREIGN KEY (`fk_user_ID`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loan_table_ibfk_2` FOREIGN KEY (`fk_media_ID`) REFERENCES `media` (`media_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_author_ID`) REFERENCES `author` (`author_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_publisher_ID`) REFERENCES `publisher` (`publisher_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
