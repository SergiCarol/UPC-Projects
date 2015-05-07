-- 1: 

SELECT emp.emp_no , emp.cognom, dept.dept_no , dept.dnom FROM emp, dept;

-- 2:

SELECT dept.dept_no, dept.dnom, max(emp.salari) FROM dept LEFT JOIN emp ON dept.dept_no = emp.dept_no GROUP BY dept.dept_no, dnom;

-- 3:

SELECT emp.emp_no, emp.cognom, client.client_cod, client.nom FROM emp LEFT JOIN client ON emp.emp_no = client.repr_cod;

-- 4:

SELECT client.client_cod , client.nom , emp.emp_no, emp.cognom FROM client , emp WHERE emp.emp_no = client.repr_cod;

-- 5:

SELECT client.client_cod , client.nom, emp.emp_no, emp.cognom FROM client LEFT JOIN emp WHERE emp.emp_no = client.repr_cod UNION SELECT client.client_cod , client.nom , emp.emp_no , emp.cognom FROM client LEFT OUTER JOIN emp ON  emp.emp_no = client.repr_cod;

-- 6:

SELECT emp.emp_no , emp.cognom, dept.dept_no , dept.dnom FROM emp, dept;

-- 7:

SELECT dept.dept_no, dept.dnom, max(emp.salari) FROM dept LEFT JOIN emp ON dept.dept_no = emp.dept_no GROUP BY dept.dept_no, dnom;

-- 8:

SELECT e1.dept_no, e1.emp_no, e1.cognom, e1.salari FROM emp e1 WHERE e1.salari <= (SELECT avg(e2.salari) FROM emp e2 WHERE e2.dept_no = e1.dept_no);

-- 9:

SELECT e1.emp_no, e1.cognom FROM emp e1, emp e2 WHERE e1.ofici=e2.ofici AND e2.cognom="ALONSO";

-- 10:

SELECT E1.COGNOM, E1.OFICI, E2.OFICI FROM EMP E1, EMP E2, DEPT WHERE E1.DEPT_NO=20 AND E1.OFICI=E2.OFICI AND ;

-- 11:

SELECT E1.EMP_NO, E1.COGNOM FROM EMP E1, EMP E2 WHERE (E1.OFICI=E2.OFICI AND E2.COGNOM="JIMENEZ") OR (E1.SALARI>=E2.SALARI AND E2.COGNOM="FERNANDEZ");

-- 12:

SELECT EMP_NO, COGNOM, DEPT_NO FROM EMP WHERE OFICI="DIRECTOR" ORDER BY COGNOM;

-- 13:

SELECT DEPT_NO, SUM(SALARI) FROM EMP GROUP BY DEPT_NO ORDER BY SALARI DESC;

-- 14;

SELECT DEPT_NO FROM EMP GROUP BY DEPT_NO ORDER BY AVG(DATA_ALTA) ASC; 

-- 15:

SELECT e1.emp_no, e1.cognom, count(comanda.com_num) FROM emp e1, client c1 LEFT JOIN comanda ON (e1.emp_no==c1.repr_cod) AND (comanda.client_cod==c1.client_cod) GROUP BY e1.emp_no ORDER BY e1.cognom;

-- 16:

SELECT emp_no, cognom, count(comanda.com_num) FROM emp, comanda, client WHERE (emp_no==client.repr_cod) AND (comanda.client_cod==client.client_cod) GROUP BY emp_no HAVING com_num>5;

-- 17:

SELECT p1.prod_num, descripcio, com_data, preu_venda FROM producte p1 LEFT JOIN (detall d1 LEFT JOIN comanda c1 ON d1.com_num=c1.com_num) ON p1.prod_num=d1.prod_num WHERE NOT EXISTS (SELECT c2.com_data FROM comanda c2, detall d2, producte p2 WHERE c2.com_num=d2.com_num AND p2.prod_num=d2.prod_num AND p2.prod_num=p1.prod_num AND (c2.com_data>c1.com_data OR (c2.com_data=c1.com_data AND (c2.com_num>c1.com_num OR (c2.com_num=c1.com_num and d2.detall_num>d1.detall_num)))));

--18:

SELECT cl.client_cod, nom, limit_credit, SUM(total) FROM client cl, comanda co WHERE cl.client_cod = co.client_cod AND strftime('%Y', COM_DATA)='1987' GROUP BY cl.client_cod HAVING limit_credit* 50/100 < SUM(total);
