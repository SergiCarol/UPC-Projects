
==========
PRÀCTICA 4
==========


:Autors: Sergi Carol Bosch i Enric Lenard Uró
:Data: 07/05/2015

TASCA 1
-------
Finalitzar les consultes 7 i 8 del model de sensors de la practica 3.

7) Write a query that produces a temperature reading for each of the three sensors during any epoch in which any sensor produced a reading. If a sensor is missing a value during a given epoch, your result should report the value of this sensor as the most recent previously reported value. If there is no such value (e.g., the first value for a particular sensor is missing), you should return the special value 'null'. You may wisH to read about the CASE and OUTER JOIN SQL statements.

.. code-block:: sql

   SELECT S1.TEMP, S2.TEMP, S3.TEMP
   FROM SENSORS S1, SENSORS S2, SENSORS S3
   WHERE S1.NODEID=1 AND S2.NODEID=2 AND S3.NODEID=3
	AND (S1.EPOCH==S2.EPOCH) AND (S1.EPOCH==S3.EPOCH)
	AND (S2.EPOCH==S3.EPOCH);
   
   26|0|-2
   26|0|-2
   26|0|-2
   12|5|0
   12|5|0
   12|5|0
   38|10|2
   15|11|4
   0|12|10
   27|10|12
   27|13|12
   27|15|12
   27|20|12
   27|40|12
   20|14|13
   12|15|14
   12|15|15

8) Write a query that determines epochs during which all three sensors did not return any results. Note that this is a deceptively hard query to write you may need to make some assumptions about the frequency of missing epochs.

.. code-block:: sql
	
  SELECT EPOCH-I
  FROM SENSORS, (SELECT 1 AS I UNION SELECT 2 AS I UNION SELECT 3
	AS I UNION SELECT 4 AS I)
	AS T WHERE EPOCH-I > (SELECT MIN(EPOCH)
	FROM SENSORS) EXCEPT SELECT EPOCH FROM SENSORS;

  649
  650
  651
  652
  679
  680
  681
  682
  708
  709
  710
  711
  713
  714
  721
  722
  723
  724
  726
  728
  730
  731
  733

TASCA 2
-------
Donades les seguents relacions, es demana que responeu correctament les seguents consultes SQL.

1) Eliminar els productes sense stock.

.. code-block:: sql

   DELETE FROM PRODUCTES WHERE ESTOC = NULL;
 
2) Modificar els tres primers clients de la base de dades, que rebran una bonificacio de l'1.5 per cent en les seves compres.

.. code-block:: sql

   UPDATE CLIENTS SET DESCOMPTE = 1.5 LIMIT 3;
   
3) Obtenir el llistat de monitors que hi ha en estoc.

.. code-block:: sql
		
   SELECT CODI FROM PRODUCTES
   WHERE DESCRIPCIO LIKE "%MONITOR%" AND ESTOC > 0;
   
4) Obtenir el llistat dels punts de venta assignats als venedors amb edat compresa entre 21 i 26 anys, ordenant la sortida per l’edat dels venedors.

.. code-block:: sql
		
   SELECT CODICENTRE FROM VENEDORS
   WHERE EDAT BETWEEN 21 AND 26 ORDER BY EDAT;

5) Obtenir l’import total de les compres fetes per cada client l’any 2002, considerant el descompte.

.. code-block:: sql 
		
   SELECT A.NIF,SUM(B.UNITATS*(C.PREU-(C.PREU*A.DESCOMPTE)))
		AS IMPORT_AMB_DESCOMPTE
   FROM CLIENTS A, COMANDES B, PRODUCTES C
   WHERE (A.NIF=B.NIF) AND (B.CODIPRODUCTE=C.CODI)
		AND YEAR (B.DATA)=2002
   GROUP BY A.NIF

6) Obtenir la llista dels deu primers venedors de la BD amb el total d’unitats venudes, fins i tot per a aquells venedors que no van tenir cap comanda.

