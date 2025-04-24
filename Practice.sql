-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 24 2025 г., 14:54
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Practice`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Category`
--

CREATE TABLE `Category` (
  `Id` int NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Category`
--

INSERT INTO `Category` (`Id`, `Title`) VALUES
(1, 'Молочное'),
(3, 'Мясные'),
(4, 'Овощи'),
(2, 'Фрукты');

-- --------------------------------------------------------

--
-- Структура таблицы `Product`
--

CREATE TABLE `Product` (
  `Id` int NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ExpirationDate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Cost` decimal(9,2) NOT NULL,
  `Category` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Product`
--

INSERT INTO `Product` (`Id`, `Name`, `ExpirationDate`, `Cost`, `Category`) VALUES
(1, 'Молоко \"Деревенское\"', '5 дней', '84.50', 'Молочное'),
(2, 'Йогурт \"Фрутти\" (клубника)', '14 дней', '65.90', 'Молочное'),
(3, 'Сыр \"Российский\" (200 г)', '30 дней', '319.99', 'Молочное'),
(4, 'Куриное филе \"Зеленый луг\" (1 кг)', '3 дня', '289.80', 'Мясные'),
(5, 'Говяжий фарш \"Премиум\" (500 г)', '2 дня', '449.50', 'Мясные'),
(6, 'Колбаса \"Докторская\" (300 г)', '10 дней', '219.45', 'Мясные'),
(7, 'Морковь \"Сочная\" (1 кг)', '14 дней', '54.75', 'Овощи'),
(8, 'Картофель \"Молодой\" (1 кг)', '21 день', '39.90', 'Овощи'),
(9, 'Помидоры \"Черри\" (250 г)', '7 дней', '179.99', 'Овощи'),
(10, 'Яблоки \"Гренни Смит\" (1 кг)', '20 дней', '119.80', 'Фрукты'),
(11, 'Бананы \"Эквадор\" (1 кг)', '5 дней', '89.50', 'Фрукты'),
(12, 'Апельсины \"Марокко\" (1 кг)', '10 дней', '149.25', 'Фрукты');

-- --------------------------------------------------------

--
-- Структура таблицы `Store`
--

CREATE TABLE `Store` (
  `ProductName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Store`
--

INSERT INTO `Store` (`ProductName`, `Amount`) VALUES
('Молоко \"Деревенское\"', 8),
('Йогурт \"Фрутти\" (клубника)', 0),
('Сыр \"Российский\" (200 г)', 4),
('Куриное филе \"Зеленый луг\" (1 кг)', 7),
('Говяжий фарш \"Премиум\" (500 г)', 0),
('Колбаса \"Докторская\" (300 г)', 5),
('Морковь \"Сочная\" (1 кг)', 9),
('Картофель \"Молодой\" (1 кг)', 0),
('Помидоры \"Черри\" (250 г)', 2),
('Яблоки \"Гренни Смит\" (1 кг)', 6),
('Бананы \"Эквадор\" (1 кг)', 4),
('Апельсины \"Марокко\" (1 кг)', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Title` (`Title`);

--
-- Индексы таблицы `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Category` (`Category`),
  ADD KEY `Name` (`Name`);

--
-- Индексы таблицы `Store`
--
ALTER TABLE `Store`
  ADD KEY `ProductName` (`ProductName`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Category`
--
ALTER TABLE `Category`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `Product`
--
ALTER TABLE `Product`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category`) REFERENCES `Category` (`Title`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Store`
--
ALTER TABLE `Store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`ProductName`) REFERENCES `Product` (`Name`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
