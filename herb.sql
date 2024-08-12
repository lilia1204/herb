-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: tch
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '管理员',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','123456','美少女战士队','8099b1d08a7c61b22b660e77ef115c80');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herb_data`
--

DROP TABLE IF EXISTS `herb_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `herb_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herb_data`
--

LOCK TABLES `herb_data` WRITE;
/*!40000 ALTER TABLE `herb_data` DISABLE KEYS */;
INSERT INTO `herb_data` VALUES (1,'艾叶','【中药名】艾叶\r\n【别名】艾蒿、家艾、灸草\r\n【植物形态】艾叶为多年生草本，茎单生或少数，褐色或灰黄褐色，基部稍木质化，上部蒿质，并有少数短的分枝。叶厚纸质，上面被灰白色短柔毛，并有白色腺点与小凹点，背面密被灰白色蛛丝状密绒毛。头状花序椭圆形，排列成复总状，总苞卵形，密被灰白色丝状茸毛。\r\n【药材性状】艾叶多皱缩、破碎，有短柄。完整叶片展平后呈卵状椭圆形，羽状深裂，裂片椭圆状披针形，边缘有不规则的粗锯齿；上表面灰绿色或深黄绿色，有稀疏的柔毛及腺点；下表面密生灰白色绒毛。质柔软。气清香，味苦。\r\n【性味归经】辛、苦，温；有小毒。归肝经、脾经、肾经。\r\n【功效与作用】艾叶具有温经止血、散寒止痛、外用祛湿止痒的功效，用于吐血、衄血、崩漏、月经过多、胎漏下血、少腹冷痛、经寒不调、宫冷不孕等症状，外治皮肤瘙痒。','https://herb-images.oss-cn-beijing.aliyuncs.com/ai_ye.png'),(2,'苍耳子','【中药名】苍耳子\r\n【别名】苍耳、老苍子、胡苍子\r\n【植物形态】苍耳为一年生草本，茎下部圆柱形，上部有纵沟，密被糙伏毛。叶三角状卵形或心形，近全缘，或有3-5不明显浅裂，两面均被糙伏毛。雄花序球形，总苞片长圆状披针形，花托柱状，托片倒披针状钻形。雌花序卵形或圆锥形，具总苞，总苞片结合成囊状，外面有钩刺和密生细毛。\r\n【药材性状】苍耳子呈纺锤形或卵圆形，表面黄棕色或黄绿色，全体有钩刺，顶端有2枚较粗的刺，分离或相连，基部有果梗痕。质硬而韧，横切面中央有纵隔膜，2室，各有1枚瘦果。瘦果略呈纺锤形，一面较平坦，顶端具1突起的花柱基，果皮薄，灰黑色，具纵纹。种皮膜质，浅灰色，子叶2，有油性。气微，味微苦。\r\n【性味归经】辛、苦，温；有毒。归肺经。\r\n【功效与作用】苍耳子具有散风寒、通鼻窍、祛风湿、止痛的功效，用于风寒感冒、鼻渊、风湿痹痛、风疹瘙痒、疥癣麻风等症状。但需注意，本品有毒，过量服用易致中毒。','https://herb-images.oss-cn-beijing.aliyuncs.com/cang_er_zi.png'),(3,'车前草','【中药名】车前草\r\n【别名】车前子、车轮菜、猪耳朵草\r\n【植物形态】车前草为多年生草本，具短柄，基部有叶鞘。叶片纸质，椭圆形、椭圆状披针形或卵状披针形，边缘具波状钝齿、不规则锯齿或牙齿，两面疏生短柔毛，下面沿脉较密。花序梗有纵条纹，疏生白色短柔毛；穗状花序细圆柱状。蒴果卵状椭圆形至圆锥状卵形。\r\n【药材性状】车前草干燥全草呈不规则的长段状，茎基部圆柱形，有纵沟纹；叶片皱缩破碎，展平后呈宽卵形或宽椭圆形，边缘波状或有疏钝齿；穗状花序排列于茎顶，花冠已脱落，仅见宿存花萼及淡黄色或已成熟变为黑色的苞片。质稍硬，断面中心具白色髓。气微香，味微苦。\r\n【性味归经】甘，寒。归肝经、肾经、膀胱经。\r\n【功效与作用】车前草具有清热利尿通淋、祛痰、凉血、解毒的功效，用于热淋涩痛、水肿尿少、暑湿泄泻、痰热咳嗽、吐血衄血、痈肿疮毒等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/che_qian_cao.png'),(4,'陈皮','【中药名】陈皮\r\n【别名】橘皮、贵老、红皮\r\n【植物形态】陈皮为芸香科植物橘及其栽培变种的干燥成熟果皮。橘树为常绿小乔木或灌木，枝细，多有刺。叶片披针形或椭圆形，具腺点。花黄白色，单生或簇生叶腋。果实扁球形，外皮橙黄色或橙红色，剥取果皮，晒干或低温干燥。\r\n【药材性状】陈皮常剥成数瓣，基部相连，有的呈不规则的片状，厚1～4mm。外表面橙红色或红棕色，有细皱纹和凹下的点状油室；内表面浅黄白色，粗糙，附黄白色或黄棕色筋络状维管束。质稍硬而脆。气香，味辛、苦。\r\n【性味归经】辛、苦，温。归脾经、肺经。\r\n【功效与作用】陈皮具有理气健脾、燥湿化痰的功效，用于胸脘胀满、食少吐泻、咳嗽痰多等症状。其独特的香气和味道，也使得它成为烹饪中常用的调料之一。','https://herb-images.oss-cn-beijing.aliyuncs.com/chen_pi.png'),(5,'当归','【中药名】当归\r\n【别名】干归、文无、西当归\r\n【植物形态】当归为多年生草本，茎直立，有纵沟纹，复叶，小叶卵形至椭圆形。花白色，复伞形花序顶生。果实椭圆形，熟时黄棕色。\r\n【药材性状】当归根呈圆柱形，表面黄棕色至棕褐色，有纵皱纹及横长皮孔。质柔韧，断面黄白色或淡黄棕色，气香，味甘、辛、微苦。\r\n【性味归经】甘、辛，温。归肝经、心经、脾经。\r\n【功效与作用】当归具有补血活血、调经止痛、润肠通便的功效，用于血虚萎黄、眩晕心悸、月经不调、经闭痛经、虚寒腹痛等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/dang_gui.png'),(6,'冬虫夏草','【中药名】冬虫夏草\r\n【别名】无特定广泛别名\r\n【植物形态】冬虫夏草是线虫草科真菌与蝙蝠蛾幼虫形成的复合体，子座一年生，棍棒状，基部浅黄色，中部黄褐色，顶部黑褐色。\r\n【药材性状】干燥后呈细长圆柱形，头部深红色，有子座，虫体表面深黄色至黄棕色，有环纹，气微腥，味微苦。\r\n【性味归经】甘，平。归肺经、肾经。\r\n【功效与作用】冬虫夏草具有补肾益肺、止血化痰的功效，用于肾虚精亏、阳痿遗精、腰膝酸痛、久咳虚喘、劳嗽咯血等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/dong_chong_xia_cao.png'),(7,'干枸杞','【中药名】干枸杞\r\n【别名】枸杞子、杞子、甘杞子\r\n【植物形态】枸杞为灌木，枝条细长，叶互生或簇生于短枝上，卵形或卵状菱形至卵状披针形。花紫色，浆果红色，卵状。\r\n【药材性状】干枸杞呈类纺锤形或椭圆形，表面红色或暗红色，顶端有小突起状的花柱痕，基部有白色的果梗痕。质柔润，气微，味甜。\r\n【性味归经】甘，平。归肝经、肾经。\r\n【功效与作用】干枸杞具有滋补肝肾、益精明目的功效，用于虚劳精亏、腰膝酸痛、眩晕耳鸣、内热消渴、血虚萎黄、目昏不明等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/gan_gou_qi.png'),(8,'槐花','【中药名】槐花\r\n【别名】槐蕊、槐米\r\n【植物形态】槐树为落叶乔木，羽状复叶，小叶对生或近互生，卵状披针形或卵状长圆形。花淡黄色，圆锥花序顶生。\r\n【药材性状】槐花皱缩而卷曲，花瓣多散落，完整者花萼钟状，黄绿色，花瓣5，黄色或黄白色，雄蕊10，其中9个基部连合，花丝细长。体轻，气微，味微苦。\r\n【性味归经】苦，微寒。归肝经、大肠经。\r\n【功效与作用】槐花具有凉血止血、清肝泻火的功效，用于便血、痔血、血痢、崩漏、吐血、衄血、肝热目赤、头痛眩晕等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/huai_hua.png'),(9,'金钱草','【中药名】金钱草\r\n【别名】过路黄、镜面草、翠屏草\r\n【植物形态】金钱草为多年生草本，茎柔弱，平卧延伸，下部节间较短，常被褐色短腺毛，中部以上节间较长，无毛。叶草质或近坚纸质，聚伞花序腋生，通常生于茎端和上部节位，花冠黄色，辐状钟形。\r\n【药材性状】金钱草干燥全草多皱缩成团，下部茎节上有时着生纤细须根。茎扭曲，表面棕色或暗棕红色，具纵纹，无毛或被疏柔毛；叶对生，展平后呈宽卵形或心形，长1～3.5cm，宽1～3cm，先端钝或具短尖，基部心形，全缘；上表面灰绿色或棕褐色，下表面色较浅，主脉明显突起，用水浸后，对光透视可见黑色或褐色条纹；叶柄长1～4cm，具纵纹。有的带花，花黄色，单生叶腋，具长梗。蒴果球形。气微，味淡。\r\n【性味归经】甘、咸，微寒。归肝经、胆经、肾经、膀胱经。\r\n【功效与作用】金钱草具有利湿退黄、利尿通淋、解毒消肿的功效，用于湿热黄疸、胆胀胁痛、石淋、热淋、小便涩痛、痈肿疔疮、蛇虫咬伤等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/jin_qian_cao.png'),(10,'金银花','【中药名】金银花\r\n【别名】忍冬花、双花、二花\r\n【植物形态】金银花为多年生半常绿缠绕木质藤本，幼枝密被黄褐色、开展的硬直糙毛、腺毛和短柔毛，下部常无毛。叶纸质，卵形至矩圆状卵形，有时卵状披针形，顶端渐尖或尖而钝，基部圆或近心形，两面和边缘密被短柔毛。总花梗通常单生于小枝上部叶腋，与叶柄等长或稍较短，苞片大，叶状，卵形至椭圆形，两面均有短柔毛或有时近无毛。\r\n【药材性状】金银花呈棒状，上粗下细，略弯曲，长2～3cm，上部直径约3mm，下部直径约1.5mm。表面黄白色或绿白色（贮久色渐深），密被短柔毛。偶见叶状苞片。花萼绿色，先端5裂，裂片有毛，长约2mm。开放者花冠筒状，先端二唇形，雄蕊5，附于筒壁，黄色，雌蕊1，子房无毛。气清香，味淡、微苦。\r\n【性味归经】甘，寒。归肺经、心经、胃经。\r\n【功效与作用】金银花具有清热解毒、疏散风热的功效，用于痈肿疔疮、喉痹、丹毒、热血毒痢、风热感冒、温病发热等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/jin_yin_hua.png'),(11,'九层塔','【中药名】九层塔\r\n【别名】罗勒、千层塔、鱼香菜、金不换、零陵香\r\n【植物形态】九层塔为一年生芳香草本植物，茎四方形，表面紫绿色，被柔毛。叶对生，卵形或卵状披针形，边缘有疏锯齿或全缘。花小，白色或淡红色，轮伞花序顶生，果实长圆形，暗褐色。\r\n【药材性状】全长4080厘米，茎方柱形，紫色或黄紫色，有倒生柔毛。花数朵簇生于茎枝上部节上，宿萼黄棕色，间断排列成59层，气芳香，有清凉感。\r\n【性味归经】性温，味辛。归肺经、脾经、胃经、大肠经。\r\n【功效与作用】九层塔具有疏风解表、祛风消肿、散瘀止痛、活血通经的功效。常用于治疗感冒、头痛、食胀气滞、胃脘痛、跌打损伤、湿疹瘙痒等症状。同时，九层塔还具有抗菌、消炎、抗蛇毒等作用。','https://herb-images.oss-cn-beijing.aliyuncs.com/jiu_ceng_ta.png'),(12,'芦荟','【中药名】芦荟\r\n【别名】卢会、讷会、象胆\r\n【植物形态】芦荟为多年生常绿草本植物，茎较短。叶簇生于茎顶，呈座状或生于茎部，肥厚多汁，条状披针形，边缘有刺状小齿。花葶高60-90cm，花下垂，稀疏排列，淡黄色或有红斑。\r\n【药材性状】芦荟呈不规则块状，常破裂为多角形，大小不一。表面呈暗红褐色或深褐色，无光泽。体轻，质硬，不易破碎，断面粗糙或显麻纹。气微，味苦。\r\n【性味归经】苦，寒。归肝经、胃经、大肠经。\r\n【功效与作用】芦荟具有泻下通便、清肝泻火、杀虫疗疳的功效，用于热结便秘、烦躁惊痫、小儿疳积、癣疮等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/lu_hui.png'),(13,'罗汉果','【中药名】罗汉果\r\n【别名】拉汗果、假苦瓜、光果木鳖\r\n【植物形态】罗汉果为多年生攀援藤本，茎稍粗壮，有棱沟，被短柔毛。叶互生，卵形或长卵形，先端渐尖或急尖。花雌雄异株，雄花序总状，雌花单生于叶腋。果实球形或长圆形，初密生黄褐色茸毛和混生黑色腺鳞，熟时果皮呈棕褐色，有光泽，果肉淡红色。\r\n【药材性状】罗汉果干燥果实呈卵形、椭圆形或球形，表面褐色、黄褐色或棕绿色，有深色斑块及黄色柔毛，有的具3～11条纵纹。顶端有花柱残痕，基部有果梗痕。体轻，质脆，果皮薄，易破。气微，味甜。\r\n【性味归经】甘，凉。归肺经、大肠经。\r\n【功效与作用】罗汉果具有清热润肺、利咽开音、滑肠通便的功效，用于肺热燥咳、咽痛失音、肠燥便秘等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/luo_han_guo.png'),(14,'柿蒂','【中药名】柿蒂\r\n【别名】柿钱、柿丁、柿子把\r\n【植物形态】柿树为落叶大乔木，叶椭圆形至长椭圆形，上面深绿色，下面淡绿色，有柔毛。花黄白色，果形种种，扁圆形、近圆形至长圆形，橙黄色或黄色。柿蒂宿存，褐色，扁圆形。\r\n【药材性状】柿蒂呈扁圆形，中央较厚，微隆起，有黄棕色或红棕色茸毛，向外逐渐变薄，边缘有裂齿，质硬而脆，气微，味涩。\r\n【性味归经】苦、涩，平。归胃经。\r\n【功效与作用】柿蒂具有降逆止呃的功效，主要用于治疗呃逆症。','https://herb-images.oss-cn-beijing.aliyuncs.com/shi_di.png'),(15,'无花果','【中药名】无花果\r\n【别名】映日果、奶浆果、蜜果\r\n【植物形态】无花果为落叶灌木或小乔木，叶厚纸质，宽卵圆形，榕果单生叶腋，梨形，成熟时紫红色或黄色，果肉软烂。\r\n【药材性状】干无花果多为椭圆形，表面黄棕色至棕黑色，皱缩，有短毛。果肉柔软，气微，味甜。\r\n【性味归经】甘，平。归肺经、胃经、大肠经。\r\n【功效与作用】无花果具有清热生津、健脾开胃、解毒消肿的功效，用于咽喉肿痛、燥咳声嘶、乳汁稀少、肠热便秘等症状。','https://herb-images.oss-cn-beijing.aliyuncs.com/wu_hua_guo.png');
/*!40000 ALTER TABLE `herb_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `herb_id` int NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_herb_id` (`herb_id`) USING BTREE,
  CONSTRAINT `fk_herb_id` FOREIGN KEY (`herb_id`) REFERENCES `herb_data` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,'gege',2,'2024-07-13 16:27:26'),(3,'o5Bp06yZ7YII1mIJXxkrBkGym1E0',14,'2024-07-16 00:18:50'),(4,'o5Bp06yZ7YII1mIJXxkrBkGym1E0',14,'2024-07-16 00:19:28'),(5,'o5Bp06yZ7YII1mIJXxkrBkGym1E0',3,'2024-07-16 09:55:47'),(6,'o5Bp06yZ7YII1mIJXxkrBkGym1E0',13,'2024-07-16 10:01:40'),(7,'o5Bp06yZ7YII1mIJXxkrBkGym1E0',4,'2024-07-16 10:28:41'),(8,'o5Bp06yZ7YII1mIJXxkrBkGym1E0',4,'2024-07-19 19:26:39'),(9,'o5Bp06yZ7YII1mIJXxkrBkGym1E0',7,'2024-07-19 19:29:32'),(10,'o5Bp06yZ7YII1mIJXxkrBkGym1E0',7,'2024-07-19 19:58:54'),(11,'o5Bp06yZ7YII1mIJXxkrBkGym1E0',7,'2024-07-19 20:00:35');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('o5Bp06yZ7YII1mIJXxkrBkGym1E0','李永鑫wq','/static/o5Bp06yZ7YII1mIJXxkrBkGym1E0.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tch'
--

--
-- Dumping routines for database 'tch'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-20 23:06:22