.. code-block:: sql 

   SELECT VENEDORS.NOM, SUM(COMANDES.UNITATS)
		AS TOT_UNITATS_VENUDES
   FROM VENEDORS
   LEFT JOIN COMANDES ON (VENEDORS.CODI=COMANDES.CODIVENEDOR)
   GROUP BY VENEDORS.CODI LIMIT 10;

7) Obtenir el llistat de productes inactius (no apareixen en comandes).

.. code-block:: sql 

   SELECT PRODUCTES.CODI, PRODUCTES.DESCRIPCIÓ
   FROM PRODUCTES
   LEFT JOIN COMANDES ON (PRODUCTES.CODI=COMANDES.CODIPRODUCTE)
   WHERE COMANDES.CODIPRODUCTE IS NULL;

TASCA 3
-------

1) Mostrar els empleats (codi i cognom) juntament amb el codi i nom del departament al qual pertanyen.

.. code-block:: sql

   SELECT EMP.EMP_NO , EMP.COGNOM, DEPT.DEPT_NO , DEPT.DNOM
   FROM EMP, DEPT
   WHERE EMP.DEPT_NO=DEPT.DEPT_NO;

   7369|SANCHEZ|20|INVESTIGACIO
   7499|ARROYO|30|VENDES
   7521|SALA|30|VENDES
   7566|JIMENEZ|20|INVESTIGACIO
   7654|MARTIN|30|VENDES
   7698|NEGRO|30|VENDES
   7782|CEREZO|10|COMPTABILITAT
   7788|GIL|20|INVESTIGACIO
   7839|REY|10|COMPTABILITAT
   7844|TOVAR|30|VENDES
   7876|ALONSO|20|INVESTIGACIO
   7900|JIMENO|30|VENDES
   7902|FERNANDEZ|20|INVESTIGACIO
   7934|MUNOZ|10|COMPTABILITAT

2) Mostrar tots els departaments (codi i descripcio) acompanyats del salari mes alt dels seus empleats.

.. code-block:: sql

   SELECT DEPT.DEPT_NO, DEPT.DNOM, MAX(EMP.SALARI)
   FROM DEPT LEFT JOIN EMP ON DEPT.DEPT_NO = EMP.DEPT_NO
   GROUP BY DEPT.DEPT_NO, DNOM;
   
   10|COMPTABILITAT|650000
   20|INVESTIGACIO|390000
   40|PRODUCCIO|
   30|VENDES|370500

3) Mostrar, en l'esquema empresa, tots els empleats acompanyats dels clients de qui son representants.

.. code-block:: sql

   SELECT EMP.EMP_NO, EMP.COGNOM, CLIENT.CLIENT_COD, CLIENT.NOM
   FROM EMP LEFT JOIN CLIENT ON EMP.EMP_NO = CLIENT.REPR_COD;
		
   7369|SANCHEZ||
   7499|ARROYO|104|EVERY MOUNTAIN
   7499|ARROYO|107|WOMEN SPORTS
   7521|SALA|101|TKB SPORT SHOP
   7521|SALA|103|JUST TENNIS
   7521|SALA|106|SHAPE UP
   7566|JIMENEZ||
   7654|MARTIN|102|VOLLYRITE
   7698|NEGRO||
   7782|CEREZO||
   7788|GIL||
   7839|REY||
   7844|TOVAR|100|JOCKSPORTS
   7844|TOVAR|105|K + T SPORTS
   7844|TOVAR|108|NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER
   7876|ALONSO||
   7900|JIMENO||
   7902|FERNANDEZ||
   7934|MUNOZ||

4) Mostrar tots els clients acompanyats de l'empleat que tenen com a representant.

