CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "country" char(3),
  "gender" varchar
);

CREATE TABLE "profiles" (
  "id" uuid PRIMARY KEY,
  "url_photo" varchar,
  "points_carrer" int,
  "questions" int,
  "requests" int,
  "profile_course_id" uuid,
  "info_user_id" uuid,
  "suscription_id" uuid
);

CREATE TABLE "profile_courses" (
  "id" uuid PRIMARY KEY,
  "completed" boolean,
  "course_id" uuid
);

CREATE TABLE "suscriptions" (
  "id" uuid PRIMARY KEY,
  "personal_suscription_id" uuid,
  "enterprise_suscription_id" uuid
);

CREATE TABLE "enterprise_suscriptions" (
  "id" uuid PRIMARY KEY,
  "name_suscription" varchar,
  "no_students" int,
  "duration" timestamp,
  "price" money,
  "saving" int,
  "benefits" text
);

CREATE TABLE "personal_suscriptions" (
  "id" uuid PRIMARY KEY,
  "name_suscription" varchar,
  "no_students" int,
  "duration" timestamp,
  "price" money,
  "saving" int,
  "benefits" text
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "url_icon" varchar,
  "name_categorie" varchar
);

CREATE TABLE "escuelas" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url_icon" varchar,
  "categories_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "url_icon" varchar,
  "name_creator" varchar,
  "escuela_id" uuid
);

CREATE TABLE "lessons" (
  "id" uuid PRIMARY KEY,
  "order" int,
  "title_lesson" varchar,
  "url_video" varchar,
  "course_id" uuid
);

ALTER TABLE "escuelas" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("escuela_id") REFERENCES "escuelas" ("id");

ALTER TABLE "lessons" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "profile_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "profiles" ADD FOREIGN KEY ("info_user_id") REFERENCES "users" ("id");

ALTER TABLE "profiles" ADD FOREIGN KEY ("profile_course_id") REFERENCES "profile_courses" ("id");

ALTER TABLE "profiles" ADD FOREIGN KEY ("suscription_id") REFERENCES "suscriptions" ("id");

ALTER TABLE "suscriptions" ADD FOREIGN KEY ("personal_suscription_id") REFERENCES "personal_suscriptions" ("id");

ALTER TABLE "suscriptions" ADD FOREIGN KEY ("enterprise_suscription_id") REFERENCES "enterprise_suscriptions" ("id");

ALTER TABLE "profiles" ADD FOREIGN KEY ("id") REFERENCES "users" ("id");



--- SUSCRIPTIONS --- 

insert into personal_suscriptions (
	id, 
	name_suscription ,
	no_students,
	duration,
	price,
	saving,
	benefits
 ) values (
 	-- Plan Expert
	'aa7f47c2-7815-4680-9d88-6e928ff41849',
	'Expert',
	1,
	default,
	490,
	409,
	' Eventos exclusivos como la Platzi Conf, Más de 1000 cursos y 21 escuelas, Certificado digital de cursos y escuelas'	
) , (
	-- Plan Expert Duo
	'f18acb46-dd3b-49fd-975b-1c5610044144',
	'Expert Duo',
	2,
	default,
	690,
	489,
	' Eventos exclusivos como la Platzi Conf, Más de 1000 cursos y 21 escuelas, Certificado digital de cursos y escuelas'
) , (
	-- Plan Expert Family
	'd2e67e34-2dde-4fdb-8055-3ceb3e8f8a12',
	'Expert Family',
	4,
	default,
	990,
	809,
	' Eventos exclusivos como la Platzi Conf, Más de 1000 cursos y 21 escuelas, Certificado digital de cursos y escuelas'
);

