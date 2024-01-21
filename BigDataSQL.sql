"Дана таблица:
 assessment (data DATE, fio TEXT, subj TEXT, assessment INTEGER);
Вывести список всех учеников, а также рассчитать для каждого количество троек, четверок и пятерок за январь 2023 года. Получить таблицу вида:

ФИО кол-во троек кол-во четверок кол-во пятёрок Иванов 1 0 2 Петров 1 2 0 Сидоров 1 1 0
"
  
select fio, 
count(case when assessment = 3 then 1 end) as "кол-во троек",
count(case when assessment = 5 then 1 end) as "кол-во четверок",
count(case when assessment = 5 then 1 end) as "кол-во пятерок"
from assessment 
where data between '2023-01-01' and '2023-01-31'
group by fio


"Дана таблица:
 students (id INTEGER PRIMARY KEY, first_name TEXT NOT NULL,
 last_name TEXT NOT NULL, email TEXT NOT NULL UNIQUE,
 phone TEXT NOT NULL UNIQUE, salary INTEGER NOT NULL);
Нужно найти всех студентов, которые среди своих однофамильцев имеют максимальную стипендию. Итоговая выборка должна содержать id, first_name, last_name и salary студента.
"
select id, first_name, last_name, salary
from students
where (last_name, salary) in (
	select last_name, max(salary)
	from students
	group by last_name
)
