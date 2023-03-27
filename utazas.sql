-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 27. 10:20
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazás`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jármű`
--

CREATE TABLE `jármű` (
  `járműAzon` int(11) NOT NULL,
  `típus` varchar(20) NOT NULL,
  `városAzon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `jármű`:
--   `járműAzon`
--       `sofőr` -> `sofőrAzon`
--   `városAzon`
--       `város` -> `városAzon`
--

--
-- A tábla adatainak kiíratása `jármű`
--

INSERT INTO `jármű` (`járműAzon`, `típus`, `városAzon`) VALUES
(1, 'BMW', 1),
(2, 'Peugeo', 2),
(3, 'Audi', 3),
(4, 'Ferrari', 4),
(5, 'Ferrari', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sofőr`
--

CREATE TABLE `sofőr` (
  `sofőrAzon` int(11) NOT NULL,
  `vezetékNév` varchar(30) NOT NULL,
  `keresztNév` varchar(30) NOT NULL,
  `járműAzon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `sofőr`:
--

--
-- A tábla adatainak kiíratása `sofőr`
--

INSERT INTO `sofőr` (`sofőrAzon`, `vezetékNév`, `keresztNév`, `járműAzon`) VALUES
(1, 'Szegedi', 'Csaba', 123),
(2, 'Kovács', 'Izsák', 124),
(3, 'Domb', 'Dombledor', 125),
(4, 'Iszákos', 'Frodó', 126),
(5, 'Giga', 'Chad', 127);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `város`
--

CREATE TABLE `város` (
  `városAzon` int(11) NOT NULL,
  `név` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `város`:
--

--
-- A tábla adatainak kiíratása `város`
--

INSERT INTO `város` (`városAzon`, `név`) VALUES
(1, 'Budapest'),
(2, 'Miskolc'),
(3, 'Ohio'),
(4, 'South Park'),
(5, 'Gyömrő');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `jármű`
--
ALTER TABLE `jármű`
  ADD UNIQUE KEY `járműAzon` (`járműAzon`),
  ADD KEY `városAzon` (`városAzon`);

--
-- A tábla indexei `sofőr`
--
ALTER TABLE `sofőr`
  ADD PRIMARY KEY (`sofőrAzon`),
  ADD UNIQUE KEY `sofőrAzon` (`sofőrAzon`);

--
-- A tábla indexei `város`
--
ALTER TABLE `város`
  ADD PRIMARY KEY (`városAzon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `sofőr`
--
ALTER TABLE `sofőr`
  MODIFY `sofőrAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `város`
--
ALTER TABLE `város`
  MODIFY `városAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jármű`
--
ALTER TABLE `jármű`
  ADD CONSTRAINT `jármű_ibfk_1` FOREIGN KEY (`járműAzon`) REFERENCES `sofőr` (`sofőrAzon`),
  ADD CONSTRAINT `jármű_ibfk_2` FOREIGN KEY (`városAzon`) REFERENCES `város` (`városAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
