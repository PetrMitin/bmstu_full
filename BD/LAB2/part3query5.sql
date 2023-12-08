update tuitions
set scholarship_amount = 3000
where scholarship_amount::numeric::int < 3000;