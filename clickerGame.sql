SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clickerGame`
--

-- --------------------------------------------------------

--
-- Table structure for table `Player`
--

CREATE TABLE `Player` (
  `pid` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) UNIQUE NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (pid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Admin` (
  `aid` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) UNIQUE NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (aid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Game` (
  `gid` int(7) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(6) UNSIGNED NOT NULL,
  `score` int(10) UNSIGNED NOT NULL,
  `game_time` TIME UNSIGNED NOT NULL,
  PRIMARY KEY (gid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Statistics` (
  `pid` int(6) UNSIGNED NOT NULL,
  `highscore` int(6) UNSIGNED NOT NULL,
  `games_played` int(10) UNSIGNED NOT NULL,
  `clicks_per_min` int(6) UNSIGNED NOT NULL,
  `total_time` TIME UNSIGNED NOT NULL,
  PRIMARY KEY (pid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
