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

-- 8: no l'he probat perque petava wtf

SELECT e1.dept_no, e1.emp_no, e1.cognom, e1.salari FROM emp e1 WHERE e1.salari >= (SELECT (avg(e2.salari) FROM emp e2 WHERE e2.dept_no = e1.dept_no);

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