insert into enterprise_suscriptions (
	id , 
	name_suscription ,
	no_students ,
	duration ,
	price ,
	saving ,
	benefits
) values (
	-- Plan Team
	'd2e67e34-2dde-4fdb-8055-3ceb3e8f8a12',
	'Team',
	3 ,
	default, 
	709 , 
	0, 
	'Accede a los más de 1000 cursos de Platzi , Analiza el avance de tu equipo con datos y estadísticas, Recibe soporte por correo electrónico'
) , (
	-- Plan Bussines
	'21d2fa29-4c1d-440d-8c2b-8ca6211cfa12',
	'Bussines',
	10,
	default,
	961 ,
	0 , 
	'Testea los conocimientos de cada estudiante, Ten acompañamiento y soporte de un Account Manager, Asesórate en vivo sobre el onboarding a la plataforma'
) , (
	-- Plan Enterprise
	'fa58f5db-4729-4359-8d3b-dc373e5d0b56',
	' Enterprise',
	30,
	default,
	9999,
	0,
	'Recibe certificados cobrandeados, Accede a clases exclusivas con Profesores Platzi, Modifica la lista de estudiantes cuando quieras'
) ; 

insert into suscriptions (
	id , 
	personal_suscription_id ,
	enterprise_suscription_id 
) values (
	'9d4bd65f-3877-4d42-a5b1-695366c30b36',
	-- Plan Expert
	'aa7f47c2-7815-4680-9d88-6e928ff41849',
	-- Plan Team 
	'd2e67e34-2dde-4fdb-8055-3ceb3e8f8a12'
) , (
	'23b9e0a4-110d-45da-ad14-ac903f257af8',
	-- Plan Expert Duo 
	'f18acb46-dd3b-49fd-975b-1c5610044144',
	-- Plan Bussines
	'21d2fa29-4c1d-440d-8c2b-8ca6211cfa12'
) , (
	'96448b3d-ddcf-4ae0-b1b1-456449c19102',
	-- Plan Expert Family
	'd2e67e34-2dde-4fdb-8055-3ceb3e8f8a12',
	-- Plan Enterprise
	'fa58f5db-4729-4359-8d3b-dc373e5d0b56'
); 

--- CURSOS ---

-- Table Categories
insert into categories (
	id, 
	url_icon ,
	name_categorie 
) values (
	'2b7d94a5-894d-4835-bee1-b91dd28ae6fe',
	'https://static.platzi.com/media/learningpath/badges/4856d62b-ea96-4d77-964c-a1acbd96b85e.jpg',
	'Desarrollo e Ingenieria'
) , (
	'f15a227a-96f7-43bd-a3fe-6c70904ac358',
	'https://static.platzi.com/media/learningpath/badges/1bc33b50-fc35-48bf-80b6-3daf433ba996.jpg',
	'Marketing'
) , (
	'1c6939de-9364-444a-ad51-bcf0186c1a1a',
	'https://static.platzi.com/media/learningpath/badges/45b2f6c3-de66-4e3b-adcc-dc3f36292871.jpg',
	'Diseño y UX'
) , (
	'fd5a83e7-27e7-4ea8-bde3-174c0da307f0', 
	'https://static.platzi.com/media/learningpath/badges/9f70618f-1620-4cf9-a7f2-e29373eadef3.jpg',
	'Habilidades blandas'

) , (
	'af6747c0-265e-4f8c-8cba-0eecd05b20ae',
	'https://static.platzi.com/media/learningpath/badges/73c76c4c-f849-4e08-b408-111d13743480.jpg',
	'Negocios y emprendimiento'

) , (
	'ec7b5eef-b752-49a7-8ded-ab135d90e000',
	'https://static.platzi.com/media/learningpath/badges/e6e96c95-9630-4b29-8409-090cbc85ddfe.jpg',
	'Contenido Digital'
	
) , (
	'df6864a4-b3d7-49db-bce4-8fd137af0a1e', 
	'https://static.platzi.com/media/learningpath/badges/defb0445-eb18-4a28-806b-d837452c487a.jpg',
	'Startups'
	
) , (
	'6f76adf1-9213-47e0-bdd3-a94dc2c8ba02',
	'https://static.platzi.com/media/achievements/aprender-ingles-online_badge-8a97002a-7427-4e19-862b-b155e9a57c25.png',
	'Ingles'	
); 

