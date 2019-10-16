select olvasojegyszam,vezeteknev || ' ' || keresztnev nev,
trunc(months_between(sysdate,szuletesi_datum)/12) kor
from konyvtar.tag
where (vezeteknev || ' ' || keresztnev like '%a%a%') 
and szuletesi_datum between to_date(1990,'yyyy') and to_date(2000,'yyyy');

select * from konyvtar.tag;
select min(ar) from konyvtar.konyv;

select kiado,tema,count(*) from konyvtar.konyv
where oldalszam <= 100
group by kiado,tema;

select extract(year from szuletesi_datum),count(*) from konyvtar.tag
group by extract(year from szuletesi_datum);

select szerzo_azon,trunc(sum(honorarium)) from konyvtar.konyvszerzo
group by szerzo_azon
having sum(honorarium) > 400000
order by sum(honorarium) desc;

select extract(year from szuletesi_datum),count(*) from konyvtar.tag
where nem ='n'
group by extract(year from szuletesi_datum)
having count(*) >= 2
order by extract(year from szuletesi_datum);

select substr('almafa',2,2) from dual;

select * from konyvtar.tag
where substr(cim,1,4) = '4032';

select * from konyvtar.tag;

select substr(vezeteknev,1,1) || '.' ||substr(vezeteknev,1,1) || '.' from konyvtar.tag
where vezeteknev like 'A%' 
or (substr(cim,1,4) = '1234') 
or (months_between(sysdate,beiratkozasi_datum)/12 > 1) 
or tagdij between 1000 and 3000;

select kiado,count(*) from konyvtar.konyv
group by kiado
having count(*) = (select max(count(*)) from konyvtar.konyv
                    group by kiado);




