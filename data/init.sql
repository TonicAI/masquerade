SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

CREATE TABLE public.employees (
    id int not null,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    gender varchar(1) not null,
    personal_email varchar(100) not null,
    ssn varchar(20) not null,
    birth_date date not null,
    start_date date not null,
    office varchar(100) not null,
    title varchar(100) not null,
    org varchar(100) not null,
    accrued_holidays smallint not null,
    salary int not null,
    bonus int not null
);

ALTER TABLE "public"."employees" ADD PRIMARY KEY ("id");
ALTER TABLE public.employees OWNER TO "user";

COPY public.employees (id, first_name, last_name, gender, personal_email, ssn, birth_date, start_date, office, title, org, accrued_holidays, salary, bonus) FROM stdin;
100170	Cynthia	Chapman	F	cchapman@gmail.com	109-85-5285	1/14/1998 0:00	1/9/2019	Chicago	Engineer	Platform	10	88600	3600
100214	Glenn	Mendez	M	gmendez@hotmail.com	195-95-8914	2/14/1973 0:00	2/6/2008	Chicago	Engineer	DevOps	2	103600	7300
100249	Raymond	Barnett	M	rbarnett@yahoo.com	458-69-4479	1/11/1974 0:00	1/2/2009	Austin	VP	DevOps	8	138200	10500
100502	Karen	Thompson	F	kthompson@yahoo.com	557-63-8691	6/13/1981 0:00	6/5/2014	Seattle	Engineer	Platform	10	89100	6300
100638	Keith	Stephens	M	kstephens@yahoo.com	020-22-8052	11/26/1986 0:00	11/19/2014	New York	Manager	Sales	0	149000	13600
100670	Aaron	Ellis	M	aellis@yahoo.com	671-66-6685	1/13/2001 0:00	1/9/2019	New York	Associate	Sales	5	89700	4500
100679	Matthew	Schneider	M	mschneider@gmail.com	278-47-5059	10/11/1992 0:00	10/5/2018	New York	VP	Sales	11	159300	13100
101061	Jonathan	Guerrero	M	jguerrero@hotmail.com	147-75-6864	5/2/1996 0:00	4/27/2017	Seattle	Engineer	DevOps	4	88000	4800
101631	Bobby	Baird	M	bbaird@yahoo.com	226-23-6635	2/18/1984 0:00	2/10/2016	New York	Associate	Sales	20	111500	5900
101753	Chelsea	Kelley	F	ckelley@yahoo.com	813-72-4100	2/10/1983 0:00	2/2/2013	New York	Associate	Sales	16	129600	8000
101915	Sarah	Clark	F	sclark@hotmail.com	551-96-3160	4/2/1972 0:00	3/25/2007	New York	Associate	Marketing	17	144700	9800
102071	Sheri	Allen	F	sallen@gmail.com	509-53-7136	6/23/1991 0:00	6/16/2018	New York	Associate	Sales	7	98300	5500
102233	Joseph	Mitchell	M	jmitchell@yahoo.com	322-06-8466	10/7/1982 0:00	9/28/2016	New York	Associate	Sales	16	112800	7600
102266	Curtis	Edwards	M	cedwards@yahoo.com	639-49-6882	2/15/1982 0:00	2/9/2006	Seattle	Senior Engineer	DevOps	18	103600	9800
102613	Cassandra	Jacobs	F	cjacobs@gmail.com	680-67-7908	6/28/1974 0:00	6/19/2011	Chicago	Engineer	DevOps	3	85500	5700
102675	Ashley	Fitzgerald	F	afitzgerald@yahoo.com	608-08-8871	1/18/1975 0:00	1/10/2008	New York	Associate	Sales	12	112000	9700
103370	Stacy	Zimmerman	F	szimmerman@gmail.com	629-03-5553	1/15/1996 0:00	1/9/2019	Chicago	Engineer	Platform	9	69900	2500
103717	Michele	Sanford	F	msanford@yahoo.com	079-13-7706	12/21/1986 0:00	12/16/2006	New York	Associate	Sales	3	119400	12100
104412	Jessica	Le	F	jle@hotmail.com	068-53-0579	10/2/1975 0:00	9/22/2014	Chicago	Engineer	Product	2	77700	5400
104659	Robert	Franklin	M	rfranklin@hotmail.com	449-11-2494	1/12/1975 0:00	1/4/2007	Chicago	VP	DevOps	2	145700	12300
104828	Kenneth	Caldwell	M	kcaldwell@gmail.com	719-58-5463	2/25/1997 0:00	2/20/2018	Seattle	Manager	Product	14	125700	11500
104892	Christina	Knight	F	cknight@yahoo.com	387-20-4613	12/14/1992 0:00	12/9/2015	Chicago	Engineer	Product	12	94300	5300
104936	Brian	Flores	M	bflores@gmail.com	345-03-3217	9/26/1988 0:00	9/21/2009	Chicago	Senior Engineer	Platform	0	112100	9000
105204	Jeremiah	Guerrero	M	jguerrero@yahoo.com	411-14-5965	9/19/1978 0:00	9/10/2015	Austin	Engineer	Product	11	94100	5900
105257	Brittany	Kelley	F	bkelley@hotmail.com	307-09-5926	9/19/1982 0:00	9/14/2002	Chicago	Senior Engineer	Product	11	130900	10800
105369	Margaret	Mays	F	mmays@gmail.com	367-98-2939	3/13/1990 0:00	3/7/2013	Austin	VP	Platform	10	124900	11200
105418	Tony	Castro	M	tcastro@yahoo.com	525-67-3845	8/28/1967 0:00	8/19/2002	Chicago	Manager	DevOps	12	105400	11000
105553	Randy	Stein	M	rstein@hotmail.com	885-69-3887	2/23/1991 0:00	2/17/2016	New York	Associate	Marketing	11	116600	8300
105845	Rachel	Martinez	F	rmartinez@gmail.com	295-88-8457	10/17/1983 0:00	10/8/2017	Austin	Senior Engineer	DevOps	10	97700	7700
106285	Michael	Mendoza	M	mmendoza@gmail.com	452-62-5193	9/28/1990 0:00	9/22/2015	Austin	Senior Engineer	DevOps	14	86800	7100
106322	Amy	Robinson	F	arobinson@hotmail.com	707-18-8994	6/11/1999 0:00	6/6/2018	Austin	Engineer	Internal Tools	7	72100	2800
107028	Shawn	Guzman	M	sguzman@gmail.com	892-20-9118	5/17/1975 0:00	5/9/2007	Seattle	Manager	DevOps	4	139900	11700
107072	Anthony	Roberts	M	aroberts@gmail.com	538-39-3099	11/19/1996 0:00	11/15/2015	New York	Associate	Sales	3	118300	7500
107322	Tonya	Martinez	F	tmartinez@hotmail.com	379-92-7571	9/4/1977 0:00	8/25/2017	Austin	Engineer	Platform	13	71400	4600
108185	Scott	Hubbard	M	shubbard@hotmail.com	397-45-1833	11/28/1982 0:00	11/22/2006	Seattle	Senior Engineer	Platform	12	111800	9200
108422	Kelsey	Anderson	F	kanderson@yahoo.com	570-61-5203	9/19/1979 0:00	9/10/2013	Seattle	Engineer	Product	8	66100	5700
108429	Brianna	Smith	F	bsmith@yahoo.com	552-90-8829	11/18/1972 0:00	11/8/2012	Seattle	VP	Product	20	127300	13100
108491	Karen	Walters	F	kwalters@hotmail.com	007-29-6785	2/22/1989 0:00	2/16/2016	Chicago	Engineer	Product	3	93800	4000
108717	Andrew	Carr	M	acarr@gmail.com	698-99-3563	5/23/1979 0:00	5/15/2010	New York	Associate	Marketing	8	118700	12600
108823	Eddie	Torres	M	etorres@yahoo.com	639-12-5692	8/16/1986 0:00	8/9/2013	Seattle	Engineer	Product	9	91700	6700
108883	Kim	Thompson	F	kthompson@hotmail.com	119-27-9093	1/7/1981 0:00	12/30/2015	Austin	Engineer	Product	18	87100	4000
109242	Melanie	Hawkins	F	mhawkins@gmail.com	557-62-0365	3/7/1984 0:00	2/27/2017	Austin	Engineer	Product	17	78300	4000
110040	Paul	Holmes	M	pholmes@hotmail.com	247-39-6165	1/16/1992 0:00	1/9/2019	Austin	Engineer	Product	12	71700	2300
110209	Cheryl	Taylor	F	ctaylor@yahoo.com	402-89-2439	12/3/1978 0:00	11/26/2007	Austin	VP	DevOps	11	124100	11900
110224	Jeffrey	Rogers	M	jrogers@hotmail.com	377-16-2807	5/19/1980 0:00	5/12/2011	Seattle	Engineer	DevOps	3	105500	8200
110523	Vanessa	Duncan	F	vduncan@gmail.com	742-90-9616	10/14/1981 0:00	10/7/2010	Austin	Engineer	Platform	18	99500	5200
111224	Mark	Wheeler	M	mwheeler@gmail.com	663-59-6727	7/11/1996 0:00	7/7/2015	Seattle	Engineer	Product	0	103200	7600
111247	Diamond	Smith	F	dsmith@gmail.com	039-98-0923	5/2/1977 0:00	4/26/2002	Austin	Senior Engineer	Product	9	87200	8900
111383	Robert	Gill	M	rgill@yahoo.com	138-80-4291	2/14/1976 0:00	2/4/2013	Seattle	Engineer	Platform	8	111200	7600
111481	Olivia	Jones	F	ojones@gmail.com	820-15-9360	4/1/1994 0:00	3/26/2018	Austin	Engineer	DevOps	1	71700	3100
111527	Christopher	Mcdonald	M	cmcdonald@yahoo.com	712-39-3815	6/1/1974 0:00	5/22/2014	Austin	Senior Engineer	Internal Tools	11	114500	10100
111532	Catherine	Caldwell	F	ccaldwell@gmail.com	545-69-1996	8/29/1993 0:00	8/24/2013	Chicago	Engineer	Internal Tools	8	85500	4900
111833	Courtney	Hawkins	F	chawkins@hotmail.com	893-72-1113	10/24/1974 0:00	10/15/2010	New York	Associate	Sales	17	124900	7400
111857	Arthur	Gonzales	M	agonzales@yahoo.com	137-02-2992	3/22/1981 0:00	3/17/2001	Chicago	Senior Engineer	DevOps	1	111600	10200
111913	Christina	Callahan	F	ccallahan@gmail.com	264-85-3056	5/28/1994 0:00	5/23/2014	New York	Associate	Marketing	8	104900	7300
111914	Patrick	Mercado	M	pmercado@gmail.com	131-71-5685	8/5/1977 0:00	7/26/2017	New York	Associate	Marketing	4	104100	8800
111936	Sherry	Shannon	F	sshannon@hotmail.com	644-13-8412	1/10/1996 0:00	1/4/2018	Chicago	Senior Engineer	Internal Tools	20	120700	9300
111939	Ryan	Murray	M	rmurray@yahoo.com	396-61-9337	1/6/1972 0:00	12/30/1998	Chicago	VP	Internal Tools	20	124200	12000
112055	Catherine	Cabrera	F	ccabrera@gmail.com	805-77-5137	11/1/1982 0:00	10/26/2007	Chicago	Senior Engineer	Product	19	99600	8600
112100	Amy	Parks	F	aparks@yahoo.com	052-41-1572	1/18/1981 0:00	1/9/2019	Seattle	Engineer	Platform	1	93300	3900
112128	John	Hill	M	jhill@yahoo.com	835-27-9673	11/5/1974 0:00	10/28/2007	Austin	Manager	Platform	2	74800	9500
112383	Erik	Meyers	M	emeyers@yahoo.com	217-68-4864	7/25/1976 0:00	7/17/2010	Seattle	Engineer	Internal Tools	6	89400	6900
112415	Alexandra	Fernandez	F	afernandez@yahoo.com	576-03-4202	12/13/1982 0:00	12/5/2015	Chicago	Senior Engineer	Product	6	97500	7900
112978	Rhonda	Colon	F	rcolon@yahoo.com	101-99-5365	9/16/1969 0:00	9/7/2007	Chicago	Manager	Platform	3	138600	10600
113034	Jennifer	Avila	F	javila@yahoo.com	309-52-5957	3/1/1983 0:00	2/20/2017	New York	Associate	Sales	14	129500	9800
113136	Manuel	Reyes	M	mreyes@hotmail.com	874-19-7514	2/4/1981 0:00	1/29/2005	Chicago	Senior Engineer	Internal Tools	20	117300	8600
113347	Brandon	Mcdonald	M	bmcdonald@gmail.com	163-57-3353	4/17/1969 0:00	4/8/2007	Seattle	Senior Engineer	Platform	4	115900	11400
113460	David	Jordan	M	djordan@gmail.com	588-74-9232	1/15/1993 0:00	1/9/2019	Seattle	Engineer	DevOps	3	101700	4100
114002	Eric	Hunter	M	ehunter@yahoo.com	098-30-8665	2/23/1979 0:00	2/14/2016	Austin	Engineer	Product	8	88100	4300
114114	Jerry	Rogers	M	jrogers@hotmail.com	282-67-0361	4/22/1984 0:00	4/14/2016	New York	Associate	Sales	13	119600	8600
114160	Debra	Hines	F	dhines@yahoo.com	518-18-2327	1/18/1981 0:00	1/9/2019	Austin	Engineer	Platform	10	68000	2200
114250	Sandra	Bishop	F	sbishop@gmail.com	499-50-7428	1/15/1994 0:00	1/9/2019	Chicago	Engineer	DevOps	15	73300	3300
114390	Robin	Morrison	F	rmorrison@yahoo.com	379-80-4677	1/16/1989 0:00	1/9/2019	New York	Associate	Marketing	11	91500	4600
114583	Bridget	Brewer	F	bbrewer@yahoo.com	107-71-2557	5/30/1983 0:00	5/22/2014	Seattle	Engineer	Platform	3	89200	6800
114906	Jack	Roach	M	jroach@gmail.com	574-23-6841	7/3/1982 0:00	6/28/2001	Seattle	Senior Engineer	Platform	17	121200	9700
115055	Isaac	Sampson	M	isampson@yahoo.com	188-71-8878	6/29/1982 0:00	6/21/2012	Chicago	Senior Engineer	DevOps	4	111100	8700
115755	Carrie	Smith	F	csmith@yahoo.com	604-60-9361	5/10/1987 0:00	5/4/2010	New York	Associate	Sales	13	115400	10500
116102	Jessica	Sanchez	F	jsanchez@gmail.com	450-18-4707	1/13/1997 0:00	1/9/2015	Seattle	Engineer	Platform	14	104700	6300
116451	John	Jacobson	M	jjacobson@hotmail.com	590-05-9420	4/22/1994 0:00	4/16/2016	Chicago	Engineer	Product	17	95900	3900
116680	Mark	Reynolds	M	mreynolds@gmail.com	540-74-4248	1/18/1981 0:00	1/9/2019	Austin	Engineer	DevOps	12	76700	2400
116841	James	Ramos	M	jramos@hotmail.com	103-80-6582	4/2/1996 0:00	3/28/2017	Austin	Engineer	Product	19	75600	2600
117641	Melissa	Tapia	F	mtapia@gmail.com	008-38-3976	9/11/1999 0:00	9/6/2017	Austin	Engineer	Product	9	75300	3500
117986	Kelly	Strong	F	kstrong@yahoo.com	799-74-5856	3/9/1980 0:00	3/3/2007	Seattle	Senior Engineer	Internal Tools	18	115300	10200
117995	Kimberly	Lopez	F	klopez@gmail.com	703-36-8104	10/2/1979 0:00	9/23/2014	New York	Associate	Marketing	7	129900	10300
118254	Ashley	Holmes	F	aholmes@yahoo.com	400-15-8782	10/26/1987 0:00	10/18/2017	Chicago	Engineer	DevOps	18	98800	6800
118340	Mark	Parker	M	mparker@hotmail.com	117-11-8280	1/18/1981 0:00	1/9/2019	Seattle	Engineer	Internal Tools	15	89900	3800
118449	Jo	Buck	F	jbuck@gmail.com	052-99-9819	1/24/1985 0:00	1/20/2003	Austin	VP	Product	6	146700	11200
118557	Connor	Mitchell	M	cmitchell@gmail.com	889-58-4955	11/29/1994 0:00	11/23/2017	New York	Associate	Sales	9	142700	11700
119015	John	Vargas	M	jvargas@hotmail.com	214-16-2777	3/18/1985 0:00	3/10/2016	Chicago	Senior Engineer	DevOps	16	106400	8200
119237	Christina	Madden	F	cmadden@yahoo.com	146-74-8628	3/31/1980 0:00	3/24/2008	New York	Associate	Sales	4	118400	11700
119855	Stephanie	Smith	F	ssmith@gmail.com	115-68-2668	3/22/1976 0:00	3/14/2009	Chicago	Senior Engineer	DevOps	6	107100	8600
120082	Roy	Rose	M	rrose@gmail.com	190-92-7946	8/18/1993 0:00	8/13/2013	Austin	Engineer	Product	12	83700	4500
120781	Dillon	Stark	M	dstark@gmail.com	434-73-4967	10/28/1987 0:00	10/20/2018	Seattle	Engineer	Internal Tools	18	90500	5700
120824	Douglas	Roberts	M	droberts@gmail.com	514-45-2805	6/20/1986 0:00	6/13/2014	Seattle	Engineer	Product	9	93400	8000
120844	Nicole	Hicks	F	nhicks@hotmail.com	884-71-6850	12/12/1989 0:00	12/7/2011	Austin	Engineer	Product	17	73100	6500
120953	Amy	White	F	awhite@hotmail.com	090-31-9207	12/12/1991 0:00	12/7/2011	New York	Associate	Sales	18	119100	7900
120980	Debra	Gillespie	F	dgillespie@hotmail.com	562-40-2254	1/16/1992 0:00	1/9/2019	Seattle	Engineer	Platform	17	92200	3800
121494	James	Harper	M	jharper@hotmail.com	288-44-4568	12/7/1982 0:00	11/30/2008	Chicago	Engineer	DevOps	10	98600	7400
121633	Allison	Garcia	F	agarcia@hotmail.com	437-60-5477	8/21/1998 0:00	8/16/2016	New York	Associate	Sales	20	123500	7600
121634	Andrew	Reed	M	areed@hotmail.com	365-67-5845	6/7/1996 0:00	6/3/2015	New York	Associate	Sales	11	140000	8400
121858	Mary	Delgado	F	mdelgado@yahoo.com	286-14-7185	2/28/1986 0:00	2/23/2007	Chicago	Manager	DevOps	14	119300	10500
121928	Carrie	Davis	F	cdavis@hotmail.com	303-92-2670	8/28/1978 0:00	8/22/2001	Austin	Manager	Internal Tools	9	105000	10800
121992	Kenneth	Suarez	M	ksuarez@gmail.com	131-67-3456	1/24/1997 0:00	1/19/2018	New York	Associate	Marketing	1	115300	7200
122014	Yolanda	Nicholson	F	ynicholson@yahoo.com	179-40-3005	9/25/1994 0:00	9/20/2014	Chicago	Engineer	Product	5	93800	7800
122101	Terrance	Davies	M	tdavies@hotmail.com	565-50-6626	12/26/1983 0:00	12/17/2018	Seattle	Engineer	Platform	12	99300	4200
122644	Mary	Solis	F	msolis@gmail.com	313-31-6008	12/13/1987 0:00	12/8/2007	Austin	Engineer	DevOps	9	96700	6000
122657	Amy	Clark	F	aclark@yahoo.com	752-87-9579	4/30/1989 0:00	4/25/2010	Chicago	Senior Engineer	DevOps	20	100700	9300
122710	Dana	Silva	F	dsilva@yahoo.com	882-35-0314	1/15/1994 0:00	1/9/2019	New York	Associate	Marketing	15	92600	5100
122712	Charles	Johnston	M	cjohnston@hotmail.com	652-45-7222	12/7/1992 0:00	12/1/2016	New York	Associate	Marketing	20	129700	6700
122731	Michael	Cook	M	mcook@yahoo.com	559-24-5106	8/28/1978 0:00	8/18/2017	Chicago	Engineer	Internal Tools	16	67300	3800
122852	Laura	Johnson	F	ljohnson@gmail.com	073-46-9889	6/2/1977 0:00	5/24/2013	Chicago	Engineer	Product	10	89500	5200
123049	Whitney	Garrison	F	wgarrison@hotmail.com	696-39-3929	7/22/1978 0:00	7/17/1999	Austin	VP	DevOps	9	130600	11400
123623	Debbie	Harris	F	dharris@yahoo.com	632-29-5254	3/25/1992 0:00	3/19/2018	Seattle	Engineer	Product	14	90500	7000
123653	Natasha	Mata	F	nmata@hotmail.com	568-90-2664	12/19/1978 0:00	12/9/2018	Chicago	Engineer	Product	5	83500	5900
123722	Carly	Anderson	F	canderson@hotmail.com	041-48-7885	11/4/1991 0:00	10/29/2014	Austin	Engineer	Platform	11	80300	3900
124127	Kyle	Murray	M	kmurray@yahoo.com	486-75-0263	9/4/1972 0:00	8/26/2009	Austin	Senior Engineer	Platform	10	113700	9500
124261	Monica	Martinez	F	mmartinez@hotmail.com	009-27-5756	10/29/1982 0:00	10/20/2018	Seattle	Engineer	DevOps	11	101400	5000
124267	Jacqueline	Anderson	F	janderson@hotmail.com	460-44-1221	11/16/1989 0:00	11/9/2018	Seattle	Senior Engineer	DevOps	0	126100	10500
124915	Scott	Wells	M	swells@gmail.com	133-79-8654	11/22/1988 0:00	11/18/2007	New York	Associate	Sales	8	109700	10300
125024	John	Cochran	M	jcochran@yahoo.com	792-04-8040	2/9/1980 0:00	1/30/2017	Seattle	Engineer	DevOps	13	113300	6900
125196	Richard	Santiago	M	rsantiago@yahoo.com	380-93-0450	2/14/1968 0:00	2/4/2008	New York	Associate	Marketing	11	126900	10300
125464	Jill	Young	F	jyoung@yahoo.com	348-04-1511	9/17/1982 0:00	9/9/2014	Seattle	Engineer	DevOps	10	100200	8100
125531	Ryan	Jacobs	M	rjacobs@gmail.com	877-65-5046	9/30/1993 0:00	9/24/2018	Chicago	Engineer	Internal Tools	16	81800	4500
125659	Laura	Vargas	F	lvargas@gmail.com	306-90-1298	12/21/1997 0:00	12/17/2015	Chicago	VP	Product	9	133300	11300
126105	Hunter	Johnston	M	hjohnston@yahoo.com	242-30-4533	6/10/1991 0:00	6/3/2016	Seattle	Senior Engineer	Platform	16	114600	8600
126181	Jose	Hale	M	jhale@yahoo.com	648-09-7240	2/6/1978 0:00	1/28/2016	Seattle	Engineer	Platform	2	95400	4200
126192	Rachael	Cantu	F	rcantu@hotmail.com	473-58-1405	3/26/1981 0:00	3/18/2013	New York	Associate	Sales	14	121300	7300
126279	Johnny	Elliott	M	jelliott@yahoo.com	340-97-6567	10/27/1979 0:00	10/22/1997	New York	VP	Sales	12	178100	14600
126371	Erik	Howell	M	ehowell@gmail.com	659-54-1426	3/29/1997 0:00	3/24/2017	Chicago	Engineer	Internal Tools	3	82700	3800
126604	Theodore	Cole	M	tcole@gmail.com	470-30-1230	7/3/1981 0:00	6/24/2018	Austin	Engineer	DevOps	2	95000	5800
127578	Jessica	Martinez	F	jmartinez@hotmail.com	562-15-3110	6/27/1965 0:00	6/19/1997	Chicago	Manager	Internal Tools	17	103500	10800
127700	Trevor	Novak	M	tnovak@gmail.com	509-59-0160	1/17/1986 0:00	1/9/2019	Seattle	Engineer	Platform	14	89600	3500
128006	Douglas	Larson	M	dlarson@yahoo.com	488-34-5244	3/20/1985 0:00	3/12/2016	Austin	Senior Engineer	Product	15	99300	7600
128183	Thomas	Donovan	M	tdonovan@hotmail.com	496-43-0897	10/29/1984 0:00	10/22/2013	Seattle	Engineer	Platform	15	95400	7800
128248	Amy	Fischer	F	afischer@yahoo.com	083-11-7685	2/4/1978 0:00	1/25/2017	Austin	Manager	DevOps	17	128900	9500
128443	Regina	Smith	F	rsmith@gmail.com	203-85-6036	10/12/1987 0:00	10/6/2011	Austin	Engineer	Product	6	77500	4300
128647	Valerie	Lucas	F	vlucas@yahoo.com	823-73-5989	4/10/1984 0:00	4/3/2013	Austin	Senior Engineer	DevOps	14	113400	8400
128844	Joseph	Simon	M	jsimon@gmail.com	350-23-0493	12/18/1994 0:00	12/13/2012	Austin	Engineer	Product	4	97700	5800
128886	Jeffery	Pitts	M	jpitts@gmail.com	161-45-4155	2/26/1985 0:00	2/20/2009	Austin	Senior Engineer	Product	17	109500	8700
128951	Anna	Atkinson	F	aatkinson@gmail.com	461-22-5636	10/7/1998 0:00	10/2/2018	New York	Associate	Sales	7	80000	6400
129094	James	Burns	M	jburns@hotmail.com	851-77-6167	6/30/1972 0:00	6/20/2012	Chicago	Engineer	DevOps	5	104700	6600
129162	James	Rodgers	M	jrodgers@gmail.com	529-25-0725	8/9/1979 0:00	7/31/2015	Austin	Engineer	Internal Tools	16	91500	3600
129214	Jason	Schroeder	M	jschroeder@hotmail.com	712-43-3877	7/14/1976 0:00	7/4/2016	Chicago	Engineer	Product	10	100700	7400
129835	Michael	Hanson	M	mhanson@yahoo.com	793-30-8764	10/4/1977 0:00	9/25/2014	New York	Associate	Sales	7	139100	9700
129843	Natalie	Walker	F	nwalker@hotmail.com	294-26-5621	1/18/1988 0:00	1/12/2012	Austin	Engineer	DevOps	14	83700	5300
130080	Brandon	Hayes	M	bhayes@yahoo.com	686-96-2560	1/14/1999 0:00	1/9/2019	Austin	Engineer	Product	18	59600	2100
130558	Heidi	Lee	F	hlee@gmail.com	564-31-9707	9/24/1981 0:00	9/17/2010	New York	Manager	Sales	3	135000	12100
130565	Noah	Leblanc	M	nleblanc@hotmail.com	088-59-0862	10/4/1995 0:00	9/29/2014	Austin	Senior Engineer	Platform	2	82100	7200
130965	Mathew	Kennedy	M	mkennedy@yahoo.com	847-27-7520	5/2/1979 0:00	4/22/2017	Austin	Senior Engineer	Platform	6	85800	7100
131023	Angela	Taylor	F	ataylor@gmail.com	885-63-2265	3/18/1998 0:00	3/13/2018	Seattle	Engineer	DevOps	15	125000	7300
131215	Scott	Murphy	M	smurphy@gmail.com	497-37-8982	2/22/1981 0:00	2/16/2008	Chicago	Senior Engineer	Product	4	99100	8300
131851	Julie	Davis	F	jdavis@hotmail.com	320-27-3561	6/9/1985 0:00	6/1/2017	Chicago	Engineer	DevOps	16	80200	4700
131877	Teresa	Lewis	F	tlewis@hotmail.com	304-27-8825	6/3/1971 0:00	5/24/2011	New York	Associate	Sales	9	173100	11900
132111	Tracy	Ortega	F	tortega@gmail.com	710-37-3201	2/21/1977 0:00	2/11/2017	New York	Associate	Sales	9	107700	6400
132283	Jamie	Donaldson	F	jdonaldson@yahoo.com	496-03-3577	3/23/1971 0:00	3/13/2010	Austin	Engineer	DevOps	11	83400	4900
132291	Monica	Allen	F	mallen@yahoo.com	499-24-3100	2/9/1998 0:00	2/4/2018	Chicago	Engineer	DevOps	20	71500	3400
132293	Barry	Stewart	M	bstewart@hotmail.com	641-13-3824	3/28/1972 0:00	3/19/2010	Chicago	Engineer	DevOps	20	109400	6600
132808	Colleen	Oneal	F	coneal@gmail.com	727-11-3496	12/23/1991 0:00	12/18/2010	Austin	Manager	Product	15	108100	9700
132883	Ian	Robbins	M	irobbins@yahoo.com	355-44-9076	6/19/1978 0:00	6/9/2016	Austin	Engineer	Product	6	78900	5500
133257	Greg	Rogers	M	grogers@hotmail.com	493-73-1051	5/11/1988 0:00	5/4/2016	Chicago	Senior Engineer	Product	15	120300	9500
133543	Jermaine	Bowers	M	jbowers@hotmail.com	461-11-5358	2/9/1971 0:00	1/30/2011	Seattle	Engineer	Internal Tools	4	72200	7500
134024	Nicole	Barry	F	nbarry@hotmail.com	052-45-5105	7/20/1990 0:00	7/15/2009	Seattle	Engineer	Product	11	107700	8300
134162	Kimberly	Brewer	F	kbrewer@yahoo.com	561-89-0402	11/7/1985 0:00	10/31/2014	Austin	Engineer	Platform	17	70100	3500
134290	Jill	Garcia	F	jgarcia@yahoo.com	412-43-2792	1/19/1980 0:00	1/9/2019	Chicago	Engineer	DevOps	10	82800	3500
134418	Jacob	Gray	M	jgray@yahoo.com	100-64-0280	2/19/1984 0:00	2/11/2013	Chicago	Manager	Product	2	117000	11200
134493	Kelly	Graves	F	kgraves@hotmail.com	640-97-0193	8/24/1998 0:00	8/19/2016	Chicago	Engineer	Product	17	93500	5500
134696	Jeffrey	Tyler	M	jtyler@hotmail.com	436-58-4939	4/4/1976 0:00	3/27/2008	Chicago	Senior Engineer	DevOps	13	101200	9100
134886	Ashley	Gaines	F	againes@yahoo.com	093-63-2999	1/18/1969 0:00	1/10/2003	Austin	Senior Engineer	Product	17	114700	8500
135029	Jennifer	Williams	F	jwilliams@hotmail.com	851-81-1108	7/25/1967 0:00	7/17/1997	Seattle	VP	DevOps	4	177200	12700
135051	Maria	Williams	F	mwilliams@hotmail.com	484-57-5958	9/22/1978 0:00	9/12/2016	Chicago	Engineer	DevOps	14	94600	4000
135154	Austin	Baker	M	abaker@gmail.com	545-67-4827	4/11/1986 0:00	4/4/2013	New York	Associate	Marketing	16	105800	8900
135514	Nicole	Gallagher	F	ngallagher@gmail.com	851-66-3458	2/28/1973 0:00	2/20/2007	New York	Associate	Marketing	6	123000	7900
135787	Veronica	Walker	F	vwalker@gmail.com	121-27-7110	7/13/1992 0:00	7/8/2013	Seattle	Senior Engineer	Platform	6	115300	10600
136406	James	Ramirez	M	jramirez@gmail.com	162-09-9828	3/23/1986 0:00	3/16/2015	Austin	Senior Engineer	Product	11	104900	8200
136407	Vanessa	Buck	F	vbuck@hotmail.com	497-54-3198	2/11/1988 0:00	2/5/2012	Austin	Senior Engineer	Product	15	99000	9200
136493	Tracy	Jones	F	tjones@hotmail.com	709-54-6738	8/1/1976 0:00	7/22/2016	Chicago	Engineer	Product	13	76000	6600
136736	Diane	Lawson	F	dlawson@hotmail.com	516-15-4987	3/23/1975 0:00	3/13/2012	Chicago	Senior Engineer	Internal Tools	16	127600	9700
136767	Daisy	Charles	F	dcharles@gmail.com	085-08-0401	11/18/1996 0:00	11/13/2016	Austin	Senior Engineer	Internal Tools	17	124200	9500
137302	Jacob	Horton	M	jhorton@gmail.com	010-99-0402	5/6/1999 0:00	5/1/2017	Seattle	Engineer	Platform	20	98400	5900
137366	Russell	Turner	M	rturner@yahoo.com	003-66-5512	12/1/1989 0:00	11/26/2011	Austin	Senior Engineer	Platform	20	89400	8300
137635	Michael	Morrison	M	mmorrison@yahoo.com	506-72-2766	4/5/1974 0:00	3/27/2009	New York	Associate	Sales	5	120800	10500
137650	David	Andrews	M	dandrews@hotmail.com	561-45-3267	1/18/1984 0:00	1/9/2019	Chicago	Engineer	Product	11	81500	3300
137921	Laura	Swanson	F	lswanson@hotmail.com	444-51-2048	10/24/1983 0:00	10/15/2017	Austin	Engineer	Internal Tools	16	71500	3100
137954	Christine	Gonzalez	F	cgonzalez@gmail.com	217-15-7010	10/14/1988 0:00	10/8/2012	New York	Associate	Marketing	11	124800	9300
138132	Jeffrey	Gomez	M	jgomez@gmail.com	538-69-4368	5/29/1982 0:00	5/21/2013	Chicago	Engineer	Platform	4	79800	4700
138164	Tyler	Cook	M	tcook@hotmail.com	867-57-3201	3/5/1983 0:00	2/26/2009	Austin	Engineer	Platform	14	92300	5800
138167	Michael	Edwards	M	medwards@gmail.com	386-86-6041	5/18/1970 0:00	5/8/2009	Austin	Senior Engineer	Platform	8	100900	9400
138438	Mallory	Gaines	F	mgaines@hotmail.com	119-58-7946	8/18/1989 0:00	8/13/2010	New York	Manager	Sales	14	124600	13100
138742	Thomas	Morris	M	tmorris@yahoo.com	503-68-9000	1/4/1984 0:00	12/27/2015	Seattle	Engineer	Internal Tools	17	95600	6600
138777	Cory	Erickson	M	cerickson@hotmail.com	523-52-5973	6/22/1970 0:00	6/13/2004	Chicago	Senior Engineer	Internal Tools	12	94000	11000
138784	Sharon	Barry	F	sbarry@yahoo.com	674-89-5840	4/3/1979 0:00	3/24/2018	Seattle	Engineer	Internal Tools	2	111800	8500
139019	Joel	Evans	M	jevans@hotmail.com	146-79-6337	6/25/1982 0:00	6/17/2014	Chicago	VP	DevOps	4	125300	11500
139037	Rhonda	Miller	F	rmiller@yahoo.com	077-35-5888	2/1/1973 0:00	1/26/1999	New York	Associate	Sales	19	124200	12000
139226	Thomas	Wells	M	twells@hotmail.com	810-83-6319	8/22/1983 0:00	8/16/2005	Seattle	Senior Engineer	Product	5	146700	9400
139686	Cheryl	Floyd	F	cfloyd@hotmail.com	414-57-9306	11/16/1986 0:00	11/8/2018	Austin	Senior Engineer	Product	18	107400	7200
139868	Harry	Mullins	M	hmullins@hotmail.com	639-28-3820	1/10/1983 0:00	1/4/2007	Seattle	Manager	DevOps	7	108900	13100
139894	Lynn	Smith	F	lsmith@yahoo.com	634-09-2409	1/23/1979 0:00	1/13/2017	Chicago	Engineer	DevOps	18	96300	7000
139901	Stacey	Osborne	F	sosborne@hotmail.com	370-91-7260	9/26/1977 0:00	9/16/2017	Seattle	Engineer	Internal Tools	14	81700	5500
140180	Melissa	Wright	F	mwright@gmail.com	386-86-3000	1/19/1979 0:00	1/9/2019	Seattle	Engineer	Platform	14	95700	4400
140231	Amanda	Williams	F	awilliams@gmail.com	849-79-9713	9/19/1998 0:00	9/14/2016	New York	Associate	Sales	2	124700	6000
140521	Karen	Robinson	F	krobinson@gmail.com	665-52-0296	1/27/1984 0:00	1/18/2017	Austin	Engineer	Platform	19	79900	3600
140594	Crystal	Sanchez	F	csanchez@hotmail.com	344-10-2259	12/25/1983 0:00	12/18/2008	New York	Associate	Sales	10	116600	9200
140597	Laura	Hernandez	F	lhernandez@gmail.com	690-08-3449	10/27/1977 0:00	10/18/2013	New York	Associate	Sales	19	128800	12700
140615	Richard	Delgado	M	rdelgado@gmail.com	042-29-3594	10/5/1994 0:00	9/30/2015	Chicago	Senior Engineer	DevOps	1	108000	8800
140683	Manuel	Campbell	M	mcampbell@hotmail.com	751-83-0189	12/25/1980 0:00	12/17/2015	Austin	Engineer	DevOps	18	101100	4900
141787	Garrett	Scott	M	gscott@yahoo.com	789-22-8258	3/27/1981 0:00	3/20/2009	Seattle	Senior Engineer	Platform	18	132100	11100
142097	Raymond	Ford	M	rford@yahoo.com	811-77-7731	7/22/1983 0:00	7/13/2017	Chicago	Senior Engineer	Product	19	100200	10100
142329	Tina	Martin	F	tmartin@yahoo.com	034-19-0214	8/29/1979 0:00	8/20/2015	Austin	VP	Internal Tools	1	141900	11600
142446	Matthew	Collins	M	mcollins@yahoo.com	304-76-2128	6/15/1978 0:00	6/6/2014	Austin	Senior Engineer	Product	9	91500	7700
143055	Lori	Martin	F	lmartin@yahoo.com	320-51-0478	2/3/1975 0:00	1/24/2013	Chicago	Senior Engineer	DevOps	11	100100	7600
143185	Jose	Mccall	M	jmccall@gmail.com	800-15-6459	4/8/1987 0:00	4/1/2012	Seattle	Senior Engineer	Internal Tools	3	117600	8400
143223	Justin	Fuller	M	jfuller@gmail.com	885-55-9017	8/17/1995 0:00	8/11/2018	Seattle	Engineer	Product	10	125500	7200
144226	Seth	Ortiz	M	sortiz@gmail.com	587-71-4272	8/2/1981 0:00	7/26/2011	Seattle	Senior Engineer	DevOps	1	131700	9600
144438	Scott	Barr	M	sbarr@yahoo.com	725-09-3076	7/24/1959 0:00	7/14/1999	New York	Manager	Sales	2	142900	13300
144559	Jeffrey	Norman	M	jnorman@gmail.com	552-70-6472	5/16/1975 0:00	5/9/2000	New York	VP	Sales	8	136800	13800
144759	Corey	Hamilton	M	chamilton@hotmail.com	133-43-4244	6/5/1984 0:00	5/28/2017	New York	VP	Marketing	4	153900	14300
144958	Dustin	Hinton	M	dhinton@yahoo.com	345-65-3432	8/17/1989 0:00	8/10/2018	New York	Manager	Sales	1	135000	13300
145020	Jennifer	Williams	F	jwilliams@hotmail.com	023-46-1701	1/18/1984 0:00	1/9/2019	Seattle	Engineer	DevOps	13	94200	4000
145291	Jennifer	Williams	F	jwilliams@hotmail.com	281-08-2096	4/29/1986 0:00	4/21/2017	Chicago	Engineer	Product	16	86900	3600
145362	Jamie	Phillips	M	jphillips@hotmail.com	188-46-3434	10/3/1993 0:00	9/27/2018	Austin	Engineer	Platform	13	82200	4300
145364	Jeremy	Morris	M	jmorris@hotmail.com	881-28-7473	4/6/1975 0:00	3/29/2007	Austin	Engineer	Platform	10	105800	5500
145463	Thomas	Henderson	M	thenderson@hotmail.com	255-31-9547	3/22/1991 0:00	3/15/2017	Seattle	Engineer	DevOps	7	107000	8000
145537	Erica	Glenn	F	eglenn@hotmail.com	832-72-4667	12/8/1981 0:00	11/29/2016	Chicago	Senior Engineer	Internal Tools	17	112300	10500
145632	Kenneth	Morgan	M	kmorgan@gmail.com	304-61-2600	8/9/1982 0:00	7/31/2018	New York	Associate	Sales	2	97800	7100
145652	Derrick	Cowan	M	dcowan@gmail.com	055-95-7022	3/18/1990 0:00	3/12/2013	Chicago	Engineer	Product	10	99000	5200
145719	Steven	Hamilton	M	shamilton@gmail.com	718-22-3994	1/24/1972 0:00	1/15/2007	New York	VP	Sales	3	152100	13800
145753	Michael	Rice	M	mrice@yahoo.com	109-74-6267	5/21/1994 0:00	5/16/2015	New York	Associate	Sales	18	103700	8400
146165	Tracey	Thomas	F	tthomas@yahoo.com	820-32-2455	11/20/1982 0:00	11/12/2012	Austin	Senior Engineer	Platform	15	80600	7900
146311	Ryan	Castillo	M	rcastillo@yahoo.com	806-98-4616	3/6/1978 0:00	2/24/2018	New York	Associate	Marketing	17	93000	5400
146558	Scott	Ford	M	sford@hotmail.com	457-63-3497	1/1/1995 0:00	12/26/2018	New York	Manager	Sales	14	118200	13000
146833	Andrew	Rogers	M	arogers@hotmail.com	502-40-2613	5/4/1996 0:00	4/30/2015	New York	Associate	Sales	2	128300	8000
147249	Richard	Torres	M	rtorres@gmail.com	348-21-5316	9/19/1983 0:00	9/10/2018	Austin	VP	Product	0	138000	9800
147884	Gary	Rogers	M	grogers@gmail.com	389-36-5922	6/15/1979 0:00	6/8/2007	Austin	Engineer	DevOps	12	91500	6500
148148	Timothy	Fox	M	tfox@hotmail.com	787-66-8510	12/19/1975 0:00	12/11/2006	Seattle	Manager	Platform	16	148700	12000
148731	Dominic	Butler	M	dbutler@yahoo.com	239-69-0644	2/5/1992 0:00	1/29/2018	Chicago	Engineer	Internal Tools	20	95400	4100
148888	Michael	Parker	M	mparker@hotmail.com	855-04-9052	6/27/1972 0:00	6/18/2011	Austin	Manager	Product	10	130300	9800
149314	Robert	Flores	M	rflores@hotmail.com	680-05-1731	10/10/1987 0:00	10/2/2017	New York	Associate	Sales	1	133300	9400
149826	Rachael	Campos	F	rcampos@yahoo.com	338-39-4291	6/3/1972 0:00	5/25/2009	Seattle	Senior Engineer	DevOps	10	111500	11100
149908	Christopher	Sullivan	M	csullivan@gmail.com	197-64-2258	8/18/1992 0:00	8/13/2015	Seattle	Manager	Internal Tools	11	131800	12300
150214	Joshua	Hudson	M	jhudson@yahoo.com	799-50-5596	4/16/1991 0:00	4/9/2017	Chicago	Engineer	DevOps	12	98200	7100
151161	Yolanda	Johnson	F	yjohnson@gmail.com	336-37-7525	5/19/1989 0:00	5/12/2017	Austin	Engineer	Internal Tools	9	68700	3100
151251	Jessica	Garcia	F	jgarcia@gmail.com	834-28-5753	3/8/1986 0:00	2/28/2017	Chicago	Engineer	Product	7	94500	4700
151284	Jeffrey	Adams	M	jadams@yahoo.com	742-70-1144	10/7/1990 0:00	10/1/2012	Austin	Engineer	Product	15	76700	6500
151563	Kayla	Robinson	F	krobinson@yahoo.com	292-07-8030	6/8/1984 0:00	5/31/2018	Austin	Engineer	Internal Tools	20	80000	5300
151611	Connie	Brewer	F	cbrewer@yahoo.com	187-80-2451	10/10/1983 0:00	10/1/2016	Chicago	Engineer	Product	15	87000	4300
151631	John	Barrett	M	jbarrett@gmail.com	379-93-6906	4/2/1991 0:00	3/26/2016	New York	Associate	Sales	7	121400	6200
151762	Amanda	Bean	F	abean@gmail.com	337-08-9040	4/13/1985 0:00	4/6/2013	Austin	Engineer	Platform	18	82600	3900
151881	Amy	Hopkins	F	ahopkins@gmail.com	837-39-9705	5/9/1991 0:00	5/2/2017	Austin	Engineer	DevOps	18	81300	2100
151960	Glenda	Francis	F	gfrancis@hotmail.com	159-17-4934	1/14/1997 0:00	1/9/2019	Austin	Engineer	Internal Tools	4	67900	2500
152783	Michael	Cowan	M	mcowan@hotmail.com	238-24-6453	8/25/1994 0:00	8/20/2014	Seattle	Engineer	Internal Tools	7	110600	7600
152809	Destiny	Acosta	F	dacosta@yahoo.com	467-63-5643	6/16/1984 0:00	6/8/2016	Austin	VP	Product	16	111500	11200
152914	Brian	Nicholson	M	bnicholson@yahoo.com	234-19-0208	10/25/1975 0:00	10/16/2008	New York	Associate	Sales	12	125400	8800
152990	Carla	Matthews	F	cmatthews@gmail.com	582-72-6033	1/14/1997 0:00	1/9/2019	New York	Associate	Sales	8	91300	4800
153259	Chloe	Newman	F	cnewman@hotmail.com	095-25-1441	1/29/1984 0:00	1/24/2004	Chicago	VP	Product	6	142300	11500
153277	Erin	Wright	F	ewright@gmail.com	655-48-1676	4/5/1986 0:00	3/29/2014	New York	Associate	Sales	8	141800	12700
153346	Wanda	Anderson	F	wanderson@yahoo.com	705-34-4067	11/1/1964 0:00	10/22/2004	Seattle	Senior Engineer	Platform	8	120100	10300
153501	Joshua	May	M	jmay@hotmail.com	667-19-8585	6/24/1982 0:00	6/15/2016	Seattle	Engineer	Internal Tools	3	77700	4700
153502	Antonio	Henderson	M	ahenderson@hotmail.com	146-71-2202	5/4/1995 0:00	4/29/2014	Seattle	Engineer	Internal Tools	11	101100	5700
153555	Justin	Campbell	M	jcampbell@yahoo.com	319-34-3549	4/7/1971 0:00	3/29/2006	New York	Associate	Marketing	13	124800	10400
153679	Barry	Barron	M	bbarron@hotmail.com	834-99-2426	8/6/1997 0:00	8/1/2016	New York	VP	Sales	4	157700	13600
153685	Mario	Mendoza	M	mmendoza@hotmail.com	595-76-2291	7/3/1972 0:00	6/24/2008	Austin	Senior Engineer	Product	18	111600	6200
153711	Michael	Stark	M	mstark@yahoo.com	595-29-7832	3/26/1980 0:00	3/17/2016	New York	Associate	Sales	7	94100	6100
153741	Brandon	King	M	bking@hotmail.com	644-17-9186	4/1/1996 0:00	3/27/2016	Seattle	Engineer	Platform	9	108300	4900
153852	Arthur	Mitchell	M	amitchell@gmail.com	750-34-1161	11/8/1997 0:00	11/3/2017	Chicago	Engineer	DevOps	8	88300	5400
154164	Rebecca	Pruitt	F	rpruitt@hotmail.com	096-70-0980	10/15/1996 0:00	10/11/2015	Austin	Engineer	Platform	16	82100	5100
154237	Alexander	Flores	M	aflores@yahoo.com	565-72-8102	5/28/1993 0:00	5/24/2011	New York	Associate	Sales	15	130100	11400
154269	Miranda	Stone	F	mstone@hotmail.com	035-02-5381	7/24/1977 0:00	7/20/1995	Seattle	VP	DevOps	10	161100	13300
154524	Walter	Orozco	M	worozco@gmail.com	207-28-3976	7/28/1975 0:00	7/19/2009	Austin	Engineer	Platform	6	91400	6400
154726	Cynthia	Erickson	F	cerickson@yahoo.com	281-06-0574	7/5/1981 0:00	6/26/2017	Austin	Senior Engineer	Internal Tools	7	97300	8900
154804	Samuel	Watson	M	swatson@hotmail.com	646-24-1640	2/4/1967 0:00	1/25/2007	Austin	Engineer	Product	2	87200	5800
154979	Jeffery	Garrison	M	jgarrison@yahoo.com	269-41-6499	8/9/1982 0:00	7/31/2018	Chicago	VP	Platform	2	138900	12500
155420	Dawn	Williams	F	dwilliams@gmail.com	069-07-5212	1/15/1993 0:00	1/9/2019	Seattle	Engineer	DevOps	2	92400	4100
155474	Christina	Rodgers	F	crodgers@gmail.com	024-05-6096	11/3/1987 0:00	10/28/2010	New York	Associate	Sales	15	141800	9100
156007	Benjamin	West	M	bwest@hotmail.com	019-20-9571	3/27/1983 0:00	3/22/2003	Austin	Senior Engineer	Product	0	114100	9600
156044	Krystal	Richard	F	krichard@yahoo.com	783-58-7205	1/16/1987 0:00	1/10/2010	Austin	Engineer	Product	14	70100	6400
156228	Nicholas	Montgomery	M	nmontgomery@yahoo.com	297-11-3259	8/7/1968 0:00	7/31/1999	Seattle	Manager	DevOps	9	137600	12200
156241	Carol	Miller	F	cmiller@gmail.com	678-30-3853	8/13/1995 0:00	8/7/2018	Austin	Engineer	DevOps	16	84600	3400
156277	Rhonda	Miller	F	rmiller@yahoo.com	326-01-9223	5/20/1989 0:00	5/15/2011	New York	Associate	Sales	10	157800	10900
156473	Mark	Greene	M	mgreene@yahoo.com	616-99-4827	3/20/1986 0:00	3/12/2016	New York	Associate	Sales	19	116000	7600
156718	Steven	Watson	M	swatson@gmail.com	348-10-3141	2/3/1982 0:00	1/25/2018	New York	Manager	Marketing	10	140300	13200
156721	Matthew	Russell	M	mrussell@gmail.com	101-93-4960	5/15/1993 0:00	5/9/2018	Austin	Engineer	Internal Tools	3	72500	2100
157059	Devon	Evans	M	devans@gmail.com	297-43-9911	11/15/1975 0:00	11/8/2001	Chicago	VP	DevOps	14	144600	12400
157268	David	Horton	M	dhorton@gmail.com	534-75-2573	9/21/1986 0:00	9/14/2013	Seattle	Manager	Product	9	125400	11400
157958	Brittany	Flowers	F	bflowers@gmail.com	866-64-4242	9/28/1965 0:00	9/19/2000	New York	Manager	Marketing	15	153100	12200
158097	Amy	Costa	F	acosta@hotmail.com	851-71-0198	10/29/1973 0:00	10/23/1999	Chicago	Senior Engineer	Product	17	133800	10100
158609	Sherri	Walker	F	swalker@hotmail.com	204-74-8373	12/10/1976 0:00	12/3/2005	Austin	VP	DevOps	6	142800	10400
158903	Sherri	Anderson	F	sanderson@yahoo.com	350-92-9009	12/4/1985 0:00	11/27/2014	Seattle	Engineer	Platform	15	89700	7300
159225	Samuel	Parks	M	sparks@yahoo.com	579-41-1986	10/8/1989 0:00	10/3/2010	Seattle	Senior Engineer	Product	18	110300	9500
159254	Jose	Nelson	M	jnelson@hotmail.com	645-92-6826	4/4/1994 0:00	3/30/2012	Chicago	Engineer	Product	20	97900	6500
159434	Dana	Zuniga	F	dzuniga@gmail.com	823-22-4470	3/25/1970 0:00	3/15/2009	New York	Associate	Sales	9	98400	8000
159599	Kenneth	Ward	M	kward@gmail.com	228-62-6897	5/25/1983 0:00	5/20/2002	New York	VP	Marketing	10	158200	13400
159910	Christina	Haas	F	chaas@hotmail.com	099-85-9501	1/14/1998 0:00	1/9/2019	New York	Associate	Marketing	18	104000	5000
160278	Erin	Sanchez	F	esanchez@gmail.com	236-32-3391	11/8/1972 0:00	11/1/2000	New York	Manager	Sales	20	144200	13300
160358	Robert	Ryan	M	rryan@gmail.com	503-24-3481	11/16/1985 0:00	11/8/2018	New York	Manager	Marketing	5	145100	13800
160404	Lauren	Hall	F	lhall@hotmail.com	444-71-3252	4/14/1976 0:00	4/5/2012	Austin	Engineer	Product	4	96000	5600
160513	Audrey	Beard	F	abeard@yahoo.com	296-16-5161	11/25/1981 0:00	11/18/2011	New York	Associate	Sales	18	112600	8400
160543	Christopher	Foster	M	cfoster@gmail.com	081-27-7507	11/20/1993 0:00	11/15/2015	Seattle	Engineer	Platform	19	111300	7200
160704	Julia	Gonzalez	F	jgonzalez@gmail.com	179-70-5049	11/25/1988 0:00	11/19/2013	Seattle	Engineer	Internal Tools	5	116400	8100
160827	Charles	Wallace	M	cwallace@yahoo.com	788-89-0980	8/3/1976 0:00	7/29/1998	Seattle	Senior Engineer	Product	10	135400	11800
160870	Katie	Stark	F	kstark@hotmail.com	837-27-5606	1/16/1991 0:00	1/9/2019	New York	Associate	Sales	8	99900	4400
161260	Matthew	Mcgrath	M	mmcgrath@yahoo.com	886-92-8303	1/19/1979 0:00	1/9/2019	Seattle	Engineer	Product	16	81000	3700
161311	Jack	Curry	M	jcurry@gmail.com	135-55-3370	6/3/1980 0:00	5/25/2016	New York	Associate	Sales	1	95600	6300
161610	Jordan	Beard	M	jbeard@hotmail.com	249-99-6507	1/16/1989 0:00	1/9/2019	Chicago	Engineer	Product	6	84500	2800
161741	Pamela	Bush	F	pbush@hotmail.com	298-96-4018	5/20/1991 0:00	5/13/2018	Seattle	Engineer	Platform	7	106100	5000
162054	Tracey	Martin	F	tmartin@yahoo.com	761-43-8995	5/1/1990 0:00	4/25/2014	Chicago	Engineer	Product	11	77800	6400
162137	Ralph	Campbell	M	rcampbell@yahoo.com	487-89-8250	3/1/1986 0:00	2/22/2014	Chicago	Senior Engineer	Platform	12	119300	9500
162143	Mark	Campbell	M	mcampbell@hotmail.com	784-55-7599	11/29/1976 0:00	11/20/2014	Seattle	Engineer	Platform	2	100800	6200
162918	Christopher	Richardson	M	crichardson@gmail.com	877-11-0675	1/9/1991 0:00	1/3/2014	New York	Manager	Sales	20	167500	13100
163104	Samuel	Webb	M	swebb@gmail.com	496-33-7926	12/22/1985 0:00	12/16/2009	Seattle	Engineer	Internal Tools	0	104600	7700
163175	Carol	Hart	F	chart@hotmail.com	274-41-5631	7/1/1992 0:00	6/25/2018	Chicago	Senior Engineer	Internal Tools	10	98600	8500
164158	Michelle	Hodge	F	mhodge@gmail.com	826-78-5726	1/7/1977 0:00	12/30/2011	New York	Manager	Sales	19	165300	12600
164517	Angela	Hawkins	F	ahawkins@hotmail.com	147-78-0614	10/19/1985 0:00	10/12/2013	New York	Associate	Sales	4	123200	11700
164681	Cynthia	Robinson	F	crobinson@hotmail.com	119-10-7976	11/28/1982 0:00	11/19/2017	Austin	Engineer	DevOps	3	82300	3200
164933	Mark	Kirby	M	mkirby@yahoo.com	756-43-2626	2/17/1986 0:00	2/10/2015	Chicago	Engineer	Platform	6	93900	5200
165242	Amy	Hernandez	F	ahernandez@gmail.com	039-51-1104	6/5/1994 0:00	5/31/2013	Austin	Engineer	Product	13	80200	4100
165703	Amanda	Carlson	F	acarlson@hotmail.com	381-97-3315	7/19/1981 0:00	7/12/2010	Seattle	Engineer	Platform	6	116500	7100
165705	Jerry	Sherman	M	jsherman@gmail.com	302-51-6222	12/30/1974 0:00	12/21/2010	Seattle	Senior Engineer	Platform	9	106100	9300
165980	Mary	Whitehead	F	mwhitehead@gmail.com	250-96-9538	1/15/1994 0:00	1/9/2019	Seattle	Engineer	Internal Tools	18	86100	4700
166024	Kimberly	Taylor	F	ktaylor@hotmail.com	847-22-2258	6/28/1973 0:00	6/19/2008	Seattle	Engineer	Product	12	130500	7900
166118	Donald	Evans	M	devans@yahoo.com	874-98-7035	1/12/1981 0:00	1/6/2006	New York	Manager	Sales	18	162900	12800
166267	Rachel	Franco	F	rfranco@yahoo.com	540-96-2088	1/30/1965 0:00	1/22/1998	Seattle	Senior Engineer	DevOps	7	118600	11000
166640	Daniel	Spencer	M	dspencer@yahoo.com	677-59-2448	1/17/1987 0:00	1/9/2019	Austin	Engineer	DevOps	14	74000	2000
166665	Shannon	Martin	F	smartin@yahoo.com	123-73-3496	12/30/1972 0:00	12/21/2011	Seattle	Senior Engineer	DevOps	17	133400	7900
166902	Andrea	Miller	F	amiller@gmail.com	775-09-6887	1/6/1996 0:00	1/1/2016	Seattle	Engineer	Platform	1	116200	6200
167016	Tammy	Hood	F	thood@hotmail.com	446-31-7678	11/22/1985 0:00	11/16/2010	Chicago	Senior Engineer	DevOps	14	104000	10100
167216	Angela	Lewis	F	alewis@hotmail.com	578-55-0255	2/12/1971 0:00	2/3/2005	Chicago	Senior Engineer	Product	18	119200	8700
167412	John	Galloway	M	jgalloway@yahoo.com	495-40-9873	12/6/1980 0:00	11/28/2014	Chicago	Engineer	DevOps	14	81300	4700
167510	Alyssa	Floyd	F	afloyd@hotmail.com	431-26-6279	1/15/1995 0:00	1/9/2019	New York	Associate	Marketing	12	98800	4600
167703	Michael	Murray	M	mmurray@hotmail.com	506-52-6171	9/26/1991 0:00	9/21/2011	Seattle	Engineer	Platform	15	92100	7400
168311	Benjamin	Hamilton	M	bhamilton@hotmail.com	863-42-9605	1/20/1993 0:00	1/14/2018	New York	Associate	Marketing	20	112600	5400
168802	Heidi	Garcia	F	hgarcia@gmail.com	078-79-5823	10/21/1984 0:00	10/14/2013	Austin	Engineer	Product	4	81800	3300
169179	Tina	Meyer	F	tmeyer@gmail.com	802-20-2036	9/12/1997 0:00	9/7/2018	Chicago	VP	Internal Tools	11	134100	12000
169303	Amber	Meadows	F	ameadows@hotmail.com	351-94-0453	6/24/1996 0:00	6/19/2018	Seattle	Engineer	Platform	12	96400	7600
169405	Jordan	Lewis	F	jlewis@hotmail.com	565-56-1146	11/29/1979 0:00	11/21/2011	Austin	Senior Engineer	DevOps	20	91100	6400
169423	Courtney	Gross	F	cgross@yahoo.com	868-42-8939	8/20/1988 0:00	8/13/2016	Seattle	Engineer	DevOps	17	101100	8000
169515	Kristy	White	F	kwhite@yahoo.com	422-77-4688	8/20/1975 0:00	8/10/2014	New York	Associate	Marketing	20	121800	10500
169744	William	Collins	M	wcollins@gmail.com	667-51-9950	6/7/1984 0:00	5/31/2013	Seattle	Engineer	Platform	5	118400	8300
170026	Kylie	Lane	F	klane@yahoo.com	774-17-6928	12/25/1969 0:00	12/17/2001	Seattle	Senior Engineer	Product	18	141300	9400
170119	Carlos	Robertson	M	crobertson@hotmail.com	543-55-3465	1/2/1973 0:00	12/25/2005	New York	VP	Sales	5	137900	13900
170121	Jessica	Miller	F	jmiller@gmail.com	001-72-5917	2/16/1986 0:00	2/8/2017	Austin	Engineer	Platform	0	75000	3000
170248	Kenneth	Parker	M	kparker@yahoo.com	235-09-7970	9/15/1961 0:00	9/6/1997	Austin	Manager	DevOps	13	103200	9800
170444	Robert	Russell	M	rrussell@gmail.com	786-70-0976	5/8/1988 0:00	5/4/2007	Austin	Engineer	Product	3	79100	6200
170458	Lori	Rowland	F	lrowland@yahoo.com	768-81-0489	4/10/1971 0:00	4/2/2000	Chicago	Manager	Product	17	119900	10300
170632	Debra	White	F	dwhite@yahoo.com	761-68-1457	5/18/1990 0:00	5/11/2016	New York	Associate	Sales	4	92400	6800
170657	Philip	Fox	M	pfox@hotmail.com	273-63-8341	5/9/1977 0:00	5/3/2001	Chicago	Senior Engineer	DevOps	8	87200	10100
170756	Steven	Mcgee	M	smcgee@yahoo.com	804-54-9036	5/19/1986 0:00	5/11/2017	New York	Associate	Marketing	17	144900	10600
170973	Ryan	Gray	M	rgray@yahoo.com	489-46-1672	4/30/1974 0:00	4/20/2013	Chicago	Engineer	Platform	15	80600	7000
171012	Henry	Weaver	M	hweaver@hotmail.com	835-83-6466	5/16/1978 0:00	5/6/2016	Chicago	Engineer	DevOps	12	81000	5400
171717	Daniel	Scott	M	dscott@yahoo.com	793-18-1106	11/3/1979 0:00	10/28/2003	New York	Associate	Sales	13	133700	11700
171770	Bonnie	Delacruz	F	bdelacruz@yahoo.com	271-54-8040	1/16/1991 0:00	1/9/2019	Chicago	Engineer	Platform	8	87700	2700
172158	Angela	Klein	F	aklein@hotmail.com	586-55-3384	2/5/1978 0:00	1/26/2018	New York	Manager	Sales	7	131400	12900
172499	Ashley	Pearson	F	apearson@gmail.com	197-31-5093	6/8/1978 0:00	6/2/2002	Chicago	VP	Product	7	152300	11200
172551	Jessica	Santiago	F	jsantiago@hotmail.com	663-02-0971	11/18/1978 0:00	11/8/2016	New York	Associate	Sales	0	122800	6300
172951	Gina	Thompson	F	gthompson@gmail.com	375-94-5504	7/31/1991 0:00	7/24/2016	New York	Associate	Sales	16	98700	6300
173026	Stephanie	Middleton	F	smiddleton@yahoo.com	390-26-4941	7/13/1969 0:00	7/4/2004	Seattle	Senior Engineer	DevOps	12	123100	10400
173052	Kimberly	Norton	F	knorton@hotmail.com	573-86-2750	5/28/1978 0:00	5/18/2017	Chicago	Engineer	DevOps	5	93800	4400
173150	Steven	Thornton	M	sthornton@gmail.com	790-41-1965	1/14/1998 0:00	1/9/2019	New York	Associate	Marketing	12	99000	5200
173157	Richard	Larson	M	rlarson@gmail.com	735-35-8002	7/6/1983 0:00	6/29/2010	New York	Associate	Marketing	8	125600	12000
173403	Robert	Torres	M	rtorres@hotmail.com	198-72-8585	7/17/1976 0:00	7/8/2013	Austin	Engineer	DevOps	3	94700	4700
173718	Dana	Humphrey	F	dhumphrey@gmail.com	548-66-5876	2/1/1980 0:00	1/26/2001	New York	Manager	Sales	14	104800	12700
173764	Christine	Bradley	F	cbradley@gmail.com	416-96-3162	5/1/1995 0:00	4/25/2016	Austin	Engineer	Platform	2	81100	6700
173788	Hannah	Brewer	F	hbrewer@hotmail.com	018-78-1328	2/23/1977 0:00	2/19/1995	Seattle	Manager	Platform	0	129200	12000
173825	Benjamin	Shannon	M	bshannon@gmail.com	105-55-2136	5/28/1987 0:00	5/23/2005	Seattle	Senior Engineer	DevOps	10	106800	8600
173877	Mark	Campos	M	mcampos@gmail.com	417-81-5443	6/16/1967 0:00	6/8/1998	New York	Associate	Sales	20	113100	11200
173895	Kristen	Miller	F	kmiller@hotmail.com	569-84-1887	7/20/1989 0:00	7/14/2013	Chicago	Senior Engineer	DevOps	13	100100	7900
173922	Kenneth	Diaz	M	kdiaz@gmail.com	602-20-3141	10/6/1979 0:00	9/27/2015	Austin	Engineer	Internal Tools	4	80100	4300
174005	Gerald	Vance	M	gvance@yahoo.com	405-46-7526	1/31/1980 0:00	1/22/2016	Austin	Senior Engineer	Product	16	88800	6700
174099	Angela	Elliott	F	aelliott@hotmail.com	681-61-2909	12/21/1978 0:00	12/11/2017	Chicago	VP	Product	15	170200	11800
174141	William	Scott	M	wscott@gmail.com	070-02-1048	8/8/1995 0:00	8/2/2017	Seattle	Engineer	Platform	11	98100	5100
174319	Keith	Butler	M	kbutler@hotmail.com	203-55-1054	4/1/1974 0:00	3/23/2010	New York	VP	Marketing	17	161900	14200
174774	Erin	Miller	F	emiller@yahoo.com	805-23-6171	9/5/1981 0:00	8/29/2009	Chicago	Engineer	Internal Tools	19	82600	7100
175058	Joshua	Ramirez	M	jramirez@gmail.com	268-12-8169	8/14/1968 0:00	8/8/1995	Chicago	Manager	DevOps	8	115000	11100
175141	Anthony	Frank	M	afrank@hotmail.com	367-74-6908	11/2/1996 0:00	10/28/2016	Seattle	Engineer	Internal Tools	7	87200	5500
175147	Jenny	Lewis	F	jlewis@gmail.com	533-36-1949	4/5/1969 0:00	3/28/2000	Seattle	Senior Engineer	Internal Tools	6	116900	11200
175648	Kenneth	Cole	M	kcole@gmail.com	185-13-6606	12/5/1975 0:00	11/29/1996	Austin	Manager	Product	6	114700	10500
175948	Colleen	Padilla	F	cpadilla@gmail.com	432-65-1501	9/24/1984 0:00	9/19/2005	Seattle	Manager	Internal Tools	19	125000	12100
177107	Phillip	Carter	M	pcarter@yahoo.com	724-60-5704	3/4/1972 0:00	2/24/2007	Seattle	Senior Engineer	Internal Tools	11	111400	11100
177232	April	Sanchez	F	asanchez@yahoo.com	823-67-8834	10/3/1995 0:00	9/28/2013	New York	Associate	Sales	16	114600	6400
177364	Jacob	Vasquez	M	jvasquez@yahoo.com	315-26-9637	8/2/1987 0:00	7/25/2016	Austin	Engineer	Platform	14	61900	6400
177629	Janice	Taylor	F	jtaylor@hotmail.com	517-13-9874	3/15/1980 0:00	3/10/2001	Seattle	VP	Product	8	128500	13000
177805	Christian	Medina	M	cmedina@gmail.com	175-56-2165	2/28/1970 0:00	2/20/2004	Austin	Senior Engineer	DevOps	9	105100	7000
177966	Justin	Jensen	M	jjensen@yahoo.com	691-59-3825	10/5/1973 0:00	9/25/2012	Austin	Senior Engineer	Internal Tools	14	102300	9100
178005	Ray	Spencer	M	rspencer@gmail.com	739-10-6798	7/4/1987 0:00	6/29/2007	Austin	Senior Engineer	Product	13	97800	7500
178283	Jennifer	Holmes	F	jholmes@yahoo.com	528-52-2350	10/24/1978 0:00	10/15/2015	Austin	Engineer	DevOps	11	60400	4900
178287	Johnny	Kennedy	M	jkennedy@hotmail.com	841-11-3757	9/20/1977 0:00	9/12/2010	Austin	Senior Engineer	DevOps	2	106700	8500
178336	Brenda	Elliott	F	belliott@gmail.com	291-51-1069	8/2/1975 0:00	7/23/2012	Chicago	Senior Engineer	Internal Tools	9	102200	9300
178373	Shirley	Jones	F	sjones@gmail.com	241-55-9000	1/2/1998 0:00	12/28/2016	Chicago	Engineer	Internal Tools	9	103300	6300
178510	Michael	Fischer	M	mfischer@gmail.com	625-62-9017	1/16/1991 0:00	1/9/2019	New York	Associate	Sales	19	87500	5100
178606	Anna	Williams	F	awilliams@hotmail.com	182-94-2291	1/24/1992 0:00	1/17/2018	Austin	Senior Engineer	DevOps	10	102400	8200
178866	Jacob	Luna	M	jluna@hotmail.com	780-71-3428	3/1/1972 0:00	2/20/2010	Seattle	Senior Engineer	Product	17	141000	9300
179094	Crystal	Matthews	F	cmatthews@hotmail.com	185-04-4041	9/4/1984 0:00	8/28/2012	Chicago	Engineer	DevOps	2	101100	7100
179324	Daniel	Vazquez	M	dvazquez@gmail.com	898-35-0158	10/15/1971 0:00	10/5/2011	Austin	Engineer	Platform	8	96000	6200
179720	Daniel	Simpson	M	dsimpson@gmail.com	625-19-0402	1/15/1995 0:00	1/9/2019	Austin	Engineer	Platform	16	62300	1500
180113	Tonya	Castaneda	F	tcastaneda@gmail.com	001-67-7884	7/4/1993 0:00	6/28/2016	New York	Associate	Sales	12	128200	8000
180270	Katie	Riddle	F	kriddle@yahoo.com	017-84-6802	1/14/1997 0:00	1/9/2019	New York	Associate	Sales	18	110700	4500
180283	Joshua	Becker	M	jbecker@yahoo.com	433-84-9385	12/10/1988 0:00	12/4/2013	Austin	Engineer	DevOps	19	92400	4300
180320	John	Daniel	M	jdaniel@yahoo.com	514-51-3755	1/17/1986 0:00	1/9/2019	Austin	Engineer	Internal Tools	3	52900	2000
180360	Tracy	Nichols	F	tnichols@gmail.com	630-97-2223	1/15/1993 0:00	1/9/2019	Austin	Engineer	Internal Tools	16	67200	1800
180415	Jennifer	Austin	F	jaustin@gmail.com	534-67-0908	6/25/1983 0:00	6/18/2009	Chicago	Senior Engineer	Product	20	83300	7900
180684	Jack	Collins	M	jcollins@gmail.com	267-27-3258	8/20/1978 0:00	8/12/2009	Austin	Engineer	DevOps	8	86100	5700
180858	Cynthia	Moore	F	cmoore@hotmail.com	065-26-8673	10/16/1982 0:00	10/10/2007	Chicago	Manager	Product	4	118200	10800
180865	Jonathan	Spencer	M	jspencer@gmail.com	346-23-8887	4/21/1974 0:00	4/13/2005	Seattle	Senior Engineer	Product	9	110000	9200
181071	Craig	Kelly	M	ckelly@gmail.com	548-68-6173	9/6/1978 0:00	8/27/2018	New York	Associate	Sales	5	124500	5700
181133	Natalie	Lopez	F	nlopez@hotmail.com	868-50-7445	2/27/1986 0:00	2/20/2016	Chicago	Engineer	Internal Tools	12	87500	6100
181235	Angela	Payne	F	apayne@yahoo.com	120-80-4171	4/23/1975 0:00	4/15/2006	New York	Associate	Sales	2	142500	10600
181395	Maria	Brown	F	mbrown@gmail.com	343-12-0679	12/19/1982 0:00	12/12/2008	New York	Associate	Sales	17	122300	10200
181683	Robert	Howard	M	rhoward@hotmail.com	766-05-8162	9/5/1976 0:00	8/26/2016	Austin	Engineer	Product	9	85000	4900
181769	Jacob	Campbell	M	jcampbell@yahoo.com	382-46-5331	8/13/1975 0:00	8/5/2004	Austin	VP	Platform	14	135000	10100
181834	Troy	Bryant	M	tbryant@gmail.com	411-58-5421	5/12/1989 0:00	5/5/2016	New York	Associate	Sales	9	115100	9500
181990	Casey	Wilson	F	cwilson@gmail.com	049-08-1937	1/15/1994 0:00	1/9/2019	New York	Associate	Marketing	12	103300	5100
182417	Dawn	Perez	F	dperez@yahoo.com	835-53-2720	2/6/1982 0:00	1/31/2008	Chicago	Senior Engineer	Product	20	98900	9400
182585	Jonathan	Cole	M	jcole@hotmail.com	459-27-8984	5/25/1977 0:00	5/17/2011	Seattle	Senior Engineer	Platform	16	128200	8000
182723	John	Fuentes	M	jfuentes@yahoo.com	290-85-3803	12/4/1983 0:00	11/26/2013	Austin	Engineer	Internal Tools	15	92400	4200
182761	Susan	Johnson	F	sjohnson@gmail.com	817-47-8959	4/12/1998 0:00	4/7/2016	Austin	Engineer	Internal Tools	15	80200	1900
182959	Larry	King	M	lking@yahoo.com	813-34-7715	11/30/1955 0:00	11/20/1992	New York	VP	Sales	19	136400	14500
182992	Edward	Wilkinson	M	ewilkinson@yahoo.com	117-38-5064	12/28/1978 0:00	12/19/2015	New York	Associate	Sales	20	114400	7400
183061	Heather	Bond	F	hbond@hotmail.com	422-15-7480	3/4/1976 0:00	2/23/2016	Seattle	Engineer	DevOps	12	86100	5300
183321	Christina	Prince	F	cprince@yahoo.com	595-42-5702	11/5/1980 0:00	10/27/2018	Austin	Engineer	Platform	18	69700	3700
183406	Amanda	Ray	F	aray@hotmail.com	389-40-2196	4/8/1983 0:00	3/31/2013	Austin	Senior Engineer	DevOps	9	111800	7100
183646	Shannon	Mcguire	F	smcguire@hotmail.com	809-80-8589	9/16/1974 0:00	9/8/2007	Austin	Senior Engineer	Product	18	108700	7500
183817	Andrew	Castillo	M	acastillo@yahoo.com	347-78-9217	9/2/1961 0:00	8/23/2000	Chicago	Senior Engineer	DevOps	12	136100	10400
184267	Jorge	Parker	M	jparker@yahoo.com	659-03-6154	12/21/1978 0:00	12/12/2012	Seattle	Senior Engineer	DevOps	15	127300	11000
184577	Dominic	Mack	M	dmack@gmail.com	139-10-3492	2/15/1984 0:00	2/8/2012	Chicago	Senior Engineer	Platform	1	120200	10300
184795	Carol	Fuller	F	cfuller@gmail.com	078-78-9201	6/14/1983 0:00	6/7/2011	New York	Associate	Marketing	20	140300	10300
184864	Larry	Buck	M	lbuck@gmail.com	015-01-5131	3/15/1998 0:00	3/10/2016	Seattle	Engineer	Product	0	98200	9300
184927	Amanda	Moss	F	amoss@gmail.com	523-54-9734	10/30/1978 0:00	10/23/2004	Austin	Senior Engineer	Platform	16	124000	8700
184969	James	Huerta	M	jhuerta@gmail.com	139-15-3860	4/27/1992 0:00	4/23/2011	Austin	VP	Platform	4	137300	11200
185147	Jeffrey	Frye	M	jfrye@yahoo.com	213-22-5859	2/24/1969 0:00	2/16/2004	Seattle	Senior Engineer	Internal Tools	12	128100	11500
185568	Anthony	Watts	M	awatts@hotmail.com	857-51-9294	12/18/1962 0:00	12/8/2001	Austin	Manager	Internal Tools	12	99500	9800
185713	Amy	Bonilla	F	abonilla@yahoo.com	538-61-6872	12/10/1983 0:00	12/2/2014	New York	Associate	Sales	15	113000	8600
185810	Mike	Harrison	M	mharrison@hotmail.com	235-28-9455	1/15/1995 0:00	1/9/2019	Chicago	Engineer	DevOps	18	78000	3100
185894	John	Mora	M	jmora@yahoo.com	540-97-9087	6/16/1988 0:00	6/11/2008	Chicago	Engineer	DevOps	16	100200	6100
186222	Michael	Kane	M	mkane@yahoo.com	290-71-2314	5/29/1981 0:00	5/21/2015	Seattle	Engineer	DevOps	9	86600	5800
186358	Randall	Howard	M	rhoward@yahoo.com	394-33-1436	1/12/1983 0:00	1/6/2005	New York	Manager	Marketing	17	135000	13300
186425	Ryan	Woods	M	rwoods@hotmail.com	231-21-6608	9/17/1973 0:00	9/8/2008	Seattle	Senior Engineer	Product	19	116800	9500
186706	Scott	Reilly	M	sreilly@yahoo.com	490-72-6603	8/15/1982 0:00	8/6/2018	Seattle	Senior Engineer	Internal Tools	15	126000	8900
187038	Morgan	Vaughn	F	mvaughn@gmail.com	450-32-7370	3/11/1970 0:00	3/3/2002	New York	Manager	Sales	7	109700	13400
187072	Cynthia	Lane	F	clane@yahoo.com	899-45-4216	8/18/1986 0:00	8/10/2017	New York	Associate	Sales	11	121200	6500
187501	Brian	Krause	M	bkrause@yahoo.com	074-95-8887	2/15/1980 0:00	2/5/2017	Seattle	Engineer	Internal Tools	16	109800	4800
187880	Benjamin	Macdonald	M	bmacdonald@yahoo.com	645-16-4268	1/14/1998 0:00	1/9/2019	Austin	Engineer	DevOps	6	67600	1800
187916	Angela	Smith	F	asmith@yahoo.com	069-26-5124	11/17/1984 0:00	11/10/2014	New York	Associate	Marketing	2	137000	10800
188114	Anna	Pena	F	apena@hotmail.com	591-42-8911	3/26/1986 0:00	3/19/2014	New York	Associate	Sales	20	103900	8800
188225	Stacy	Brown	F	sbrown@yahoo.com	096-13-0526	2/23/1974 0:00	2/13/2014	Seattle	Senior Engineer	DevOps	2	127700	9400
188311	Erin	Arnold	F	earnold@yahoo.com	520-55-7756	1/19/1994 0:00	1/13/2017	New York	Associate	Marketing	20	115200	5700
188378	Martin	Ward	M	mward@hotmail.com	869-74-0263	9/29/1998 0:00	9/24/2016	Chicago	Manager	Internal Tools	20	115400	11500
188542	Kimberly	Garcia	F	kgarcia@gmail.com	056-85-4721	10/6/1994 0:00	9/30/2016	Seattle	Engineer	Platform	9	88000	6400
188598	Sheila	Grant	F	sgrant@hotmail.com	350-83-4730	3/27/1969 0:00	3/20/1997	New York	Manager	Sales	20	160800	12500
188649	Karen	Wilson	F	kwilson@yahoo.com	016-70-8724	11/9/1984 0:00	11/2/2013	Austin	VP	DevOps	14	114800	10300
188705	Donald	Mcgee	M	dmcgee@yahoo.com	183-45-8069	6/4/1973 0:00	5/25/2012	Seattle	Senior Engineer	Internal Tools	5	107400	9500
188756	Zachary	Wagner	M	zwagner@yahoo.com	593-46-7904	5/16/1985 0:00	5/10/2008	New York	Associate	Marketing	18	124500	11300
188987	James	Pollard	M	jpollard@yahoo.com	654-24-9896	3/10/1987 0:00	3/2/2018	Seattle	Senior Engineer	Platform	11	121300	10700
189070	Lisa	Nichols	F	lnichols@yahoo.com	733-65-1598	1/18/1981 0:00	1/9/2019	New York	Associate	Sales	10	88200	5100
189117	Caroline	Olsen	F	colsen@yahoo.com	064-76-8176	9/22/1966 0:00	9/14/1998	New York	Associate	Marketing	11	133000	11300
189163	Matthew	Hess	M	mhess@hotmail.com	477-63-8181	5/4/1979 0:00	4/25/2012	Austin	Engineer	Internal Tools	4	95300	4100
189312	Craig	Rich	M	crich@gmail.com	208-98-8770	5/19/1999 0:00	5/14/2017	New York	Associate	Sales	6	110800	6400
189812	Judith	Anderson	F	janderson@hotmail.com	858-09-9234	4/30/1982 0:00	4/22/2014	Chicago	Engineer	DevOps	18	106500	4700
189905	Barbara	Chapman	F	bchapman@gmail.com	874-78-4011	1/24/1971 0:00	1/14/2010	Seattle	Senior Engineer	Internal Tools	10	102100	8600
190580	Megan	Bradshaw	F	mbradshaw@gmail.com	394-17-2974	1/15/1996 0:00	1/9/2019	Seattle	Engineer	Platform	4	77800	4600
190659	Tabitha	White	F	twhite@yahoo.com	354-16-0302	8/11/1979 0:00	8/3/2008	Chicago	VP	DevOps	20	138300	12200
190849	Megan	Garcia	F	mgarcia@yahoo.com	354-91-7342	6/2/1983	5/24/2016	Austin	VP	Product	11	126200	10500
190955	Bryan	Bishop	M	bbishop@yahoo.com	384-94-4373	4/7/1982	3/29/2016	New York	Associate	Sales	13	110600	10600
191042	Tony	Torres	M	ttorres@yahoo.com	288-02-7382	3/5/1988	2/27/2014	Austin	Engineer	DevOps	0	74100	4100
191050	John	Fernandez	M	jfernandez@hotmail.com	308-53-9641	1/16/1992	1/9/2019	Chicago	Engineer	DevOps	13	67200	2500
191394	Monica	Williams	F	mwilliams@yahoo.com	841-96-0282	6/28/1984	6/21/2013	New York	Associate	Sales	0	115700	9200
191513	Cindy	Johnson	F	cjohnson@gmail.com	873-02-8057	8/27/1986	8/21/2010	New York	Associate	Marketing	3	122100	8900
192086	Becky	Stanton	F	bstanton@hotmail.com	634-36-6021	10/16/1961	10/6/2001	Austin	Senior Engineer	Product	15	93000	7700
192148	Angela	Moses	F	amoses@yahoo.com	430-11-8155	1/10/1991	1/5/2011	Seattle	Manager	Platform	17	135300	12000
192161	Taylor	Hayes	M	thayes@yahoo.com	318-42-5268	6/10/1998	6/5/2016	Austin	Engineer	Platform	10	88300	2700
192175	April	Parsons	F	aparsons@yahoo.com	056-62-2627	3/17/1976	3/10/2007	Chicago	Senior Engineer	Platform	10	110800	8100
192313	Victoria	Lopez	F	vlopez@gmail.com	493-78-6060	6/4/1990	5/30/2011	New York	Associate	Marketing	14	99400	8100
192410	Mark	Nichols	M	mnichols@gmail.com	446-03-3242	1/16/1992	1/9/2019	Chicago	Engineer	Product	13	81400	3000
192510	Jonathan	Gibson	M	jgibson@yahoo.com	826-13-1772	1/17/1986	1/9/2019	New York	Associate	Sales	3	85200	4500
192742	Mark	Alvarado	M	malvarado@hotmail.com	769-96-7608	12/20/1986	12/12/2018	Seattle	Engineer	Internal Tools	16	98000	6300
192830	Michael	Ross	M	mross@gmail.com	297-12-6988	1/15/1993	1/9/2019	New York	Associate	Sales	19	94500	6100
192996	James	Stewart	M	jstewart@yahoo.com	625-05-5969	2/28/1980	2/20/2010	New York	Associate	Sales	15	121000	11600
193073	Patricia	Davis	F	pdavis@gmail.com	464-74-2275	3/28/1993	3/22/2018	New York	Associate	Sales	18	100600	8200
193867	Diane	Strong	F	dstrong@hotmail.com	353-51-1061	2/26/1983	2/19/2012	Seattle	Senior Engineer	DevOps	12	132300	11100
194127	Ryan	Bond	M	rbond@yahoo.com	278-43-3152	4/3/1977	3/25/2015	Austin	Senior Engineer	Platform	8	96100	9700
194164	Tracy	Ali	F	tali@hotmail.com	481-15-3812	12/25/1997	12/20/2018	Austin	Engineer	Platform	7	85700	5200
194188	Erin	Lopez	F	elopez@hotmail.com	190-61-7746	6/20/1980	6/13/2010	Seattle	Manager	Platform	2	138100	12700
194505	Katie	Johnson	F	kjohnson@hotmail.com	335-84-3432	9/22/1980	9/14/2014	Seattle	Senior Engineer	Platform	17	124900	8900
