from random import randint


def populate_tuitions(amount, conn, stud_ids, group_ids):
    cur = conn.cursor()
    for i in range(amount):
        if i % 10000 == 0:
            print(i)
        student_id = stud_ids[randint(0, len(stud_ids) - 1)]
        group_id = group_ids[randint(0, len(group_ids) - 1)]
        query = f"""
                INSERT INTO tuitions (student_id, group_id, scholarship_amount, year, semester) 
                VALUES ({student_id}, {group_id}, {randint(0, 3000)}, {randint(1, 6)}, {randint(1, 12)});"""
        cur.execute(query)
    conn.commit()
    cur.close()