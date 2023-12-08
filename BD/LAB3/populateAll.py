import psycopg2 as psycopg2

import populateDepartments
import populateFaculties
import populateGroups
import populateStudents
import populateTuitions

conn = psycopg2.connect(database="bd_lab3",
                        user="postgres",
                        host='localhost',
                        password="150600Pm",
                        port=5432)

# populateFaculties.populate_faculties(10, conn)
# populateDepartments.populate_departments(10, conn, [i for i in range(1, 10)])
# populateGroups.populate_groups(1000, conn, [i for i in range(9, 18)])
# populateStudents.populate_students(1000000, conn)
# populateTuitions.populate_tuitions(10000000, conn, [i for i in range(1, 1000001)], [i for i in range(1, 1001)])
conn.close()
