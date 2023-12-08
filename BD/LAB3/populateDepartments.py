from random import randint


def populate_departments(amount, conn, fac_ids):
    cur = conn.cursor()
    for i in range(amount):
        faculty_id = fac_ids[randint(0, len(fac_ids) - 1)]
        query = f'INSERT INTO departments (faculty_id, name, short_name, head) VALUES ({faculty_id}, \'Name{i}\', \'SN{i}\', \'Head{i}\');'
        cur.execute(query)
    conn.commit()
    cur.close()