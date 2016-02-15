-- Describe ACCOUNTLIST_V1
CREATE TABLE ACCOUNTLIST_V1(
ACCOUNTID integer primary key
, ACCOUNTNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, ACCOUNTTYPE TEXT NOT NULL /* Checking, Term, Investment, Credit Card */
, ACCOUNTNUM TEXT
, STATUS TEXT NOT NULL /* Open, Closed */
, NOTES TEXT
, HELDAT TEXT
, WEBSITE TEXT
, CONTACTINFO TEXT
, ACCESSINFO TEXT
, INITIALBAL numeric
, FAVORITEACCT TEXT NOT NULL
, CURRENCYID integer NOT NULL
);
CREATE INDEX IDX_ACCOUNTLIST_ACCOUNTTYPE ON ACCOUNTLIST_V1(ACCOUNTTYPE);

-- Describe ASSETS_V1
CREATE TABLE ASSETS_V1(
ASSETID integer primary key
, STARTDATE TEXT NOT NULL
, ASSETNAME TEXT COLLATE NOCASE NOT NULL
, VALUE numeric
, VALUECHANGE TEXT /* None, Appreciates, Depreciates */
, NOTES TEXT
, VALUECHANGERATE numeric
, ASSETTYPE TEXT /* Property, Automobile, Household Object, Art, Jewellery, Cash, Other */
);
CREATE INDEX IDX_ASSETS_ASSETTYPE ON ASSETS_V1(ASSETTYPE);


-- Describe BILLSDEPOSITS_V1
CREATE TABLE BILLSDEPOSITS_V1(
BDID integer primary key
, ACCOUNTID integer NOT NULL
, TOACCOUNTID integer
, PAYEEID integer NOT NULL
, TRANSCODE TEXT NOT NULL /* Withdrawal, Deposit, Transfer */
, TRANSAMOUNT numeric NOT NULL
, STATUS TEXT /* None, Reconciled, Void, Follow up, Duplicate */
, TRANSACTIONNUMBER TEXT
, NOTES TEXT
, CATEGID integer
, SUBCATEGID integer
, TRANSDATE TEXT
, FOLLOWUPID integer
, TOTRANSAMOUNT numeric
, REPEATS integer
, NEXTOCCURRENCEDATE TEXT
, NUMOCCURRENCES integer
);
CREATE INDEX IDX_BILLSDEPOSITS_ACCOUNT ON BILLSDEPOSITS_V1 (ACCOUNTID, TOACCOUNTID);

-- Describe BUDGETSPLITTRANSACTIONS_V1
CREATE TABLE BUDGETSPLITTRANSACTIONS_V1(
SPLITTRANSID integer primary key
, TRANSID integer NOT NULL
, CATEGID integer
, SUBCATEGID integer
, SPLITTRANSAMOUNT numeric
);
CREATE INDEX IDX_BUDGETSPLITTRANSACTIONS_TRANSID ON BUDGETSPLITTRANSACTIONS_V1(TRANSID);

-- Describe BUDGETTABLE_V1
CREATE TABLE BUDGETTABLE_V1(
BUDGETENTRYID integer primary key
, BUDGETYEARID integer
, CATEGID integer
, SUBCATEGID integer
, PERIOD TEXT NOT NULL /* None, Weekly, Bi-Weekly, Monthly, Monthly, Bi-Monthly, Quarterly, Half-Yearly, Yearly, Daily*/
, AMOUNT numeric NOT NULL
);
CREATE INDEX IDX_BUDGETTABLE_BUDGETYEARID ON BUDGETTABLE_V1(BUDGETYEARID);

-- Describe BUDGETYEAR_V1
CREATE TABLE BUDGETYEAR_V1(
BUDGETYEARID integer primary key
, BUDGETYEARNAME TEXT NOT NULL UNIQUE
);
CREATE INDEX IDX_BUDGETYEAR_BUDGETYEARNAME ON BUDGETYEAR_V1(BUDGETYEARNAME);

-- Describe CATEGORY_V1
CREATE TABLE CATEGORY_V1(
CATEGID integer primary key
, CATEGNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
);
CREATE INDEX IDX_CATEGORY_CATEGNAME ON CATEGORY_V1(CATEGNAME);