.. code-block:: sql

   SELECT CLIENT.CLIENT_COD , CLIENT.NOM , EMP.EMP_NO, EMP.COGNOM
   FROM CLIENT , EMP
   WHERE EMP.EMP_NO = CLIENT.REPR_COD;

   100|JOCKSPORTS|7844|TOVAR
   101|TKB SPORT SHOP|7521|SALA
   102|VOLLYRITE|7654|MARTIN
   103|JUST TENNIS|7521|SALA
   104|EVERY MOUNTAIN|7499|ARROYO
   105|K + T SPORTS|7844|TOVAR
   106|SHAPE UP|7521|SALA
   107|WOMEN SPORTS|7499|ARROYO
   108|NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER|7844|TOVAR

5) Mostrar tots els clients i tots els empleats relacionant cada client amb el seu representant (i, de retruc, cada empleat amb els seus clients).

.. code-block:: sql

   SELECT CLIENT.CLIENT_COD , CLIENT.NOM, EMP.EMP_NO,
	EMP.COGNOM FROM CLIENT
   LEFT JOIN EMP
   WHERE EMP.EMP_NO = CLIENT.REPR_COD UNION
	SELECT CLIENT.CLIENT_COD , CLIENT.NOM ,
	       EMP.EMP_NO , EMP.COGNOM
	FROM CLIENT
	LEFT OUTER JOIN EMP ON  EMP.EMP_NO = CLIENT.REPR_COD;

   100|JOCKSPORTS|7844|TOVAR
   101|TKB SPORT SHOP|7521|SALA
   102|VOLLYRITE|7654|MARTIN
   103|JUST TENNIS|7521|SALA
   104|EVERY MOUNTAIN|7499|ARROYO
   105|K + T SPORTS|7844|TOVAR
   106|SHAPE UP|7521|SALA
   107|WOMEN SPORTS|7499|ARROYO
   108|NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER|7844|TOVAR
   109|SPRINGFIELD NUCLEAR POWER PLANT||

6) Mostrar els empleats (codi i cognom) juntament amb el codi i nom del departament al qual pertanyen.

.. code-block:: sql

   SELECT EMP.EMP_NO , EMP.COGNOM, DEPT.DEPT_NO , DEPT.DNOM
   FROM EMP, DEPT;
   WHERE EMP.DEPT_NO=DEPT.DEPT_NO;

   7369|SANCHEZ|20|INVESTIGACIO
   7499|ARROYO|30|VENDES
   7521|SALA|30|VENDES
   7566|JIMENEZ|20|INVESTIGACIO
   7654|MARTIN|30|VENDES
   7698|NEGRO|30|VENDES
   7782|CEREZO|10|COMPTABILITAT
   7788|GIL|20|INVESTIGACIO
   7839|REY|10|COMPTABILITAT
   7844|TOVAR|30|VENDES
   7876|ALONSO|20|INVESTIGACIO
   7900|JIMENO|30|VENDES
   7902|FERNANDEZ|20|INVESTIGACIO
   7934|MUNOZ|10|COMPTABILITAT

7) Mostrar tots els departaments (codi i descripcio) acompanyats del salari mes alt dels seus empleats.

.. code-block:: sql

   SELECT DEPT.DEPT_NO, DEPT.DNOM, MAX(EMP.SALARI)
   FROM DEPT LEFT JOIN EMP ON DEPT.DEPT_NO = EMP.DEPT_NO
   GROUP BY DEPT.DEPT_NO, DNOM;

   10|COMPTABILITAT|650000
   20|INVESTIGACIO|390000
   40|PRODUCCIO|
   30|VENDES|370500

8) Mostrar els empleats de cada departament que tenen un salari menor que el salari mitja del mateix departament.

.. code-block:: sql

  SELECT E1.DEPT_NO, E1.EMP_NO, E1.COGNOM, E1.SALARI
  FROM EMP E1
  WHERE E1.SALARI <= (SELECT AVG(E2.SALARI)
		      FROM EMP E2
		      WHERE E2.DEPT_NO = E1.DEPT_NO);

  20|7369|SANCHEZ|104000
  30|7521|SALA|162500
  30|7654|MARTIN|162500
  10|7782|CEREZO|318500
  30|7844|TOVAR|195000
  20|7876|ALONSO|143000
  30|7900|JIMENO|123500
  10|7934|MUNOZ|169000

