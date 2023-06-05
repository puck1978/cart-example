-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server-Version:               10.6.12-MariaDB-0ubuntu0.22.04.1-log - Ubuntu 22.04
-- Server-Betriebssystem:        debian-linux-gnu
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Exportiere Struktur von Tabelle cart_example.cart
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `customer_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle cart_example.cart: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle cart_example.cart_item
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE IF NOT EXISTS `cart_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F0FE25271AD5CDBF` (`cart_id`),
  UNIQUE KEY `UNIQ_F0FE25274584665A` (`product_id`),
  CONSTRAINT `FK_F0FE25271AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FK_F0FE25274584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle cart_example.cart_item: ~0 rows (ungefähr)

-- Exportiere Struktur von Tabelle cart_example.doctrine_migration_versions
DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Exportiere Daten aus Tabelle cart_example.doctrine_migration_versions: ~1 rows (ungefähr)
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20230605002841', '2023-06-05 02:30:12', 86);

-- Exportiere Struktur von Tabelle cart_example.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle cart_example.product: ~3 rows (ungefähr)
INSERT INTO `product` (`id`, `name`, `description`, `price`) VALUES
	(1, 'Xiaomi Poco X3 Pro', '<h1>Xiaomi Poco X3 Pro 8GB 256GB</h1>\n<h3>High-End-Gaming-Handy</h3>\n<p>Das Xiaomi Poco X3 Pro 256GB ist ein Premium-Smartphone, das sich hervorragend zum Spielen eignet. Dank des Qualcomm® Snapdragon™ 860-Prozessors liefert das Smartphone selbst bei grafisch anspruchsvollen Spielen mit hohen Einstellungen extrem leistungsstarke Ergebnisse. Mit dem Xiaomi Poco X3 Pro 256GB genießen Sie lagfreies (Online-)Gameplay und hohe Geschwindigkeiten.</p>\n<p>Das Smartphone hat einen schönen großen Bildschirm von 6,67 Zoll mit einer FHD+ Auflösung von 2400x1080p. Das Poco X3 Pro verfügt über eine hohe Bildwiederholfrequenz von 120 Hz, wodurch sich das Swipen und Spielen sehr flüssig und glatt anfühlt. Darüber hinaus sorgt die 240Hz-Touch-Sampling-Rate (die Anzahl der Überprüfungen eines Bildschirms auf Berührungen) dafür, dass jede Berührung des Bildschirms genau erkannt wird, was zu einer besseren Steuerung beim Spielen führt. Die Dual-Lautsprecher an der Ober- und Unterseite des Telefons sorgen für ein beeindruckendes Surround-Sound-Erlebnis beim Spielen oder Netflix schauen.</p>\n<p>Die verbesserte UFS 3.1-Speichertechnologie sorgt für blitzschnelle Lese- und Schreibgeschwindigkeiten, sodass Apps und Spiele kaum Zeit zum Laden benötigen. Alle Ihre Daten können auf dem großen 256-GB-Speicher abgelegt werden. Die hochwertige Quad-Kamera mit 48-MP-Hauptkamera, 8-MP-Ultra-Weitwinkelkamera, 2-MP-Tiefensensor und 2-MP-Makrokamera ermöglicht hervorragende Fotos und Videos, sowohl aus der Ferne als auch aus der Nähe. Die 20-MP-Selfie-Kamera schießt auch perfekte Bilder, ideal für soziale Netzwerke. Sie können sogar die vordere und die hintere Kamera kombinieren, indem Sie mit beiden gleichzeitig filmen - für spannende und interaktive Videos!</p>\n<h3>Hervorragende Akkuleistung</h3>\n<p>Dank des riesigen 5160-mAh-Akkus kannst du stundenlang verschiedene Aktivitäten auf deinem Smartphone genießen, ohne es zwischendurch aufladen zu müssen. Mit diesem Akku können Sie nicht weniger als 11 Stunden lang Spiele spielen oder 18 Stunden lang Videos ansehen - mehr als genug für zwei Tage Nutzung! Dank der 33-Watt-Schnellladefunktion ist das Handy dann schnell wieder aufgeladen. Innerhalb von 59 Minuten ist das Telefon bereits zu 100 % aufgeladen.</p>\n<p>Das Xiaomi Poco X3 Pro 256GB ist mit dem leistungsstarken Corning Gorilla Glass 6 ausgestattet, das dem Smartphone ultimativen Schutz vor Beschädigungen bietet. Er übersteht sogar einen Sturz aus bis zu 1,6 Metern Höhe auf harten, rauen Oberflächen. Darüber hinaus ist der Bildschirm 2x kratzfester als bei normalen Handys. Die Oberfläche des Smartphones ist resistent gegen Fingerabdrücke, sodass das Telefon immer wie neu aussieht. De 3.5mm jack-aansluiting, de IP53 spatwaterdichtheid en Infrarood blaster maken de telefoon helemaal af.&nbsp;</p>\n<ul>\n<li>Blitzschnelle Leistung dank des Qualcomm® Snapdragon™ 860-Prozessors</li>\n<li>120Hz Bildwiederholfrequenz für flüssige Bilder</li>\n<li>48-MP-Quad-Kamera für die Aufnahme bester Fotos und Videos</li>\n<li>5160mAh-Akku für stundenlangen Spielspaß</li>\n<li>Kratz- und sturzfestes Corning Gorilla Glass 6<br><br></li>\n</ul>', 299.95),
	(2, 'Xiaomi Poco X4', '<h1>Xiaomi Poco X4 GT 8GB 128GB</h1>\n<p>Xiaomi Poco hat mit dem Poco X4 GT ein Budget-Smartphone entwickelt, das auch zum Spielen geeignet ist! Dieses Smartphone verfügt über ein 6,6-Zoll-Full-HD+-Display mit 144 Hz und liefert mit dem MediaTek Dimensity 8100 Prozessor eine starke Leistung. Das brandneue Android 12 bietet alle aktuellen Anwendungen und intelligenten Funktionen.</p>\n<p>Dank der überlegenen 5nm-Prozesstechnologie von TSMC ist der MediaTek Dimensity 8100-Prozessor ein kompletter und leistungsstarker Prozessor, der sofort einsatzbereit ist. Darüber hinaus sorgt seine neue energieeffiziente Architektur für einen geringen Stromverbrauch und eine energiegeladene Verarbeitungsleistung. Ergänzt wird dieser Prozessor durch eine Arm Mali-G610 MC6 GPU, die für eine schnelle Bearbeitung aller Videoaufgaben sorgt. Mit anderen Worten: Das Poco X4 beweist, dass auch Budget-Smartphones mit High-End-Gaming umgehen können.</p>\n<h3>Größerer Akku, längere Akkulaufzeit</h3>\n<p>Natürlich möchte man seine Lieblingsspiele auch über einen längeren Zeitraum spielen können, dafür hat das Xiaomi Poco X4 GT einen großen Akku verbaut. Dieser 5.080-mAh-Akku ermöglicht auch ein schnelles Aufladen, mit satten 67 Watt. Das mitgelieferte Ladegerät lädt das Poco X4 GT innerhalb von 45 Minuten so weit auf, dass man das Handy wieder einen ganzen Tag lang benutzen kann. Ein paar Beispiele für die Leistung: Mit einem vollen Akku können Sie 36 Stunden lang telefonieren oder 120 Stunden Musik hören, 22 Stunden lang Videos abspielen oder 26 Stunden lang lesen.</p>\n<p>Obwohl dieses Gerät für Spiele gedacht ist, sind nicht weniger als 3 leistungsstarke Kameras eingebaut. Es handelt sich um eine 64-MP-Hauptlinse, eine 8-MP-Weitwinkelkamera und eine 2-MP-Makrolinse auf der Rückseite. Mit dieser Kombination lassen sich sehr scharfe Fotos sowohl aus der Ferne als auch aus der Nähe aufnehmen. Außerdem können Sie Videos in gestochen scharfer 4k-Auflösung aufnehmen.</p>\n<h3>Bildschirm für das beste Spielerlebnis</h3>\n<p>Das Poco X4 verfügt über einen beeindruckenden 6,6-Zoll-LCD-Bildschirm mit DCI-P3 und FHD+ von 1080x2460p. Der Bildschirm bietet 407 PPI und füllt das Smartphone mit lebensechten Farben. Der Bildschirm passt das Seitenverhältnis auf das ungewöhnliche 20;5:9 an, damit mehr Bilder auf das Smartphone passen, ohne es zu vergrößern. Mit einer noch nie dagewesenen Bildwiederholfrequenz von 144 Hz sorgt der Bildschirm für eine extrem flüssige Wiedergabe von komplexen Spielen.</p>\n<p>Dank Dolby Vision zeigt der Bildschirm atemberaubende Farben, intensive Kontraste und reiche Details. So erhalten Sie eine sehr flüssige Bilddarstellung, die Ihnen jederzeit und überall das Gefühl gibt, im Kino oder in der Hauptrolle Ihres eigenen Spiels zu sein. Die DC-Dimmung reduziert schädliches blaues Licht auf dem Bildschirm, so dass Sie mehrere Stunden lang unbeschwert spielen können.</p>\n<ul>\n<li>6,6-Zoll-LCD-Bildschirm</li>\n<li>144 Hz DynamicSwitch DotDisplay</li>\n<li>5.080 mAh-Akku</li>\n<li>3 Kameras: 64MP + 8MP + 2MP</li>\n<li>Leistungsstarker Dimensity 8100 Prozessor</li>\n<li>Dolby Vision<br><br></li>\n</ul>', 369.95),
	(3, 'Xiaomi Poco F3', '<h1>Xiaomi Poco F3 8GB 256GB</h1>\n<p>Das Xiaomi Poco F3 6GB 256GB ist ein besonderes Smartphone mit starker Leistung. Der superschnelle 5G Snapdragon 870-Prozessor ist in der Tat der bisher stärkste Prozessor von Poco! Das gesamte Nutzererlebnis ist sehr flüssig, ob beim Ansehen von Videos, Spielen oder Surfen, der Prozessor ist immer einen Schritt voraus. Mit einem 3,2-GHz-Prozessor, 120-Hz-Amoled und zwei Dolby-Atmos-Lautsprechern bietet Ihnen dieses Xiaomi-Smartphone unzählige Möglichkeiten.</p>\n<p>Das Poco F3 hat auch die 5G-Option, die Ihnen schnelles Internet in ganz Europa bietet! Selbst in Innenräumen haben Sie dank Wi-Fi 6 auf dem Smartphone superschnellen Internetzugang. Wenn Sie das Smartphone benutzen, müssen Sie sich keine Sorgen um einen leeren Akku machen. Mit dem 4520-mAh-Akku können Sie bis zu 14 Stunden lang Videos ansehen oder 10 Stunden lang Spiele spielen - genug für 2 Tage Nutzung! Dank der 33-W-Schnellladefunktion kann das Smartphone in der Rekordzeit von 52 Minuten auf 100 Prozent aufgeladen werden.</p>\n<h3>Leichtere Handhabung als sein Vorgänger</h3>\n<p>Die Grafik des Poco F3 ist dank des 6,67-Zoll-AMOLED-Bildschirms mit HDR10+ und 1300 nits atemberaubend. Der wunderschöne Bildschirm aktualisiert sich mit bis zu 120 Bildern pro Sekunde und garantiert so eine unvergleichlich flüssige Darstellung. Das Smartphone hat eine Abtastfrequenz von 360 Hz. Der Berührungsalgorithmus ist also sehr raffiniert. Das Smartphone reagiert extrem schnell auf alle Ihre Berührungen, was das Spielen von Handyspielen noch attraktiver macht.</p>\n<p>Mit dem Poco F3 256GB benötigen Sie keine separate Kamera mehr. Die Hauptkamera mit 48 Megapixeln macht fantastische Fotos in allen Situationen! Die Kamera wird von der 5-MP-Telefoto-Makrokamera und der 8-MP-Ultraweitwinkelkamera unterstützt. Diese kombinierten Kameras nehmen Fotos mit einem Blickwinkel von 119 Grad auf, sodass Sie den gesamten Horizont sehen können.</p>\n<p>Das Smartphone verfügt über ein dreidimensionales Wärmeableitungssystem. Dies ist ideal für schwerere Aufgaben, damit das Poco F3 nicht überhitzt. Bemerkenswert ist auch das schlanke Gehäuse des Smartphones, das nur 7,88 mm dick ist. NFC, Fingerabdruckscanner, GPS und IP-Blaster runden das Bild ab!</p>\n<ul>\n<li>5G Snapdragon 870-Prozessor</li>\n<li>Amoled-Bildschirm mit 2400x1080 FHD+</li>\n<li>4520mAh großer Akku</li>\n<li>6 GB RAM und 256 GB ROM<br><br></li>\n</ul>', 349.95);

-- Exportiere Struktur von Tabelle cart_example.product_image
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `src` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `is_main` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64617F034584665A` (`product_id`),
  CONSTRAINT `FK_64617F034584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle cart_example.product_image: ~3 rows (ungefähr)
INSERT INTO `product_image` (`id`, `product_id`, `src`, `width`, `height`, `alt_text`, `is_main`) VALUES
	(1, 1, '/uploads/products/xiaomi-poco-x3-pro.jpg', 1000, 1000, 'Xiaomi Poco X3 Pro', 1),
	(2, 2, '/uploads/products/xiaomi-poco-x4.jpg', 1000, 1000, 'Xiaomi Poco X4', 1),
	(3, 3, '/uploads/products/xiaomi-poco-f3.jpg', 1000, 1000, 'Xiaomi Poco F3', 1);

-- Exportiere Struktur von Tabelle cart_example.product_variant
DROP TABLE IF EXISTS `product_variant`;
CREATE TABLE IF NOT EXISTS `product_variant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext DEFAULT NULL,
  `short` varchar(32) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_209AA41D4584665A` (`product_id`),
  CONSTRAINT `FK_209AA41D4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Exportiere Daten aus Tabelle cart_example.product_variant: ~0 rows (ungefähr)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