INSERT INTO CATEGORY_V1 VALUES(1,'Bills');
INSERT INTO CATEGORY_V1 VALUES(2,'Food');
INSERT INTO CATEGORY_V1 VALUES(3,'Leisure');
INSERT INTO CATEGORY_V1 VALUES(4,'Automobile');
INSERT INTO CATEGORY_V1 VALUES(5,'Education');
INSERT INTO CATEGORY_V1 VALUES(6,'Homeneeds');
INSERT INTO CATEGORY_V1 VALUES(7,'Healthcare');
INSERT INTO CATEGORY_V1 VALUES(8,'Insurance');
INSERT INTO CATEGORY_V1 VALUES(9,'Vacation');
INSERT INTO CATEGORY_V1 VALUES(10,'Taxes');
INSERT INTO CATEGORY_V1 VALUES(11,'Miscellaneous');
INSERT INTO CATEGORY_V1 VALUES(12,'Gifts');
INSERT INTO CATEGORY_V1 VALUES(13,'Income');
INSERT INTO CATEGORY_V1 VALUES(14,'Other Income');
INSERT INTO CATEGORY_V1 VALUES(15,'Other Expenses');
INSERT INTO CATEGORY_V1 VALUES(16,'Transfer');

-- Describe CHECKINGACCOUNT_V1
CREATE TABLE CHECKINGACCOUNT_V1(
TRANSID integer primary key
, ACCOUNTID integer NOT NULL
, TOACCOUNTID integer
, PAYEEID integer NOT NULL
, TRANSCODE TEXT NOT NULL /* Withdrawal, Deposit, Transfer */
, TRANSAMOUNT numeric NOT NULL
, STATUS TEXT /* None, Reconciled, Void, Follow up, Duplicate */
, TRANSACTIONNUMBER TEXT
, NOTES TEXT
, CATEGID integer
, SUBCATEGID integer
, TRANSDATE TEXT
, FOLLOWUPID integer
, TOTRANSAMOUNT numeric
);
CREATE INDEX IDX_CHECKINGACCOUNT_ACCOUNT ON CHECKINGACCOUNT_V1 (ACCOUNTID, TOACCOUNTID);
CREATE INDEX IDX_CHECKINGACCOUNT_TRANSDATE ON CHECKINGACCOUNT_V1 (TRANSDATE);

-- Describe CURRENCYHISTORY_V1
CREATE TABLE CURRENCYHISTORY_V1(
CURRHISTID INTEGER PRIMARY KEY
, CURRENCYID INTEGER NOT NULL
, CURRDATE TEXT NOT NULL
, CURRVALUE NUMERIC NOT NULL
, CURRUPDTYPE INTEGER
, UNIQUE(CURRENCYID, CURRDATE)
);
CREATE INDEX IDX_CURRENCYHISTORY_CURRENCYID_CURRDATE ON CURRENCYHISTORY_V1(CURRENCYID, CURRDATE);

-- Describe CURRENCYFORMATS_V1
CREATE TABLE CURRENCYFORMATS_V1(
CURRENCYID integer primary key
, CURRENCYNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, PFX_SYMBOL TEXT
, SFX_SYMBOL TEXT
, DECIMAL_POINT TEXT
, GROUP_SEPARATOR TEXT
, UNIT_NAME TEXT COLLATE NOCASE
, CENT_NAME TEXT COLLATE NOCASE
, SCALE integer
, BASECONVRATE numeric
, CURRENCY_SYMBOL TEXT COLLATE NOCASE NOT NULL UNIQUE
);
CREATE INDEX IDX_CURRENCYFORMATS_SYMBOL ON CURRENCYFORMATS_V1(CURRENCY_SYMBOL);

