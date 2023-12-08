from random import randint

def populate_groups(amount, conn, dep_ids):
    cur = conn.cursor()
    for i in range(amount):
        dep_id = dep_ids[randint(0, len(dep_ids) - 1)]
        query = f"""
                    INSERT INTO groups (department_id, name, field_of_study) 
                    VALUES ({dep_id}, \'Name{i}\', 'Field of study {i}');"""
        cur.execute(query)
    conn.commit()
    cur.close()