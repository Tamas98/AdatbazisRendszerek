select * from konyvtar.konyv
where isbn like '%89%' or 
(months_between(sysdate,kiadas_datuma)/12 between 1 and 5)
or substr(cim,1,1) = 'A';

select distinct substr(kiado,1,instr(kiado,' '))
from konyvtar.konyv;

select substr(cim,6,instr(cim,',')-6),count(*)
from konyvtar.tag
group by substr(cim,6,instr(cim,',')-6);

select * from konyvtar.konyv,KONYVTAR.konyvtari_konyv
where konyvtar.konyv.konyv_azon = konyvtar.konyvtari_konyv.konyv_azon;

select * from konyvtar.konyv K join konyvtar.konyvtari_konyv KK
using(konyv_azon);

select cim,tema,leltari_szam,ertek from konyvtar.konyv K natural join konyvtar.konyvtari_konyv KK
where cim ='Tíz kicsi néger';

select vezeteknev || ' ' || keresztnev,
sum(honorarium) 
from konyvtar.szerzo natural join
konyvtar.konyvszerzo
where vezeteknev || ' ' || keresztnev = 'Frei Tamás'
group by vezeteknev || ' ' || keresztnev;

select vezeteknev || ' ' || keresztnev from
konyvtar.konyv natural join konyvtar.konyvszerzo
natural join konyvtar.szerzo
where cim ='Tíz kicsi néger';

select konyv_azon from konyvtar.tag T 
join konyvtar.kolcsonzes K
on T.olvasojegyszam = K.tag_azon 
join konyvtar.konyvtari_konyv KK
on K.leltari_szam = KK.leltari_szam
where K.visszahozasi_datum is null
and T.besorolas ='diák';


select tema from konyvtar.tag 
join konyvtar.kolcsonzes
on olvasojegyszam = tag_azon 
join konyvtar.konyvtari_konyv
using(leltari_szam) join konyvtar.konyv
using(konyv_azon)
where vezeteknev || ' ' || keresztnev = 'Vak Ond'
group by tema
order by tema desc;

select szerzo_azon,vezeteknev || ' ' || keresztnev,sum(ar)
from konyvtar.szerzo
natural join konyvtar.konyvszerzo 
join konyvtar.konyv
using(konyv_azon)
group by szerzo_azon,vezeteknev || ' ' || keresztnev;





select konyv_azon,count(kolcsonzesi_datum) from konyvtar.konyv join konyvtar.konyvtari_konyv
using(konyv_azon) join konyvtar.kolcsonzes
using(leltari_szam)
where ar > ertek 
group by konyv_azon
order by count(kolcsonzesi_datum) desc