INSERT INTO CURRENCYFORMATS_V1 VALUES(1,'United States dollar','$','','.',' ','','',100,1,'USD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(2,'European euro','€','','.',' ','','',100,1,'EUR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(3,'UK Pound','£','','.',' ','Pound','Pence',100,1,'GBP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(4,'Russian Ruble','','р',',',' ','руб.','коп.',100,1,'RUB');
INSERT INTO CURRENCYFORMATS_V1 VALUES(5,'Ukrainian hryvnia','₴','',',',' ','','',100,1,'UAH');
INSERT INTO CURRENCYFORMATS_V1 VALUES(6,'Afghan afghani','؋','','.',' ','','pul',100,1,'AFN');
INSERT INTO CURRENCYFORMATS_V1 VALUES(7,'Albanian lek','','L','.',' ','','',1,1,'ALL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(8,'Algerian dinar','دج','','.',' ','','',100,1,'DZD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(9,'Angolan kwanza','','Kz','.',' ','','Céntimo',100,1,'AOA');
INSERT INTO CURRENCYFORMATS_V1 VALUES(10,'East Caribbean dollar','EC$','','.',' ','','',100,1,'XCD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(11,'Argentine peso','AR$','',',','.','','centavo',100,1,'ARS');
INSERT INTO CURRENCYFORMATS_V1 VALUES(12,'Armenian dram','','','.',' ','','',1,1,'AMD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(13,'Aruban florin','ƒ','','.',' ','','',100,1,'AWG');
INSERT INTO CURRENCYFORMATS_V1 VALUES(14,'Australian dollar','$','','.',',','','',100,1,'AUD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(15,'Azerbaijani manat','','','.',' ','','',100,1,'AZN');
INSERT INTO CURRENCYFORMATS_V1 VALUES(16,'Bahamian dollar','B$','','.',' ','','',100,1,'BSD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(17,'Bahraini dinar','','','.',' ','','',100,1,'BHD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(18,'Bangladeshi taka','','','.',' ','','',100,1,'BDT');
INSERT INTO CURRENCYFORMATS_V1 VALUES(19,'Barbadian dollar','Bds$','','.',' ','','',100,1,'BBD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(20,'Belarusian ruble','Br','',',',' ','','',1,1,'BYR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(21,'Belize dollar','BZ$','','.',' ','','',100,1,'BZD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(22,'West African CFA franc','CFA','','.',' ','','',100,1,'XOF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(23,'Bermudian dollar','BD$','','.',' ','','',100,1,'BMD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(24,'Bhutanese ngultrum','Nu.','','.',' ','','',100,1,'BTN');
INSERT INTO CURRENCYFORMATS_V1 VALUES(25,'Bolivian boliviano','Bs.','','.',' ','','',100,1,'BOB');
INSERT INTO CURRENCYFORMATS_V1 VALUES(26,'Bosnia and Herzegovina konvertibilna marka','KM','',',','.','','',100,1,'BAM');
INSERT INTO CURRENCYFORMATS_V1 VALUES(27,'Botswana pula','P','','.',' ','','',100,1,'BWP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(28,'Brazilian real','R$','','.',' ','','',100,1,'BRL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(29,'Brunei dollar','B$','','.',' ','','',100,1,'BND');
INSERT INTO CURRENCYFORMATS_V1 VALUES(30,'Bulgarian lev','','','.',' ','','',100,1,'BGN');
INSERT INTO CURRENCYFORMATS_V1 VALUES(31,'Burundi franc','FBu','','.',' ','','',1,1,'BIF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(32,'Cambodian riel','','','.',' ','','',100,1,'KHR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(33,'Central African CFA franc','CFA','','.',' ','','',1,1,'XAF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(34,'Canadian dollar','$','','.',' ','','',100,1,'CAD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(35,'Cape Verdean escudo','Esc','','.',' ','','',100,1,'CVE');
INSERT INTO CURRENCYFORMATS_V1 VALUES(36,'Cayman Islands dollar','KY$','','.',' ','','',100,1,'KYD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(37,'Chilean peso','$','','.',' ','','',1,1,'CLP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(38,'Chinese renminbi','¥','','.',' ','','',100,1,'CNY');
INSERT INTO CURRENCYFORMATS_V1 VALUES(39,'Colombian peso','Col$','','.',' ','','',100,1,'COP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(40,'Comorian franc','','','.',' ','','',1,1,'KMF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(41,'Congolese franc','F','','.',' ','','',100,1,'CDF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(42,'Costa Rican colon','₡','','.',' ','','',1,1,'CRC');
INSERT INTO CURRENCYFORMATS_V1 VALUES(43,'Croatian kuna','kn','','.',' ','','',100,1,'HRK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(44,'Czech koruna','Kč','','.',' ','','',100,1,'CZK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(45,'Danish krone','Kr','','.',' ','','',100,1,'DKK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(46,'Djiboutian franc','Fdj','','.',' ','','',1,1,'DJF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(47,'Dominican peso','RD$','','.',' ','','',100,1,'DOP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(48,'Egyptian pound','£','','.',' ','','',100,1,'EGP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(49,'Eritrean nakfa','Nfa','','.',' ','','',100,1,'ERN');
INSERT INTO CURRENCYFORMATS_V1 VALUES(50,'Ethiopian birr','Br','','.',' ','','',100,1,'ETB');
INSERT INTO CURRENCYFORMATS_V1 VALUES(51,'Falkland Islands pound','£','','.',' ','','',100,1,'FKP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(52,'Fijian dollar','FJ$','','.',' ','','',100,1,'FJD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(53,'CFP franc','F','','.',' ','','',100,1,'XPF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(54,'Gambian dalasi','D','','.',' ','','',100,1,'GMD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(55,'Georgian lari','','','.',' ','','',100,1,'GEL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(56,'Ghanaian cedi','','','.',' ','','',100,1,'GHS');
INSERT INTO CURRENCYFORMATS_V1 VALUES(57,'Gibraltar pound','£','','.',' ','','',100,1,'GIP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(58,'Guatemalan quetzal','Q','','.',' ','','',100,1,'GTQ');
INSERT INTO CURRENCYFORMATS_V1 VALUES(59,'Guinean franc','FG','','.',' ','','',1,1,'GNF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(60,'Guyanese dollar','GY$','','.',' ','','',100,1,'GYD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(61,'Haitian gourde','G','','.',' ','','',100,1,'HTG');
INSERT INTO CURRENCYFORMATS_V1 VALUES(62,'Honduran lempira','L','','.',' ','','',100,1,'HNL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(63,'Hong Kong dollar','HK$','','.',' ','','',100,1,'HKD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(64,'Hungarian forint','Ft','','.',' ','','',1,1,'HUF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(65,'Icelandic króna','kr','','.',' ','','',1,1,'ISK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(66,'Indian rupee','₹','','.',' ','','',100,1,'INR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(67,'Indonesian rupiah','Rp','','.',' ','','',1,1,'IDR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(68,'Special Drawing Rights','SDR','','.',' ','','',100,1,'XDR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(69,'Iranian rial','','','.',' ','','',1,1,'IRR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(70,'Iraqi dinar','','','.',' ','','',1,1,'IQD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(71,'Israeli new sheqel','','','.',' ','','',100,1,'ILS');
INSERT INTO CURRENCYFORMATS_V1 VALUES(72,'Jamaican dollar','J$','','.',' ','','',100,1,'JMD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(73,'Japanese yen','¥','','.',' ','','',1,1,'JPY');
INSERT INTO CURRENCYFORMATS_V1 VALUES(74,'Jordanian dinar','','','.',' ','','',100,1,'JOD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(75,'Kazakhstani tenge','T','','.',' ','','',100,1,'KZT');
INSERT INTO CURRENCYFORMATS_V1 VALUES(76,'Kenyan shilling','KSh','','.',' ','','',100,1,'KES');
INSERT INTO CURRENCYFORMATS_V1 VALUES(77,'North Korean won','W','','.',' ','','',100,1,'KPW');
INSERT INTO CURRENCYFORMATS_V1 VALUES(78,'South Korean won','W','','.',' ','','',1,1,'KRW');
INSERT INTO CURRENCYFORMATS_V1 VALUES(79,'Kuwaiti dinar','','','.',' ','','',100,1,'KWD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(80,'Kyrgyzstani som','','','.',' ','','',100,1,'KGS');
INSERT INTO CURRENCYFORMATS_V1 VALUES(81,'Lao kip','KN','','.',' ','','',100,1,'LAK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(82,'Latvian lats','Ls','','.',' ','','',100,1,'LVL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(83,'Lebanese lira','','','.',' ','','',1,1,'LBP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(84,'Lesotho loti','M','','.',' ','','',100,1,'LSL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(85,'Liberian dollar','L$','','.',' ','','',100,1,'LRD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(86,'Libyan dinar','LD','','.',' ','','',100,1,'LYD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(87,'Lithuanian litas','Lt','','.',' ','','',100,1,'LTL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(88,'Macanese pataca','P','','.',' ','','',100,1,'MOP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(89,'Macedonian denar','','','.',' ','','',100,1,'MKD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(90,'Malagasy ariary','FMG','','.',' ','','',100,1,'MGA');
INSERT INTO CURRENCYFORMATS_V1 VALUES(91,'Malawian kwacha','MK','','.',' ','','',1,1,'MWK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(92,'Malaysian ringgit','RM','','.',' ','','',100,1,'MYR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(93,'Maldivian rufiyaa','Rf','','.',' ','','',100,1,'MVR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(94,'Mauritanian ouguiya','UM','','.',' ','','',100,1,'MRO');
INSERT INTO CURRENCYFORMATS_V1 VALUES(95,'Mauritian rupee','Rs','','.',' ','','',1,1,'MUR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(96,'Mexican peso','$','','.',' ','','',100,1,'MXN');
INSERT INTO CURRENCYFORMATS_V1 VALUES(97,'Moldovan leu','','','.',' ','','',100,1,'MDL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(98,'Mongolian tugrik','₮','','.',' ','','',100,1,'MNT');
INSERT INTO CURRENCYFORMATS_V1 VALUES(99,'Moroccan dirham','','','.',' ','','',100,1,'MAD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(100,'Myanma kyat','K','','.',' ','','',1,1,'MMK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(101,'Namibian dollar','N$','','.',' ','','',100,1,'NAD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(102,'Nepalese rupee','NRs','','.',' ','','',100,1,'NPR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(103,'Netherlands Antillean gulden','NAƒ','','.',' ','','',100,1,'ANG');
INSERT INTO CURRENCYFORMATS_V1 VALUES(104,'New Zealand dollar','NZ$','','.',' ','','',100,1,'NZD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(105,'Nicaraguan córdoba','C$','','.',' ','','',100,1,'NIO');
INSERT INTO CURRENCYFORMATS_V1 VALUES(106,'Nigerian naira','₦','','.',' ','','',100,1,'NGN');
INSERT INTO CURRENCYFORMATS_V1 VALUES(107,'Norwegian krone','kr','','.',' ','','',100,1,'NOK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(108,'Omani rial','','','.',' ','','',100,1,'OMR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(109,'Pakistani rupee','Rs.','','.',' ','','',1,1,'PKR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(110,'Panamanian balboa','B./','','.',' ','','',100,1,'PAB');
INSERT INTO CURRENCYFORMATS_V1 VALUES(111,'Papua New Guinean kina','K','','.',' ','','',100,1,'PGK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(112,'Paraguayan guarani','','','.',' ','','',1,1,'PYG');
INSERT INTO CURRENCYFORMATS_V1 VALUES(113,'Peruvian nuevo sol','S/.','','.',' ','','',100,1,'PEN');
INSERT INTO CURRENCYFORMATS_V1 VALUES(114,'Philippine peso','₱','','.',' ','','',100,1,'PHP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(115,'Polish zloty','','','.',' ','','',100,1,'PLN');
INSERT INTO CURRENCYFORMATS_V1 VALUES(116,'Qatari riyal','QR','','.',' ','','',100,1,'QAR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(117,'Romanian leu','L','','.',' ','','',100,1,'RON');
INSERT INTO CURRENCYFORMATS_V1 VALUES(118,'Rwandan franc','RF','','.',' ','','',1,1,'RWF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(119,'São Tomé and Príncipe dobra','Db','','.',' ','','',100,1,'STD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(120,'Saudi riyal','SR','','.',' ','','',100,1,'SAR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(121,'Serbian dinar','din.','','.',' ','','',1,1,'RSD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(122,'Seychellois rupee','SR','','.',' ','','',100,1,'SCR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(123,'Sierra Leonean leone','Le','','.',' ','','',100,1,'SLL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(124,'Singapore dollar','S$','','.',' ','','',100,1,'SGD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(125,'Solomon Islands dollar','SI$','','.',' ','','',100,1,'SBD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(126,'Somali shilling','Sh.','','.',' ','','',1,1,'SOS');
INSERT INTO CURRENCYFORMATS_V1 VALUES(127,'South African rand','R','','.',' ','','',100,1,'ZAR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(128,'Sri Lankan rupee','Rs','','.',' ','','',100,1,'LKR');
INSERT INTO CURRENCYFORMATS_V1 VALUES(129,'Saint Helena pound','£','','.',' ','','',100,1,'SHP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(130,'Sudanese pound','','','.',' ','','',100,1,'SDG');
INSERT INTO CURRENCYFORMATS_V1 VALUES(131,'Surinamese dollar','$','','.',' ','','',100,1,'SRD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(132,'Swazi lilangeni','E','','.',' ','','',100,1,'SZL');
INSERT INTO CURRENCYFORMATS_V1 VALUES(133,'Swedish krona','kr','','.',' ','','',100,1,'SEK');
INSERT INTO CURRENCYFORMATS_V1 VALUES(134,'Swiss franc','Fr.','','.',' ','','',100,1,'CHF');
INSERT INTO CURRENCYFORMATS_V1 VALUES(135,'Syrian pound','','','.',' ','','',1,1,'SYP');
INSERT INTO CURRENCYFORMATS_V1 VALUES(136,'New Taiwan dollar','NT$','','.',' ','','',100,1,'TWD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(137,'Tajikistani somoni','','','.',' ','','',100,1,'TJS');
INSERT INTO CURRENCYFORMATS_V1 VALUES(138,'Tanzanian shilling','','','.',' ','','',1,1,'TZS');
INSERT INTO CURRENCYFORMATS_V1 VALUES(139,'Thai baht','฿','','.',' ','','',100,1,'THB');
INSERT INTO CURRENCYFORMATS_V1 VALUES(140,'Trinidad and Tobago dollar','TT$','','.',' ','','',100,1,'TTD');
INSERT INTO CURRENCYFORMATS_V1 VALUES(141,'Tunisian dinar','DT','','.',' ','','',100,1,'TND');
INSERT INTO CURRENCYFORMATS_V1 VALUES(142,'Turkish lira','₺','','.',' ','','',100,1,'TRY');
INSERT INTO CURRENCYFORMATS_V1 VALUES(143,'Turkmen manat','m','','.',' ','','',100,1,'TMT');
INSERT INTO CURRENCYFORMATS_V1 VALUES(144,'Ugandan shilling','USh','','.',' ','','',1,1,'UGX');
INSERT INTO CURRENCYFORMATS_V1 VALUES(145,'UAE dirham','','','.',' ','','',100,1,'AED');
INSERT INTO CURRENCYFORMATS_V1 VALUES(146,'Uruguayan peso','$U','','.',' ','','',100,1,'UYU');
INSERT INTO CURRENCYFORMATS_V1 VALUES(147,'Uzbekistani som','','','.',' ','','',1,1,'UZS');
INSERT INTO CURRENCYFORMATS_V1 VALUES(148,'Vanuatu vatu','VT','','.',' ','','',100,1,'VUV');
INSERT INTO CURRENCYFORMATS_V1 VALUES(149,'Vietnamese dong','₫','','.',' ','','',1,1,'VND');
INSERT INTO CURRENCYFORMATS_V1 VALUES(150,'Samoan tala','WS$','','.',' ','','',100,1,'WST');
INSERT INTO CURRENCYFORMATS_V1 VALUES(151,'Yemeni rial','','','.',' ','','',1,1,'YER');
INSERT INTO CURRENCYFORMATS_V1 VALUES(152,'Venezuelan Bolívar','Bs.','','.',',','bolívar','céntimos',100,1,'VEF');

-- Describe INFOTABLE_V1
CREATE TABLE INFOTABLE_V1(
INFOID integer not null primary key
, INFONAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, INFOVALUE TEXT NOT NULL
);
CREATE INDEX IDX_INFOTABLE_INFONAME ON INFOTABLE_V1(INFONAME);

INSERT INTO INFOTABLE_V1 VALUES(1, 'DATAVERSION', '3');

-- Describe PAYEE_V1
CREATE TABLE PAYEE_V1(
PAYEEID integer primary key
, PAYEENAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, CATEGID integer
, SUBCATEGID integer
);
CREATE INDEX IDX_PAYEE_INFONAME ON PAYEE_V1(PAYEENAME);


-- Describe SPLITTRANSACTIONS_V1
CREATE TABLE SPLITTRANSACTIONS_V1(
SPLITTRANSID integer primary key
, TRANSID integer NOT NULL
, CATEGID integer
, SUBCATEGID integer
, SPLITTRANSAMOUNT numeric
);
CREATE INDEX IDX_SPLITTRANSACTIONS_TRANSID ON SPLITTRANSACTIONS_V1(TRANSID);

-- Describe SPLITTRANSACTIONS_V2
CREATE TABLE SPLITTRANSACTIONS_V2(
SPLITTRANSID integer primary key
, ACCOUNTID integer NOT NULL
, TRANSID integer NOT NULL
, CATEGID integer
, SUBCATEGID integer
, SPLITTRANSAMOUNT numeric
, NOTES TEXT
);
CREATE INDEX IDX_SPLITTRANSACTIONS_V2_ACCOUNTID ON SPLITTRANSACTIONS_V2(ACCOUNTID);
CREATE INDEX IDX_SPLITTRANSACTIONS_V2_TRANSID ON SPLITTRANSACTIONS_V2(TRANSID);

-- Describe STOCK_V1
CREATE TABLE STOCK_V1(
STOCKID integer primary key
, HELDAT integer
, PURCHASEDATE TEXT NOT NULL
, STOCKNAME TEXT COLLATE NOCASE NOT NULL
, SYMBOL TEXT
, NUMSHARES numeric
, PURCHASEPRICE numeric NOT NULL
, NOTES TEXT
, CURRENTPRICE numeric NOT NULL
, VALUE numeric
, COMMISSION numeric
);
CREATE INDEX IDX_STOCK_HELDAT ON STOCK_V1(HELDAT);


-- Describe STOCKHISTORY_V1
CREATE TABLE STOCKHISTORY_V1(
HISTID integer primary key
, SYMBOL TEXT NOT NULL
, DATE TEXT NOT NULL
, VALUE numeric NOT NULL
, UPDTYPE integer
, UNIQUE(SYMBOL, DATE)
);
CREATE INDEX IDX_STOCKHISTORY_SYMBOL ON STOCKHISTORY_V1(SYMBOL);


-- Describe SUBCATEGORY_V1
CREATE TABLE SUBCATEGORY_V1(
SUBCATEGID integer primary key
, SUBCATEGNAME TEXT COLLATE NOCASE NOT NULL
, CATEGID integer NOT NULL
, UNIQUE(CATEGID, SUBCATEGNAME)
);
CREATE INDEX IDX_SUBCATEGORY_CATEGID ON SUBCATEGORY_V1(CATEGID);

INSERT INTO SUBCATEGORY_V1 VALUES(1,'Telephone',1);
INSERT INTO SUBCATEGORY_V1 VALUES(2,'Electricity',1);
INSERT INTO SUBCATEGORY_V1 VALUES(3,'Gas',1);
INSERT INTO SUBCATEGORY_V1 VALUES(4,'Internet',1);
INSERT INTO SUBCATEGORY_V1 VALUES(5,'Rent',1);
INSERT INTO SUBCATEGORY_V1 VALUES(6,'Cable TV',1);
INSERT INTO SUBCATEGORY_V1 VALUES(7,'Water',1);
INSERT INTO SUBCATEGORY_V1 VALUES(8,'Groceries',2);
INSERT INTO SUBCATEGORY_V1 VALUES(9,'Dining out',2);
INSERT INTO SUBCATEGORY_V1 VALUES(10,'Movies',3);
INSERT INTO SUBCATEGORY_V1 VALUES(11,'Video Rental',3);
INSERT INTO SUBCATEGORY_V1 VALUES(12,'Magazines',3);
INSERT INTO SUBCATEGORY_V1 VALUES(13,'Maintenance',4);
INSERT INTO SUBCATEGORY_V1 VALUES(14,'Gas',4);
INSERT INTO SUBCATEGORY_V1 VALUES(15,'Parking',4);
INSERT INTO SUBCATEGORY_V1 VALUES(16,'Registration',4);
INSERT INTO SUBCATEGORY_V1 VALUES(17,'Books',5);
INSERT INTO SUBCATEGORY_V1 VALUES(18,'Tuition',5);
INSERT INTO SUBCATEGORY_V1 VALUES(19,'Others',5);
INSERT INTO SUBCATEGORY_V1 VALUES(20,'Clothing',6);
INSERT INTO SUBCATEGORY_V1 VALUES(21,'Furnishing',6);
INSERT INTO SUBCATEGORY_V1 VALUES(22,'Others',6);
INSERT INTO SUBCATEGORY_V1 VALUES(23,'Health',7);
INSERT INTO SUBCATEGORY_V1 VALUES(24,'Dental',7);
INSERT INTO SUBCATEGORY_V1 VALUES(25,'Eyecare',7);
INSERT INTO SUBCATEGORY_V1 VALUES(26,'Physician',7);
INSERT INTO SUBCATEGORY_V1 VALUES(27,'Prescriptions',7);
INSERT INTO SUBCATEGORY_V1 VALUES(28,'Auto',8);
INSERT INTO SUBCATEGORY_V1 VALUES(29,'Life',8);
INSERT INTO SUBCATEGORY_V1 VALUES(30,'Home',8);
INSERT INTO SUBCATEGORY_V1 VALUES(31,'Health',8);
INSERT INTO SUBCATEGORY_V1 VALUES(32,'Travel',9);
INSERT INTO SUBCATEGORY_V1 VALUES(33,'Lodging',9);
INSERT INTO SUBCATEGORY_V1 VALUES(34,'Sightseeing',9);
INSERT INTO SUBCATEGORY_V1 VALUES(35,'Income Tax',10);
INSERT INTO SUBCATEGORY_V1 VALUES(36,'House Tax',10);
INSERT INTO SUBCATEGORY_V1 VALUES(37,'Water Tax',10);
INSERT INTO SUBCATEGORY_V1 VALUES(38,'Others',10);
INSERT INTO SUBCATEGORY_V1 VALUES(39,'Salary',13);
INSERT INTO SUBCATEGORY_V1 VALUES(40,'Reimbursement/Refunds',13);
INSERT INTO SUBCATEGORY_V1 VALUES(41,'Investment Income',13);


-- Describe SETTING_V1
create table SETTING_V1(
SETTINGID integer not null primary key
, SETTINGNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, SETTINGVALUE TEXT
);
CREATE INDEX IDX_SETTING_SETTINGNAME ON SETTING_V1(SETTINGNAME);

-- Describe REPORT_V1
create table REPORT_V1(
REPORTID integer not null primary key
, REPORTNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, GROUPNAME TEXT COLLATE NOCASE
, SQLCONTENT TEXT
, LUACONTENT TEXT
, TEMPLATECONTENT TEXT
, DESCRIPTION TEXT
);
CREATE INDEX INDEX_REPORT_NAME ON REPORT_V1(REPORTNAME);

-- Describe ATTACHMENT_V1
CREATE TABLE ATTACHMENT_V1 (
ATTACHMENTID INTEGER NOT NULL PRIMARY KEY
, REFTYPE TEXT NOT NULL /* Transaction, Stock, Asset, BankAccount, RepeatingTransaction, Payee */
, REFID INTEGER NOT NULL
, DESCRIPTION TEXT COLLATE NOCASE
, FILENAME TEXT NOT NULL COLLATE NOCASE
);
CREATE INDEX IDX_ATTACHMENT_REF ON ATTACHMENT_V1 (REFTYPE, REFID);

-- Describe USAGE_V1
CREATE TABLE USAGE_V1 (
USAGEID INTEGER NOT NULL PRIMARY KEY
, USAGEDATE TEXT NOT NULL
, JSONCONTENT TEXT NOT NULL
);
CREATE INDEX IDX_USAGE_DATE ON USAGE_V1 (USAGEDATE);

-- Asset Classes
CREATE TABLE ASSETCLASS_V1 (
ID INTEGER primary key
, PARENTID INTEGER
, NAME TEXT COLLATE NOCASE NOT NULL
, ALLOCATION REAL
, SORTORDER INTEGER
);

-- Asset Class / Stock link table
CREATE TABLE ASSETCLASS_STOCK_V1 (
ID INTEGER primary key
, ASSETCLASSID INTEGER NOT NULL
, STOCKSYMBOL TEXT UNIQUE
);

-- Describe CUSTOMFIELD_V1
CREATE TABLE CUSTOMFIELD_V1 (
FIELDID INTEGER NOT NULL PRIMARY KEY
, REFTYPE TEXT NOT NULL /* Transaction, Stock, Asset, BankAccount, RepeatingTransaction, Payee */
, DESCRIPTION TEXT COLLATE NOCASE
, TYPE TEXT NOT NULL /* String, Integer, Decimal, Boolean, Date, Time, SingleChoiche, MultiChoiche */
, PROPERTIES TEXT NOT NULL
);
CREATE INDEX IDX_CUSTOMFIELD_REF ON CUSTOMFIELD_V1 (REFTYPE);

-- Describe CUSTOMFIELDDATA_V1
CREATE TABLE CUSTOMFIELDDATA_V1 (
FIELDATADID INTEGER NOT NULL PRIMARY KEY
, FIELDID INTEGER NOT NULL
, REFID INTEGER NOT NULL
, CONTENT TEXT
, UNIQUE(FIELDID, REFID)
);
CREATE INDEX IDX_CUSTOMFIELDDATA_REF ON CUSTOMFIELDDATA_V1 (FIELDID, REFID);
