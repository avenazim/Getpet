-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Maj 2018, 19:11
-- Wersja serwera: 10.1.32-MariaDB
-- Wersja PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `get_pet_db`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `animal`
--

CREATE TABLE `animal` (
  `id` int(63) NOT NULL,
  `sex` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `rase` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `height` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(63) NOT NULL,
  `shelter_id` int(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `preferences`
--

CREATE TABLE `preferences` (
  `id` int(63) NOT NULL,
  `type` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rase` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `height` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(63) DEFAULT NULL,
  `shelter_id` int(63) DEFAULT NULL,
  `user_id` int(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shelter`
--

CREATE TABLE `shelter` (
  `id` int(63) NOT NULL,
  `name` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `code_post` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` int(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `state`
--

CREATE TABLE `state` (
  `id` int(63) NOT NULL,
  `name` varchar(31) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(63) NOT NULL,
  `name` varchar(31) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_animal_shelter_id` (`shelter_id`);

--
-- Indeksy dla tabeli `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_preferences_state` (`state_id`),
  ADD KEY `fk_preferences_shelter` (`shelter_id`),
  ADD KEY `fk_preferences_user` (`user_id`);

--
-- Indeksy dla tabeli `shelter`
--
ALTER TABLE `shelter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shelter_state` (`state_id`);

--
-- Indeksy dla tabeli `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int(63) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` int(63) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(63) NOT NULL AUTO_INCREMENT;

ALTER TABLE `shelter`
  MODIFY `id` int(63) NOT NULL AUTO_INCREMENT;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_animal_shelter_id` FOREIGN KEY (`shelter_id`) REFERENCES `shelter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `preferences`
--
ALTER TABLE `preferences`
  ADD CONSTRAINT `fk_preferences_shelter` FOREIGN KEY (`shelter_id`) REFERENCES `shelter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_preferences_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_preferences_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `shelter`
--
ALTER TABLE `shelter`
  ADD CONSTRAINT `fk_shelter_state` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