-- Table Escuelas 
insert into escuelas (
	id,
	title,
	url_icon ,
	categories_id 
) values (
	'659d682f-60df-4396-8330-99a8d40f0e0c',
	'Backend, Arquitectura y Bases de datos',
	'https://static.platzi.com/media/learningpath/badges/9506da80-e4d3-4c93-89a7-a09450ee98c6.jpg',
	-- Categorie: Desarrollo e Ingenieria 
	'2b7d94a5-894d-4835-bee1-b91dd28ae6fe'
) , (
	'3572e100-0102-486f-a582-b7721ea4e9a2',
	'Fundamentos de programación',
	'https://static.platzi.com/media/learningpath/badges/b1024d96-eebe-4301-a3e4-df75daed2548.jpg', 
	-- Categorie: Desarrollo e Ingenieria 
	'2b7d94a5-894d-4835-bee1-b91dd28ae6fe'
) , (
	'59db8b20-bd2c-4564-a612-cefaf09296bf',
	'Community Manager y Redes Sociales',
	'https://static.platzi.com/media/learningpath/badges/867a6ef3-f280-40cc-8c7e-34cbf9f15652.jpg', 
	-- Categorie: Marketing
	'f15a227a-96f7-43bd-a3fe-6c70904ac358'
) , (
	'c881bd77-0e1c-4d0c-8731-10637ccd1769',
	'Data Marketer',
	'https://static.platzi.com/media/learningpath/badges/cf06b678-8a5c-41a6-8e71-ded9c318216e.jpg', 
	-- Categorie: Marketing
	'f15a227a-96f7-43bd-a3fe-6c70904ac358'
) , (
	'fdfd4113-ed8c-4195-a3e9-0ca9931186f5',
	'Branding Designer',
	'https://static.platzi.com/media/learningpath/badges/45b2f6c3-de66-4e3b-adcc-dc3f36292871.jpg', 
	-- Categorie: Diseño y UX 
	'1c6939de-9364-444a-ad51-bcf0186c1a1a'
) , (
	'118a8242-cdae-4b97-9077-11dafdaef70e',
	'UI/UX Designer',
	'https://static.platzi.com/media/learningpath/badges/73526c04-2c6b-4048-82a0-9ebaa5809fdf.jpg', 
	-- Categorie: Diseño y UX 
	'1c6939de-9364-444a-ad51-bcf0186c1a1a'
) , (
	'67bfcfc4-b476-47c6-93a1-5b000c53f78f',
	'Finanzas Personales',
	'https://static.platzi.com/media/learningpath/badges/9f70618f-1620-4cf9-a7f2-e29373eadef3.jpg', 
	-- Categorie: Habilidades blandas
	'fd5a83e7-27e7-4ea8-bde3-174c0da307f0'
) , (
	'9fab099b-8e3d-4473-a3a3-1acf9c402e46',
	'Bussiness Intelligence y Data Management ',
	'https://static.platzi.com/media/learningpath/badges/73c76c4c-f849-4e08-b408-111d13743480.jpg',
	-- Categorie: Negocios y Emprendimiento 
	'af6747c0-265e-4f8c-8cba-0eecd05b20ae'
) , (
	'c9935e9c-03b5-41e1-b1aa-563d815f6dd7',
	'Estrategia de contenidos', 
	'https://static.platzi.com/media/achievements/badge-streaming-telefono-fc161a9b-d743-4173-babf-2233c22ca4af.png',
	-- Categorie: Contenido Digital  
	'ec7b5eef-b752-49a7-8ded-ab135d90e000'
) , (
	'b4c36545-1cbc-4674-bf63-a124752d00f9',
	'No-Code Maker',
	'https://static.platzi.com/media/learningpath/badges/defb0445-eb18-4a28-806b-d837452c487a.jpg', 
	-- Categorie: Startups 
	'df6864a4-b3d7-49db-bce4-8fd137af0a1e'
) , (
	'a6661ddb-3c19-4a2c-acc5-302b91d1c2d8',
	'Platzi English Academy',
	'https://static.platzi.com/media/learningpath/badges/e12a32a9-6a1d-4a2d-837f-75178865c92a.jpg', 
	-- Categorie: Ingles 
	'6f76adf1-9213-47e0-bdd3-a94dc2c8ba02'
);

