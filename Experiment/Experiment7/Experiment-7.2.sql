CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    amount NUMERIC(10,2)
);

INSERT INTO orders VALUES
(1, 5000),
(2, 15000),
(3, 8000),
(4, 25000),
(5, 12000);


DO $$
DECLARE
    order_cursor CURSOR FOR
        SELECT order_id, amount
        FROM orders;

    v_order_id INT;
    v_amount NUMERIC(10,2);

BEGIN
    OPEN order_cursor;

    LOOP
        FETCH order_cursor INTO v_order_id, v_amount;

        EXIT WHEN NOT FOUND;

        IF v_amount > 10000 THEN
            RAISE NOTICE 'Order ID: %, High Value', v_order_id;
        END IF;
    END LOOP;

    CLOSE order_cursor;
END $$;
