select * from konyvtar.konyv
where konyv_azon not in (select konyv_azon from konyvtar.konyvtari_konyv);

select * from konyvtar.tag
where olvasojegyszam not in
(select tag_azon from konyvtar.kolcsonzes);

select * from konyvtar.tag join konyvtar.kolcsonzes
on olvasojegyszam = tag_azon;

select * from konyvtar.tag left join konyvtar.kolcsonzes
on olvasojegyszam = tag_azon;
 
select * from konyvtar.tag left join konyvtar.kolcsonzes
on olvasojegyszam = tag_azon
where tag_azon is null;

select * from konyvtar.konyv kv
where not exists (select * from konyvtar.konyvtari_konyv kk where kv.konyv_azon = kk.konyv_azon);

select * from konyvtar.tag t
where not exists (select * from konyvtar.kolcsonzes k where t.olvasojegyszam = k.tag_azon);

select * from konyvtar.konyv left join konyvtar.konyvtari_konyv
using(konyv_azon)
where leltari_szam is null
order by konyvtari_konyv.ertek nulls first;

select vezeteknev || ' ' || keresztnev,leltari_szam from konyvtar.tag tg left join konyvtar.kolcsonzes ks
on tg.olvasojegyszam = ks.tag_azon
where tg.besorolas = 'nyugdíjas' and ks.tag_azon is not null;

select sz.vezeteknev || ' ' || sz.keresztnev,konyv_azon from konyvtar.szerzo sz left join konyvtar.konyvszerzo ksz
using(szerzo_azon)
order by sz.vezeteknev || ' ' || sz.keresztnev,konyv_azon,konyv_azon;

select sz.vezeteknev || ' ' || sz.keresztnev,count(konyv_azon) from konyvtar.szerzo sz left join konyvtar.konyvszerzo ksz
using(szerzo_azon)
group by sz.vezeteknev || ' ' || sz.keresztnev
order by count(konyv_azon) desc,sz.vezeteknev || ' ' || sz.keresztnev;

select avg(nvl(ertek,0)) átlag from konyvtar.konyv left join KONYVTAR.konyvtari_konyv
using(konyv_azon)
where tema = 'sci-fi'
group by tema;

select olvasojegyszam,vezeteknev || ' ' || keresztnev,count(hany_napra) 
from konyvtar.tag left join konyvtar.kolcsonzes
on olvasojegyszam = tag_azon
group by olvasojegyszam,vezeteknev || ' ' || keresztnev
having count(hany_napra) != 0
order by count(nvl(hany_napra,0));

select * from konyvtar.kolcsonzes;

select * from konyvtar.konyvtari_konyv left join konyvtar.kolcsonzes
using(leltari_szam) left join konyvtar.tag
on olvasojegyszam = tag_azon
where ertek > 1000 and olvasojegyszam is not null;

select tg.vezeteknev || ' ' || tg.keresztnev,kv.cim,trunc(ertek) from konyvtar.konyv kv left join konyvtar.konyvtari_konyv
using(konyv_azon) left join konyvtar.kolcsonzes using(leltari_szam)
join konyvtar.tag tg on tag_azon=olvasojegyszam
where nvl(ertek,0) > 1000 and kolcsonzesi_datum is not null;









select szerzo_azon,vezeteknev,keresztnev,count(konyv_azon)from konyvtar.szerzo 
left join konyvtar.konyvszerzo using(szerzo_azon)
group by szerzo_azon,vezeteknev,keresztnev
having count(konyv_azon)<5;