-- Запрос на поиск пересечения отпусков сотрудников в 2020 году
select
	e.Code as 'КодСотрудника1'
	, v.DateBegin as 'НачалоОтпуска'
	, v.DateEnd as 'КонецОтпуска'
	, e_copy.Code as 'КодСотрудника2'
	, v_copy.DateBegin as 'НачалоОтпуска'
	, v_copy.DateEnd as 'КонецОтпуска'
from Vacation as v
	inner join Vacation as v_copy on v_copy.DateEnd >= v.DateBegin
		and v_copy.DateBegin <= v.DateEnd
		and v_copy.ID_Employee > v.ID_Employee
	inner join Employee as e on e.id = v.ID_Employee
	inner join Employee as e_copy on e_copy.id = v_copy.ID_Employee
-- Условие, что отпуск обоих сотрудиков попадает в 2020 год
where v.DateBegin <= '31.12.2020'
	and v.DateEnd >= '01.01.2020'
    and v_copy.DateBegin <= '31.12.2020'
    and v_copy.DateEnd >= '01.01.2020'
            