import random
import time


def str_time_prop(start, end, time_format, prop=0.5):
    """Get a time at a proportion of a range of two formatted times.

    start and end should be strings specifying times formatted in the
    given format (strftime-style), giving an interval [start, end].
    prop specifies how a proportion of the interval to be taken after
    start.  The returned time will be in the specified format.
    """

    stime = time.mktime(time.strptime(start, time_format))
    etime = time.mktime(time.strptime(end, time_format))

    ptime = stime + prop * (etime - stime)

    return time.strftime(time_format, time.localtime(ptime))


def random_date(start, end, prop):
    return str_time_prop(start, end, '%Y-%m-%d', prop)

for i in range(1, 1001):
    name = f'Name{i}'
    city = f'City{i % 50}'
    date_of_birth = random_date("2000-1-1", "2004-12-31", random.random())
    year_of_enrollment = random.randint(2019, 2023)
    print(f'(\'{name}\', \'{city}\', \'{date_of_birth}\', {str(year_of_enrollment)}),')
