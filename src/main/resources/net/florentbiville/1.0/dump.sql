--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
CREATE TABLE `candidate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `party_name` varchar(100) NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `party` (`party_name`),
  UNIQUE KEY `oneCandidatePerParty` (`first_name`, `last_name`, `party_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` VALUES (1,'Nicolas', 'Sarkozy', 'Union pour un Mouvement Populaire');
INSERT INTO `candidate` VALUES (2,'S�gol�ne', 'Royal', 'Parti Socialiste');
INSERT INTO `candidate` VALUES (3,'Fran�ois', 'Bayrou', 'Union pour la D�mocratie Fran�aise');
INSERT INTO `candidate` VALUES (4,'Jean-Marie', 'Le Pen', 'Front National');
INSERT INTO `candidate` VALUES (5,'Olivier', 'Besancenot', 'Ligue Communiste R�volutionnaire');
INSERT INTO `candidate` VALUES (6,'Philippe', 'de Villiers', 'Mouvement Pour la France');
INSERT INTO `candidate` VALUES (7,'Marie-Georges', 'Buffet', 'Parti Communiste Fran�ais');
INSERT INTO `candidate` VALUES (8,'Dominique', 'Voynet', 'Les Verts');
INSERT INTO `candidate` VALUES (9,'Arlette', 'Laguillier', 'Lutte Ouvri�re');
INSERT INTO `candidate` VALUES (10,'Jos�', 'Bov�', NULL);
INSERT INTO `candidate` VALUES (11,'Fr�d�ric', 'Nihous', 'Chasse, P�che, Nature et Traditions');
INSERT INTO `candidate` VALUES (12,'G�rard', 'Schivardi', 'Comit� National pour la Reconqu�te des Services Publics');


--
-- Table structure for table `voter`
--

DROP TABLE IF EXISTS `voter`;
CREATE TABLE `voter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_vote` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `chosen_candidate` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `voted_for` (`chosen_candidate`),
  FOREIGN KEY (chosen_candidate) REFERENCES `candidate` (id) ON DELETE CASCADE,
  UNIQUE KEY `one_candidate_per_voter` (`first_name`, `last_name`, `chosen_candidate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `voter`
--