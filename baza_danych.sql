-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Czas generowania: 16 Lip 2022, 10:57
-- Wersja serwera: 5.7.38
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `app_db`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gr3_przedmiot`
--

CREATE TABLE `gr3_przedmiot` (
  `id` int(11) NOT NULL,
  `przedmiot` varchar(128) NOT NULL,
  `kategoria` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `gr3_przedmiot`
--

INSERT INTO `gr3_przedmiot` (`id`, `przedmiot`, `kategoria`) VALUES
(1, 'Sukienka', 'Odziez'),
(2, 'Rower', 'Sport'),
(3, 'Pilka Najki', 'Sport');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gr3_zamawiajacy`
--

CREATE TABLE `gr3_zamawiajacy` (
  `id` int(11) NOT NULL,
  `imie` varchar(128) NOT NULL,
  `nazwisko` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `gr3_zamawiajacy`
--

INSERT INTO `gr3_zamawiajacy` (`id`, `imie`, `nazwisko`, `email`) VALUES
(1, 'Szymon', 'Znany', 'znany@example.com'),
(2, 'Agata', 'Nieznany', 'agata@example.com'),
(3, 'John', 'Doe', 'john@example.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gr3_zamowienia`
--

CREATE TABLE `gr3_zamowienia` (
  `id` int(11) NOT NULL,
  `przedmiot_id` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `zamawiajacy_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `cena` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `gr3_zamowienia`
--

INSERT INTO `gr3_zamowienia` (`id`, `przedmiot_id`, `ilosc`, `zamawiajacy_id`, `data`, `cena`) VALUES
(1, 1, 1, 1, '2022-10-10', '30'),
(2, 2, 2, 1, '2022-10-10', '2400'),
(3, 3, 5, 2, '2022-10-11', '400'),
(4, 1, 2, 3, '2022-10-12', '60');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `gr3_przedmiot`
--
ALTER TABLE `gr3_przedmiot`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `gr3_zamawiajacy`
--
ALTER TABLE `gr3_zamawiajacy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `gr3_zamowienia`
--
ALTER TABLE `gr3_zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `przedmiot_id` (`przedmiot_id`),
  ADD KEY `zamawiajacy_id` (`zamawiajacy_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `gr3_przedmiot`
--
ALTER TABLE `gr3_przedmiot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `gr3_zamawiajacy`
--
ALTER TABLE `gr3_zamawiajacy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `gr3_zamowienia`
--
ALTER TABLE `gr3_zamowienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `gr3_zamowienia`
--
ALTER TABLE `gr3_zamowienia`
  ADD CONSTRAINT `gr3_zamowienia_ibfk_1` FOREIGN KEY (`przedmiot_id`) REFERENCES `gr3_przedmiot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gr3_zamowienia_ibfk_2` FOREIGN KEY (`zamawiajacy_id`) REFERENCES `gr3_zamawiajacy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