-- Table Courses 
insert into courses (
	id ,
	url_icon ,
	name_creator ,
	escuela_id 
) values (
	'fb647caf-0225-40cb-b49f-0e1bebf12d30',
	'https://static.platzi.com/media/achievements/badge-introduccion-desarrollo-backend-c9d6cd7f-4de1-42a5-b9c5-2c014b6bfce9.png',
	'Curso de Introducción al Desarrollo Backend - Facundo García Martoní',
	-- Escuela: Backend, Arquitectura y Bases de datos 
	'659d682f-60df-4396-8330-99a8d40f0e0c'
) , (
	'0a1052e4-a554-4e3d-9b4b-da5c0cbb32b2',
	'https://static.platzi.com/media/achievements/badge-terminal-5c5518b5-43d0-4387-b39e-3d85db446c5f.png',
	'Curso de Introducción a la Terminal y Línea de comandos - Enrique Devars',
	-- Escuela: Fundamentos de programación
	'3572e100-0102-486f-a582-b7721ea4e9a2'
) , (
	'25c530f9-9388-47ac-859d-522712eb9ef3',
	'https://static.platzi.com/media/achievements/badge-metricas-redes-sociales-f37f5492-8eac-4431-9365-2e655aa51bc9.png',
	'Curso de Métricas para Redes Sociales - Paula Velandia',
	-- Escuela: Community Manager y Redes Sociales
	'59db8b20-bd2c-4564-a612-cefaf09296bf'
) , (
	'a7b2b27c-fa87-4dfd-8eb0-b66efee7b9fd',
	'https://static.platzi.com/media/achievements/badge-analisis-negocios-ciencia-datos-3b97d868-a43a-47ac-a2dc-0c0e6cb63f48.png',
	'Curso de Analisis de negocio para Ciencia de Datos - Silvía Ariza Sentís',
	-- Escuela: Data Marketer
	'c881bd77-0e1c-4d0c-8731-10637ccd1769'
) , (
	'11fe57b3-9d30-4245-b027-a72d1ac540e0',
	'https://static.platzi.com/media/achievements/1130-5d671f11-65d0-42dc-8f5c-b8536389cd7d.png',
	'Curso de Ilistrator - Carlos Jímenez',
	-- Escuela: Branding Designer
	'fdfd4113-ed8c-4195-a3e9-0ca9931186f5'
) , (
	'18ff8709-9584-44d4-a82e-0219159772f2',
	'https://static.platzi.com/media/achievements/badge-diseno-interfaces-cf6c1320-4ab9-4a67-881d-6b9f712488ae.png',
	'Curso de Diseño de Interfaces - Rulótico Gonzales',
	-- Escuela: UI/UX Designer
	'118a8242-cdae-4b97-9077-11dafdaef70e'
) , (
	'933a4b37-0268-4c19-94a9-67847718ff87',
	'https://static.platzi.com/media/achievements/badge-manejar-deuda-82149ae8-507d-468a-8281-9af80f38e4e4.png',
	'Curso para Manejar tu Deuda - Juan Camilo Gonzáles',
	-- Escuela: Finanzas Personales
	'67bfcfc4-b476-47c6-93a1-5b000c53f78f'
) , (
	'a89eb030-df73-43b0-8641-5e5319952e45',
	'https://static.platzi.com/media/achievements/badge-excel-basico-f52d522e-57d8-4f4d-8cce-02863f491fde.png',
	'Curso de Excel Básico - Ana Parente Dodero',
	-- Escuela: Bussiness Intelligence y Data Management 
	'9fab099b-8e3d-4473-a3a3-1acf9c402e46'
) , (
	'cb5ff247-bd11-46c9-9810-da2740643564',
	'https://static.platzi.com/media/achievements/badge-storytelling-fd2c9f48-d491-480b-97f8-1796eab64dbd.png',
	'Curso de StoryTelling - César Fajardo',
	-- Escuela: Estrategia de contenidos
	'c9935e9c-03b5-41e1-b1aa-563d815f6dd7'
) , (
	'4c83fcee-a084-4ac9-8414-d7e8853c206e',
	'https://static.platzi.com/media/achievements/piezas-crear-mvp-sin-codigo_badge-3bb16607-14a3-4365-98ba-acc7215499b1.png',
	'Curso para Crear un MVP sin código - Jeff Orr',
	-- Escuela: No-Code Maker
	'b4c36545-1cbc-4674-bf63-a124752d00f9'
) , (
	'7af9e376-9b19-4dc2-8210-666ab9355c04',
	'https://static.platzi.com/media/achievements/piezas-basic-english-course-beginners_badge-d884a9b2-fa4c-4821-b268-d4d5d0f10ab5.png',
	'Curso de Inglés Básico A1 para Princpiantes - Kyra Sage',
	-- Escuela: Platzi English Academy
	'a6661ddb-3c19-4a2c-acc5-302b91d1c2d8'
); 

