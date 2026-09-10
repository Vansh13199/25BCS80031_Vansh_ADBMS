CREATE TABLE STAFF (
    EMP_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    SALARY NUMERIC(10,2)
);


INSERT INTO STAFF VALUES
(1, 'Rahul', 50000),
(2, 'Amit', 80000),
(3, 'Priya', 95000),
(4, 'Neha', 70000),
(5, 'Ravi', 120000),
(6, 'Karan', 60000),
(7, 'Simran', 110000);


DO $$
DECLARE
    emp_cursor CURSOR FOR
        SELECT name, salary
        FROM staff
        ORDER BY salary DESC;

    v_name staff.name%TYPE;
    v_salary staff.salary%TYPE;
    v_count INT := 0;

BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_name, v_salary;

        EXIT WHEN NOT FOUND OR v_count = 5;

        RAISE NOTICE 'Name: %, Salary: %', v_name, v_salary;

        v_count := v_count + 1;
    END LOOP;

    CLOSE emp_cursor;
END $$;