9) Mostrar els empleats que tenen el mateix ofici que l'ofici que t e l'empleat de cognom ALONSO.

.. code-block:: sql

   SELECT E1.EMP_NO, E1.COGNOM
   FROM EMP E1, EMP E2
   WHERE E1.OFICI=E2.OFICI AND E2.COGNOM="ALONSO"
	AND E1.COGNOM!="ALONSO";

   7369|SANCHEZ
   7900|JIMENO
   7934|MUNOZ


10) Mostrar els noms i oficis dels empleats del departament 20 la feina dels quals coincideixi amb la d'algun empleat del departament de 'VENDES'.

.. code-block:: sql

   SELECT E1.COGNOM, E1.OFICI, E2.OFICI
   FROM EMP E1, EMP E2, DEPT D1
   WHERE E1.DEPT_NO=20 AND E1.OFICI=E2.OFICI
	AND D1.DNOM="VENDES" AND E2.DEPT_NO=D1.DEPT_NO;

   ALONSO|EMPLEAT|EMPLEAT
   JIMENEZ|DIRECTOR|DIRECTOR
   ALONSO|EMPLEAT|EMPLEAT

11) Mostrar els empleats que efectuin la mateixa feina que JIMENEZ o que tinguin un salari igual o superior al de FERNANDEZ.

.. code-block:: sql

   SELECT E1.EMP_NO, E1.COGNOM
   FROM EMP E1, EMP E2
   WHERE (E1.OFICI=E2.OFICI AND E2.COGNOM="JIMENEZ")
	OR (E1.SALARI>=E2.SALARI AND E2.COGNOM="FERNANDEZ");

   7566|JIMENEZ
   7698|NEGRO
   7782|CEREZO
   7788|GIL
   7839|REY
   7902|FERNANDEZ


12) Mostrar els empleats (codi, cognom i nom del departament) de l'empresa que tenen el rang de director i ordenats pel cognom.

.. code-block:: sql

   SELECT EMP_NO, COGNOM, DEPT_NO
   FROM EMP
   WHERE OFICI="DIRECTOR" ORDER BY COGNOM;

   7782|CEREZO|10
   7566|JIMENEZ|20
   7698|NEGRO|30

13) Mostrar l'import global que cada departament assumeix anualment en concepte de nomina dels empleats i ordenat descendentment per l'import global.

.. code-block:: sql

   SELECT DEPT_NO, SUM(SALARI)
   FROM EMP GROUP BY DEPT_NO
   ORDER BY SALARI DESC;

   20|1413750
   10|1137500
   30|1222000

14) Mostrar els departaments ordenats ascendentment per l'antiguitat dels empleats.

.. code-block:: sql

   SELECT DEPT_NO
   FROM EMP GROUP BY DEPT_NO
   ORDER BY AVG(DATA_ALTA) ASC;

   20
   30
   10


15) Mostrar els empleats (codi i cognom) acompanyats del nombre de comandes que han gestionat, ordenats pel cognom. Cal incloure els empleats que no hagin pogut gestionar cap comanda.

.. code-block:: sql

   SELECT E1.EMP_NO, E1.COGNOM, COUNT(COMANDA.COM_NUM)
   FROM EMP E1, CLIENT C1 LEFT JOIN COMANDA
	ON (E1.EMP_NO==C1.REPR_COD)
	AND (COMANDA.CLIENT_COD==C1.CLIENT_COD)
   GROUP BY E1.EMP_NO
   ORDER BY E1.COGNOM;

   7876|ALONSO|0
   7499|ARROYO|6
   7782|CEREZO|0
   7902|FERNANDEZ|0
   7788|GIL|0
   7566|JIMENEZ|0
   7900|JIMENO|0
   7654|MARTIN|5
   7934|MUNOZ|0
   7698|NEGRO|0
   7839|REY|0
   7521|SALA|5
   7369|SANCHEZ|0
   7844|TOVAR|5