-- Table Lessons 
insert into lessons (
	id,
	"order" ,
	title_lesson ,
	url_video ,
	course_id 
) values (
	'6d867468-9b65-4a6c-9176-0aa12f170796' ,
	1 ,
	'Todo lo que aprenderás sobre el desarrollo backend' ,
	'' ,
	-- Course: Curso de Introducción al Desarrollo Backend
	'fb647caf-0225-40cb-b49f-0e1bebf12d30'
) , (
	'c0f4e4fe-09a0-4339-bcb1-fc4d19db07bf' ,
	1 ,
	'¿Que es la terminal?' ,
	'' ,
	-- Course: Curso de Introducción a la Terminal y Línea de comandos
	'0a1052e4-a554-4e3d-9b4b-da5c0cbb32b2'
) , (
	'93b1525e-d512-4905-add5-c7ea1b7cbf0a' ,
	1 ,
	'Conoce a Paula' ,
	'' ,
	-- Course: Curso de Métricas para Redes Sociales
	'25c530f9-9388-47ac-859d-522712eb9ef3'
) , (
	'257c6e74-fffa-41df-adb0-f29bbaee324e' ,
	1 ,
	'Aprende ciencia y análisis de datos para optimizar las estrategias de tu negocio' ,
	'' ,
	-- Course: Curso de Analisis de negocio para Ciencia de Datos
	'a7b2b27c-fa87-4dfd-8eb0-b66efee7b9fd'
) , (
	'1a8860f4-a777-4e89-b0e1-e6fc9d03d74a' ,
	1 ,
	'Introducción al curso de Ilustrator' ,
	'' ,
	-- Course: Curso de Ilistrator
	'11fe57b3-9d30-4245-b027-a72d1ac540e0'
) , (
	'457970e0-1306-4ef8-b0d8-9e4d68865b06' ,
	1 ,
	'Bienvenida al curso de Interfaces' ,
	'' ,
	-- Course: Curso de Diseño de Interfaces
	'18ff8709-9584-44d4-a82e-0219159772f2'
) , (
	'59cb6368-48d8-4c26-a844-77aca67733cd' ,
	1 ,
	'Cómo aprenderás a manejar tu deuda' ,
	'' ,
	-- Course: Curso para Manejar tu Deuda 
	'933a4b37-0268-4c19-94a9-67847718ff87'
) , (
	'fde0a8f2-79a9-4c6a-8d49-b7ea6fb6db4a' ,
	1 ,
	'Bienvenida' ,
	'' ,
	-- Course: Curso de Excel Básico
	'a89eb030-df73-43b0-8641-5e5319952e45'
) , (
	'a63d1158-45ff-4f57-b5c3-7bb05ea3b3b6' ,
	1 ,
	'Introducción al Storytelling' ,
	'' ,
	-- Course: Curso de StoryTelling 
	'cb5ff247-bd11-46c9-9810-da2740643564'
) , (
	'3b7c1996-92f4-42e1-bcc5-c579ce9ccfb9' ,
	1 ,
	'Crea un e-commerce sin código' ,
	'' ,
	-- Course: Curso para Crear un MVP sin código 
	'4c83fcee-a084-4ac9-8414-d7e8853c206e'
) , (
	'c060c687-bd39-4ad4-a32f-220d21cb959a' ,
	1 ,
	'Introduction' ,
	'' ,
	-- Course: Curso de Inglés Básico A1 para Princpiantes
	'7af9e376-9b19-4dc2-8210-666ab9355c04' 
);

