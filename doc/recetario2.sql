-- CREATE DATABASE IF NOT EXISTS `recetario` CHARACTER SET utf8mb4;
-- /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ 
-- /*!80016 DEFAULT ENCRYPTION='N' */

-- USE recetario;

CREATE TABLE IF NOT EXISTS `contactos` (
  `idcontacto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mensaje` varchar(180),
  `tipo` varchar(10),
  `estrellas` int,
  PRIMARY KEY (`idcontacto`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);
-- ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `recetas` (
  `idreceta` int NOT NULL AUTO_INCREMENT,
  `titulo_largo` varchar(100) DEFAULT NULL,
  `resumen` text NOT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `rinde` int DEFAULT NULL COMMENT 'Cantidad de porciones',
  `tiempo_min` int DEFAULT NULL COMMENT 'Tiempo de preparacion en minutos',
  `proceso` text,
  PRIMARY KEY (`idreceta`)
);
-- ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ingredientes` (
  `idingrediente` int NOT NULL AUTO_INCREMENT,
  `idreceta` int NOT NULL,
  `orden` int NOT NULL,
  `ingrediente` varchar(60) NOT NULL,
  PRIMARY KEY (`idingrediente`),
  FOREIGN KEY (`idreceta`) REFERENCES `recetas` (`idreceta`)
);

--  KEY `idreceta_idx` (`idreceta`),
--  CONSTRAINT `idreceta` FOREIGN KEY (`idreceta`) REFERENCES `recetas` (`idreceta`)


-- INSERTS de Contactos
INSERT INTO contactos VALUES (1, "Miguel Angel Gutierrez","ing.miguel.gutierrez@gmail.com","Me gustaría agreguen una receta con pescado de rio","",0);
INSERT INTO contactos VALUES (2, "Juan Perez","juan.perez@gmail.com","Hice la suprema maryland, me salió bastante bien!","",0);
INSERT INTO contactos VALUES (3, "María Fernández","maria.fer@gmail.com","¡La mejor experiencia culinaria que he tenido! Los platos son exquisitos y el servicio impecable.","RESENIA",5);
INSERT INTO contactos VALUES (4, "Jorge Rodríguez","jorge.rod@gmail.com","Cada bocado es una explosión de sabores. Definitivamente regresaré con más amigos.","RESENIA",4);
INSERT INTO contactos VALUES (5, "Lucía Pérez","lucia.perez@gmail.com","La atención al detalle en cada plato es impresionante. Un lugar obligado para los amantes de la buena comida.","RESENIA",4);
INSERT INTO contactos VALUES (6, "David González","david.gon@gmail.com","¡Simplemente espectacular! La combinación de ingredientes frescos y técnicas modernas es insuperable.","RESENIA",5);
INSERT INTO contactos VALUES (7, "Carmen Ruiz","carmen.ruiz@gmail.com","Un verdadero deleite gastronómico. Los chefs son unos artistas y su pasión se refleja en cada plato.","RESENIA",5);
INSERT INTO contactos VALUES (8, "Antonio López","antonio.lopez@gmail.com","Un ambiente acogedor y una comida que te hace sentir como en casa. Muy recomendado.","RESENIA",4);

-- INSERTS de Recetas
INSERT INTO recetas VALUES(1,"Un plato abundante y sabroso para compartir: la suprema Maryland","La suprema Maryland , también llamada suprema a la maryland o pechuga maryland, se cree que viene de EEUU y es lo más probable por su nombre aunque lo cierto es que es una comida que ya se hizo popular en todo el mundo. Debido a eso, vamos a encontrar recetas muy variadas y una cantidad que les juro que marea. Así que lo mejor es tener en cuenta la base que le da su identidad a la suprema Maryland y a partir de eso experimentar hasta encontrar lo que a cada uno le guste. Y a eso precisamente apunta la receta que les vamos a brindar.","/static/img/suprema.jpg","Suprema Maryland",4,60,"Cómo hacer suprema maryland de la manera más sencilla. Salpimentar a gusto las pechugas de pollo. Preparar tres platos hondos: uno con harina, otro con huevo batido y el tercero con pan rallado. Pasar cada pechuga por harina, luego por huevo y finalmente por pan rallado, cubriendo uniformemente. Calentar suficiente aceite en una sartén a fuego medio. Freír 5-6 minutos por cada lado hasta que estén doradas y cocidas. En una cacerola derretir la mantequilla, añadir la harina y revolver hasta formar una pasta. Verter la leche, revolviendo hasta que espese. Agregar el choclo procesado y cocinar 5 minutos. Pelar las bananas, pasarlas por el huevo batido y luego pan rallado. Freírlas en abundante aceite caliente. Retirar y colocar sobre papel absorbente. Servir caliente las supremas con la salsa y las bananas fritas en el mismo plato. Se pueden acompañar con huevos fritos y papas pay.");
INSERT INTO recetas VALUES(2,"La mejor receta de pollo a la brasa para hacer en casa y tres opciones para usar lo que te sobre","Creo que en la gastronomía es donde más se puede ver la conexión de la humanidad más allá de las distancias, climas, flora y fauna. Quizás nos estemos poniendo filosóficos pero realmente si uno lo piensa hay recetas que se repiten en el mundo en lugares muy distantes. Y es que siempre como especie buscamos cocinar alimentos para que sean más seguros para nuestro organismo entre otras cosas. Tal es así que el pollo a la brasa se hace en todo el mundo pero la receta peruana le dio un toque absolutamente distintivo. Aunque la receta original se ha mantenido como un secreto bien guardado, al final dejamos una receta diseñada para hacer en casa. No importa que no tengas el sistema rotatorio de un restaurante, nosotros desde acá te damos ánimos así que ve por ese delicioso pollito.","/static/img/pollo.jpg","Pollo a la brasa peruano",6,300,"Paso a paso y girando se hace el pollo a la brasa. Lavar, secar bien y realizar cortes profundos al pollo. En un bol mezclar todos los ingredientes de la marinada hasta obtener una pasta homogénea. Cubrir bien todo el pollo con la marinada. Cubrirlo y dejar marinar en el refrigerador al menos 4 horas. Precalentar parrilla u horno a temperatura alta. Cocinar el pollo a la brasa, girando ocasionalmente para asegurar una cocción uniforme, durante aproximadamente 1 hora. Ir chequeando la cocción en la carne. Servir el pollo a la brasa peruano con la guarnición clásica elegida como papas fritas y ensalada.");
INSERT INTO recetas VALUES(3,"Un guiso muy rico y con sabor a mar para el frío: el chupe de camarones","Bienvenidos estimados y estimadas a este lugar de encuentro donde hablamos principalmente de comida pero también de otras cosas. Hoy quiero saber que opinan sobre los guisados y este mito que dice que son “pesados”. Muchas veces escuchamos que son comidas de época invernal pero sin duda nos hemos comido unos ricos guisos en pleno verano con 40 grados a la sombra (bueno, quizás no tanto). Y se me ocurrió que si el guiso lleva frutos de mar puede ser un poco más liviano si hace calor ¿qué creen? El chupe de camarones sería una excelente opción para comenzar a probar mi teoría. Lo pueden acompañar con una bebida fresquita porque tampoco la idea es inmolarnos por la causa. Para esto les dejamos una receta fácil y encantadora, después nos cuentan.","/static/img/guiso.jpg","Chupe de camarones",4,45,"5 pasos para un chupe de camarones increíble. En una olla sofreír la cebolla y el ajo en un poco de aceite de oliva hasta que estén dorados. Agregar las zanahorias, papas y choclo, y cocinar por unos minutos. Verter el caldo de pescado o camarones en la olla, cuando llegue a ebullición, agregar el arroz y cocinar hasta que esté tierno. Incorporar los camarones, arvejas y leche evaporada, cocinar a fuego medio hasta que los camarones se cocinen. Agregar el queso fresco revolviendo hasta que se derrita. En otro bol batir los huevos y agregarles un poco de la sopa caliente revolviendo constantemente. Verter en la olla revolviendo para crear una consistencia más espesa. Salpimentar a gusto. Cocinar a fuego lento unos minutos hasta que la sopa espese ligeramente. Servir caliente, espolvoreando perejil fresco picado por encima.");
INSERT INTO recetas VALUES(4,"Capas y capas de sabor: les presento al pasticho","¡Buonasera queridos! Si estás con ganas de cenar algo rico o estás pensando qué cocinar para la juntada familiar, esta receta te viene como caída del cielo. Te contamos todo sobre el pasticho, te damos una receta increíble y hasta la mejor forma de hacerlo para ensuciar poco la cocina y encima poder trasladarlo. Si te parece muy similar a la lasaña es porque lo es. De hecho su nombre viene del idioma italiano ¡Uy estoy spoileando un montón! Es que me gana el entusiasmo por una receta venezolana e italiana al mismo tiempo. Pero a no confundir, esto no es tampoco una receta de lasaña estilo italiano sino una adaptación venezolana a este plato emblemático. Ahora sí, los invito a leer y al final comentarnos si van a hacer esta receta.","/static/img/pasticho.jpg","Pasticho",8,120,"Paso a paso terminando con el armado. En una sartén calentar un poco de aceite de oliva y sofreír la cebolla y el ajo. Agregar la carne molida y cuando se dore añadir el tomate triturado, el orégano, la albahaca, la sal y la pimienta. Cocinar a fuego medio hasta que espese. En una cacerola derretir la mantequilla a fuego medio, agregar la harina y mezclar hasta formar una pasta. Verter la leche revolviendo para evitar grumos y cocinar hasta que la salsa espese. Condimentar con sal, pimienta y nuez moscada a gusto. Precalentar el horno a 180°C. En un molde para horno hacer el montaje. Colocar una capa de láminas de lasaña, luego una capa de la mezcla de carne y una capa de salsa bechamel. Repetir hasta llenar el molde. Espolvorear queso rallado sobre la capa superior. Hornear 30-40 minutos o hasta que esté dorado y burbujeante. Deja reposar durante unos minutos antes de cortar.");

-- INSERTS  de Ingredientes
INSERT INTO ingredientes VALUES(1,1,1,"4 pechugas de pollo");
INSERT INTO ingredientes VALUES(2,1,2,"1 taza de pan rallado");
INSERT INTO ingredientes VALUES(3,1,3,"1/2 taza de harina");
INSERT INTO ingredientes VALUES(4,1,4,"2 huevos batidos");
INSERT INTO ingredientes VALUES(5,1,5,"1 taza de leche");
INSERT INTO ingredientes VALUES(6,1,6,"Sal y pimienta a gusto");
INSERT INTO ingredientes VALUES(7,1,7,"Aceite vegetal para freír");
INSERT INTO ingredientes VALUES(8,1,8,"Para la salsa:");
INSERT INTO ingredientes VALUES(9,1,9,"1/4 taza de mantequilla");
INSERT INTO ingredientes VALUES(10,1,10,"1/4 taza de harina");
INSERT INTO ingredientes VALUES(11,1,11,"2 tazas de leche");
INSERT INTO ingredientes VALUES(12,1,12,"Sal y pimienta a gusto");
INSERT INTO ingredientes VALUES(13,1,13,"3 choclos amarillos desgranados");
INSERT INTO ingredientes VALUES(14,1,14,"Para las bananas fritas:");
INSERT INTO ingredientes VALUES(15,1,15,"4 bananas");
INSERT INTO ingredientes VALUES(16,1,16,"2 huevos");
INSERT INTO ingredientes VALUES(17,1,17,"1/2 taza de pan rallado");
INSERT INTO ingredientes VALUES(18,1,18,"Aceite, para freír");
INSERT INTO ingredientes VALUES(19,2,1,"1 pollo entero (aproximadamente 2 kg)");
INSERT INTO ingredientes VALUES(20,2,2,"Para la Marinada:");
INSERT INTO ingredientes VALUES(21,2,3,"4 dientes de ajo picados");
INSERT INTO ingredientes VALUES(22,2,4,"2 cucharadas de pasta de ají panca (o ají amarillo)");
INSERT INTO ingredientes VALUES(23,2,5,"2 cucharadas de vinagre de manzana");
INSERT INTO ingredientes VALUES(24,2,6,"2 cucharaditas de comino molido");
INSERT INTO ingredientes VALUES(25,2,7,"1 cucharadita de pimienta negra");
INSERT INTO ingredientes VALUES(26,2,8,"1 cucharadita de paprika");
INSERT INTO ingredientes VALUES(27,2,9,"Sal a gusto");
INSERT INTO ingredientes VALUES(28,2,10,"2 cucharadas de aceite vegetal");
INSERT INTO ingredientes VALUES(29,3,1,"500 g de camarones, pelados y limpios");
INSERT INTO ingredientes VALUES(30,3,2,"2 tazas de caldo de pescado o de camarones");
INSERT INTO ingredientes VALUES(31,3,3,"1 cebolla, picada finamente");
INSERT INTO ingredientes VALUES(32,3,4,"3 dientes de ajo, picados");
INSERT INTO ingredientes VALUES(33,3,5,"2 zanahorias, cortadas en rodajas");
INSERT INTO ingredientes VALUES(34,3,6,"2 papas, peladas y cortadas en cubos");
INSERT INTO ingredientes VALUES(35,3,7,"1 taza de choclo (maíz) desgranado");
INSERT INTO ingredientes VALUES(36,3,8,"1 taza de arvejas");
INSERT INTO ingredientes VALUES(37,3,9,"1 taza de leche evaporada");
INSERT INTO ingredientes VALUES(38,3,10,"1 taza de queso fresco, desmenuzado");
INSERT INTO ingredientes VALUES(39,3,11,"2 huevos");
INSERT INTO ingredientes VALUES(40,3,12,"1/4 de taza de arroz");
INSERT INTO ingredientes VALUES(41,3,13,"Aceite de oliva");
INSERT INTO ingredientes VALUES(42,3,14,"Sal y pimienta a gusto");
INSERT INTO ingredientes VALUES(43,3,15,"Perejil fresco picado");
INSERT INTO ingredientes VALUES(44,4,1,"Láminas de lasaña pre-cocidas o con masa para lasaña casera");
INSERT INTO ingredientes VALUES(45,4,2,"500 gr de carne molida de res");
INSERT INTO ingredientes VALUES(46,4,3,"1 cebolla picada");
INSERT INTO ingredientes VALUES(47,4,4,"2 dientes de ajo, picados");
INSERT INTO ingredientes VALUES(48,4,5,"400 gr de tomate triturado");
INSERT INTO ingredientes VALUES(49,4,6,"1 cucharadita de orégano");
INSERT INTO ingredientes VALUES(50,4,7,"1 cucharadita de albahaca");
INSERT INTO ingredientes VALUES(51,4,8,"Sal y pimienta a gusto");
INSERT INTO ingredientes VALUES(52,4,9,"Aceite de oliva para cocinar");
INSERT INTO ingredientes VALUES(53,4,10,"Queso rallado (tipo amarillo o mozzarella) para gratinar");
INSERT INTO ingredientes VALUES(54,4,11,"Salsa Bechamel:");
INSERT INTO ingredientes VALUES(55,4,12,"4 cucharadas de mantequilla");
INSERT INTO ingredientes VALUES(56,4,13,"4 cucharadas de harina");
INSERT INTO ingredientes VALUES(57,4,14,"4 tazas de leche");
INSERT INTO ingredientes VALUES(58,4,15,"Sal, pimienta y nuez moscada a gusto");

COMMIT;

-- SELECTS
-- SELECT * FROM contactos;

-- SELECT * FROM recetario.recetas;

-- SELECT * FROM recetario.ingredientes where idreceta=4 ORDER BY idreceta,orden;

-- SELECT r.*,i.orden,i.ingrediente FROM recetas r,ingredientes i where r.idreceta=i.idreceta order by idreceta,orden;