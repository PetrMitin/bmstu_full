import time
from random import random, randint, choice
import string

def str_time_prop(start, end, time_format, prop=0.5):
    stime = time.mktime(time.strptime(start, time_format))
    etime = time.mktime(time.strptime(end, time_format))
    ptime = stime + prop * (etime - stime)
    return time.strftime(time_format, time.localtime(ptime))


def random_date(start, end, prop):
    return str_time_prop(start, end, '%Y-%m-%d', prop)

def populate_students(amount, conn):
    cur = conn.cursor()
    for i in range(amount):
        citizenships = "ARRAY['Russia', 'Somalia']" if i % 1000 == 0 else "ARRAY['Russia']"
        parents = '\'{ "mother": "Mom' + str(i) + '", "father": "Dad' + str(i) + '" }\''
        motivational_letter = "'" + ''.join(choice(string.ascii_letters) for i in range(256)) + "'"
        query = f"""
                INSERT INTO students 
                    (name, city, date_of_birth, year_of_enrollment, citizenships, parents, motivational_letter) 
                VALUES ('Name{i}', 'City{i}', '{random_date("2000-1-1", "2004-12-31", random())}', {randint(2019, 2023)},
                {citizenships}, {parents}, {motivational_letter});"""
        cur.execute(query)
    conn.commit()
    cur.close()