-- Table profile_courses
insert into profile_courses (
	id , 
	completed ,
	course_id 
) values (
	'83696e99-145a-4303-8fd0-b7a54724bff6', 
	true , 
	-- Curso de Introducción al Desarrollo Backend
	'fb647caf-0225-40cb-b49f-0e1bebf12d30'
) , (
	'c13a4da7-9486-4afe-b07b-9de609ceb126', 
	false , 
	-- Curso de Introducción a la Terminal y Línea de comandos
	'0a1052e4-a554-4e3d-9b4b-da5c0cbb32b2'
) , (
	'b5f27ebd-f417-4158-b6c4-57eff5a21a47', 
	true , 
	-- Curso de Métricas para Redes Sociales
	'25c530f9-9388-47ac-859d-522712eb9ef3'
) , (
	'2917f33e-2ba7-47f9-acf7-75b0a9b9ff21', 
	true , 
	-- Curso de Analisis de negocio para Ciencia de Datos
	'a7b2b27c-fa87-4dfd-8eb0-b66efee7b9fd'
) , (
	'bdd2860f-188d-412c-b0ee-d60da7858a8f', 
	false, 
	-- Curso de Ilistrator
	'11fe57b3-9d30-4245-b027-a72d1ac540e0'
) , (
	'cf77951d-57e1-436e-8e45-f20badac5830', 
	true , 
	-- Curso de Inglés Básico A1 para Princpiantes 
	'7af9e376-9b19-4dc2-8210-666ab9355c04'
);



--- USUARIOS ---

-- Table Users 
insert into users (
	id , 
	first_name ,
	last_name ,
	email ,
	"password" ,
	age ,
	country ,
	gender 
) values (
	-- User Sasuke 
	'0dee1200-a149-4f8d-9b0f-500792d589d8',
	'Sasuke',
	'Uchiha',
	'sasuke_uchiha@naruto.com',
	rootsas,
	21 , 
	JAP ,
	'Masculino'
) , (
	-- User Itachi 
	'5be2527b-c349-4944-8b20-bef229f95df0',
	'Itachi',
	'Uchiha' ,
	'itachi_uchiha@akatsuki.com', 
	rootitachi , 
	24 , 
	JAP , 
	'Masculino'
); 


-- Table Profiles 
insert into profiles (
	id,
	url_photo,
	points_carrer,
	questions,
	requests,
	profile_course_id,
	info_user_id, 
	suscription_id 
) values (
	-- Profile Sasuke
	'0dee1200-a149-4f8d-9b0f-500792d589d8', 
	'https://static.wikia.nocookie.net/doblaje/images/4/4f/Sasuke_Ugarte.png/revision/latest/scale-to-width-down/278?cb=20190414044702&path-prefix=es',
	1456,
	2,
	3,
	-- Curso de Introducción al Desarrollo Backend
	'83696e99-145a-4303-8fd0-b7a54724bff6',
	-- info_user_id 
	'0dee1200-a149-4f8d-9b0f-500792d589d8',
	-- suscription_id -> Plan Expert
	'9d4bd65f-3877-4d42-a5b1-695366c30b36'
) , (
	-- Profile Itachi
	'5be2527b-c349-4944-8b20-bef229f95df0',
	'https://static.wikia.nocookie.net/doblaje/images/4/44/Itachi_Uchiha_NS.png/revision/latest/scale-to-width-down/243?cb=20130809162600&path-prefix=es',
	1999,
	100,
	200,
	-- Curso de Introducción a la Terminal y Línea de comandos
	'c13a4da7-9486-4afe-b07b-9de609ceb126',
	-- info_user_id 
	'5be2527b-c349-4944-8b20-bef229f95df0',
	-- suscription_id -> Plan Expert Family
	'96448b3d-ddcf-4ae0-b1b1-456449c19102'  
);








