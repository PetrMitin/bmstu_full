def populate_faculties(amount, conn):
    cur = conn.cursor()
    for i in range(amount):
        query = f'INSERT INTO public.faculties (name, short_name, dean) VALUES (\'Faculty {i}\', \'Fac{i}\', \'Dean{i}\');'
        cur.execute(query)
    conn.commit()
    cur.close()