16) Mostrar el ranquing dels empleats (codi i cognom), segons el nombre de comandes que han gestionat, que n'hagin gestionat mes de cinc.

.. code-block:: sql

   SELECT EMP_NO, COGNOM, COUNT(COMANDA.COM_NUM)
   FROM EMP, COMANDA, CLIENT
   WHERE (EMP_NO==CLIENT.REPR_COD)
	AND (COMANDA.CLIENT_COD==CLIENT.CLIENT_COD)
   GROUP BY EMP_NO
   HAVING COM_NUM>5;

   7499|ARROYO|6
   7521|SALA|5
   7654|MARTIN|5
   7844|TOVAR|5

17) Mostrar, en l'esquema Empresa, una relacio de tots els productes amb el preu i la data de la darrera venda. Considereu que per a cada producte, la venda de la linia de la comanda per a la qual no hi ha cap altra comanda amb data posterior o, en cas de coincid`encia de
data, amb numero de comanda mes alt o, en cas de coincidencia de numero de comanda, amb numero de linia de detall mes alt.

.. code-block:: sql

   SELECT P1.PROD_NUM, DESCRIPCIO, COM_DATA, PREU_VENDA
   FROM PRODUCTE P1
   LEFT JOIN (DETALL D1 LEFT JOIN COMANDA C1 ON
	D1.COM_NUM=C1.COM_NUM) ON P1.PROD_NUM=D1.PROD_NUM
	WHERE NOT EXISTS (SELECT C2.COM_DATA
		FROM COMANDA C2, DETALL D2, PRODUCTE P2
		WHERE C2.COM_NUM=D2.COM_NUM
   AND P2.PROD_NUM=D2.PROD_NUM AND P2.PROD_NUM=P1.PROD_NUM
   AND (C2.COM_DATA>C1.COM_DATA OR (C2.COM_DATA=C1.COM_DATA
   AND (C2.COM_NUM>C1.COM_NUM OR (C2.COM_NUM=C1.COM_NUM
   AND D2.DETALL_NUM>D1.DETALL_NUM)))));

   100860|ACE TENNIS RACKET I|1987-03-12|35
   100861|ACE TENNIS RACKET II|1987-03-15|45
   100870|ACE TENNIS BALLS-3 PACK|1987-03-15|2.8
   100871|ACE TENNIS BALLS-6 PACK|1987-02-22|5.6
   100890|ACE TENNIS NET|1987-02-05|58
   101860|SP TENNIS RACKET|1987-02-05|24
   101863|SP JUNIOR RACKET|1987-02-05|12.5
   102130|RH: "GUIDE TO TENNIS"|1987-03-12|3.4
   200376|SB ENERGY BAR-6 PACK|1987-03-12|2.4
   200380|SB VITA SNACK-6 PACK|1987-02-22|4

18) Mostrar, en l’esquema Empresa, la relacio de clients que l'any 1987 van efectuar comandes per un import total que supera el 50 per cent del seu credit.

.. code-block:: sql

   SELECT CL.CLIENT_COD, NOM, LIMIT_CREDIT, SUM(TOTAL)
   FROM CLIENT CL, COMANDA CO
   WHERE CL.CLIENT_COD = CO.CLIENT_COD
	AND STRFTIME('%Y', COM_DATA)='1987'
   GROUP BY CL.CLIENT_COD
   HAVING LIMIT_CREDIT* 50/100 < SUM(TOTAL);

   100|JOCKSPORTS|5000|5180
   102|VOLLYRITE|7000|27495.5
   104|EVERY MOUNTAIN|10000|53490
   108|NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER|8000|6400
