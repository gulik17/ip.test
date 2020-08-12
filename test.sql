-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 12 2020 г., 02:55
-- Версия сервера: 10.4.13-MariaDB
-- Версия PHP: 7.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `youtube_id` int(11) NOT NULL,
  `shortcode` varchar(50) NOT NULL,
  `video_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `videos`
--

INSERT INTO `videos` (`id`, `youtube_id`, `shortcode`, `video_name`) VALUES
(1, 1, 'mvo_3J8AlAw', 'Системы в опасности - дыра в GRUB2. Российский процессор в Ядре Linux 5.8. LibreOffice 7. FHE от IBM'),
(2, 1, '_5Uci4VwdPQ', 'Обзор 4MLinux. Дистрибутив без базы и репозиториев. Основные функции. Для кого?'),
(3, 1, 'ZlM5a3iuuwk', 'Microsoft проверяет Linux, openSuse 15.2, обои GNOME 3.38, Google и Canonical, MX Linux выбрал KDE'),
(4, 1, 'JJKaLKQ9VqM', 'GNOME победил, Ubuntu обогнал Windows XP, мысли о «вторжении» Microsoft, первое про ElementaryOS 6'),
(5, 1, 'FxwPQkP3OGY', 'Установка Apache, PHP, MySQL (LAMP) на VDS сервер (в Ubuntu)'),
(6, 1, '2paklbNS5Cw', 'Linux Mint 20 «Ульяна». Что нового. Желтые папки, больше нет Snap, новая программа Warpinator'),
(7, 1, 'jcTFEoHxsXE', 'Разоблачение браузера Brave, Linux Mint отказывается от Snap, Blender и Krita, PaleMoon и Vivaldi'),
(8, 1, 'uv_wGrNzQUs', 'Linux vs Windows в Германии, Pidgin через 2 года, Telegram разблокировали, Lenovo переходит на Linux'),
(9, 1, 'RDYg4unQo6I', 'Отполированная плазма. KDE Plasma 5.19. Основные нововведения и Личные мысли. Панель как в Windows'),
(10, 1, 'Sg9WPDWqEHw', 'Microsoft купит Linux? Ядро 5.7, Kodachi 7, Raspberry Pi 8Gb, Transmission 3.0, подарок от Microsoft'),
(11, 1, 'Mp6JIx5vKXU', 'Linux новости: Роскомнадзор добрался до Open Source. Elementary OS 5.1.4, Inkscape 1.0, PopOS 20.04'),
(12, 1, 'HX0LN3Zpovk', 'Linux на VDS/VPS. Виртуализация KVM/OpenVZ. Поднимаем сайт, Игровой сервер, Удаленный рабочий стол'),
(13, 2, 'uuwSf4mIUDc', 'Традиционный Бородатый Стрим / Июль 2020'),
(14, 2, '0DlRJjLHrCU', 'ВЫГОРАНИЕ, Эмоциональный ИНТЕЛЛЕКТ, Синдром САМОЗВАНЦА / Интервью с психологом из айтишников'),
(15, 2, 'HVrYnPW5pi0', 'Как программируют графику в играх / Интервью с Graphics Engineer из Wargaming'),
(16, 2, 'Bqu7QpJoTaE', 'Как айтишнику запустить свой бизнес / Интервью с Николаем Ясинским'),
(17, 2, 'mBX7aagXH_A', 'Как работают дизайнеры в Яндекс.Дзен / Интервью с ведущим продуктовым дизайнером Михаилом Аникиным'),
(18, 2, 'ZfhrkyXjkhc', 'Как работают программисты в Яндекс.Дзен / Интервью с тимлидом Дмитрием Ушановым'),
(19, 2, '7bUYEMZVMCE', 'Машинное обучение и нейросети / Интервью с техническим директором Яндекс.Дзен'),
(20, 2, 'KJGBg_IXWfQ', 'Как работается в Яндекс.Дзене / ПОЛНЫЙ обзор компании'),
(21, 2, 'QQZmDWnV618', 'ЯЗЫК ЯЗЫКОВ! / Всё про C++ и разработку игр / Интервью с Lead Core Developer World of Tanks Blitz'),
(22, 2, 'nII0ralSlRo', 'СИЛА Функционального Программирования / Всё о Scala / Интервью со Scala Developer Олегом Нижниковым');

-- --------------------------------------------------------

--
-- Структура таблицы `youtubes`
--

CREATE TABLE `youtubes` (
  `id` int(11) NOT NULL,
  `channel_id` varchar(250) CHARACTER SET utf8 NOT NULL,
  `channel_name` varchar(250) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `youtubes`
--

INSERT INTO `youtubes` (`id`, `channel_id`, `channel_name`) VALUES
(1, 'UCnxk5BzZxRN7y3a1IqHhVlA', 'Pingvinus'),
(2, 'UCeObZv89Stb2xLtjLJ0De3Q', 'АйТиБорода');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `youtubes`
--
ALTER TABLE `youtubes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `youtubes`
--
ALTER TABLE `youtubes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
