SELECT
    trunc(months_between(sysdate,szuletesi_datum)/12) eletkor
FROM
    konyvtar.tag
    order by eletkor;
    
    --Azon tagok nevei,�letkora,sz�let�si d�tuma, akik legal�bb 30 �vesek. Rendezz�k els�sorban �letkor
    --majd n�v szerint
    
    select keresztnev || ' ' || vezeteknev nev,szuletesi_datum,
    trunc(months_between(sysdate,szuletesi_datum)/12) eletkor
        from konyvtar.tag
    where trunc(months_between(sysdate,szuletesi_datum)/12) > 30
    order by eletkor,nev;
    
    select * from konyvtar.konyv
    order by kiado nulls first;
    
    select length(sysdate) from dual;
    
    select * from konyvtar.konyv
    where ar between 2000 and 3000;
    
    select * from konyvtar.konyv
    where tema in ('horror','sci-fi','t�rt�nelem');
    
    --Azon k�nyvek �ra,kiad�si d�tuma,c�me,t�m�ja,oldalsz�ma amely k�nyvek 1990 �s 2000 k�z�tt
    --ker�ltek kiad�sra vagy a k�nyv �ra 1000 �s 3000 k�z�tt van vagy 20 oldaln�l r�videbb sci-fik
    --T�ma szerint cs�kken�.Egyez�s eset�n oldalsz�m szerint n�vekv�
    
    select ar,to_char(kiadas_datuma,'ds'),cim,oldalszam,tema from konyvtar.konyv
    where (to_char(kiadas_datuma,'yyyy') between 1990 and 2000) or (oldalszam < 20 and tema = 'sci-fi') or
    ar between 1000 and 3000
    order by tema desc,oldalszam;
    
    select isbn,cim,to_char(kiadas_datuma,'ds')
    from konyvtar.konyv
    where (cim like 'A%' and tema in ('horror','sci-fi')) or
    (tema is null) or (months_between(sysdate,kiadas_datuma)/12) <= 10;
    
    --Azok a k�nyvek amelyeknek c�m�ben szerepel az a_a vagy a_� r�szstring.
    --Csak c�m �s rendezz�k cs�kken� sorrendbe.
    
    select cim from konyvtar.konyv
    where cim like '%a_a%' or cim like '%a_�%';