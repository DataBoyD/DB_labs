![](lab-schema.png)


## SELECT queries

### Обычный запрос со всеми полями
```
select * from clients;

  id   | first_name | middle_name |  last_name  | phone_number | age 
-------+------------+-------------+-------------+--------------+-----
 36923 | Вольфганг  | Амадей      | Моцарт      | 123456       | 123
 36924 | Пётр       | Ильич       | Чайковский  | 123243434    |  99
 36925 | Сергей     |             | Рахманинов  | 323343534    | 108
 36926 | Мстислав   |             | Растропович | 4334353      |  90
 36922 | Дмитрий    | Алексеевич  | Сиднев      | 89176002912  |  21
```

### Запрос с простым условием

```
select * from clients where age = 21;

  id   | first_name | middle_name | last_name | phone_number | age 
-------+------------+-------------+-----------+--------------+-----
 36922 | Дмитрий    | Алексеевич  | Сиднев    | 89176002912  |  21
```
### Обычный запрос с группирующей функцией `сount(...)`


```
select count(id) from clients where age > 21;

 count 
-------
     4
```
### Запрос с `INNER JOIN`

```
select * from vouchers inner join airline_companies on vouchers.airline_company_id = airline_companies.id;

 id | country_id_in | country_id_out | client_id | firm_id | price  | status_id | date_start | date_finish | airline_company_id | id |       name       
----+---------------+----------------+-----------+---------+--------+-----------+------------+-------------+--------------------+----+------------------
  2 |             9 |              5 |     36923 |       9 |  12300 |         2 | 2022-09-17 | 2022-09-24  |                  2 |  2 | Turkish Airlines
  3 |             4 |              6 |     36924 |       8 |   8900 |         3 | 2022-10-12 | 2022-09-28  |                  2 |  2 | Turkish Airlines
  4 |             5 |              4 |     36922 |       9 | 120000 |         1 | 2022-10-01 |             |                  4 |  4 | Аэрофлот

```

### Запрос с  несколькими `INNER JOIN`

```
 select
 client_id, airline_company_id
 from vouchers inner
 join airline_companies
 on vouchers.airline_company_id = airline_companies.id
 inner join clients
 on vouchers.client_id = clients.id;

 client_id | airline_company_id 
-----------+--------------------
     36923 |                  2
     36924 |                  2
     36922 |                  4
```







