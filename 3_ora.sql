SELECT
    trunc(months_between(sysdate,szuletesi_datum)/12) eletkor
FROM
    konyvtar.tag
    order by eletkor;
    
    --Azon tagok nevei,életkora,születési dátuma, akik legalább 30 évesek. Rendezzük elsõsorban életkor
    --majd név szerint
    
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
    where tema in ('horror','sci-fi','történelem');
    
    --Azon könyvek ára,kiadási dátuma,címe,témája,oldalszáma amely könyvek 1990 és 2000 között
    --kerültek kiadásra vagy a könyv ára 1000 és 3000 között van vagy 20 oldalnál rövidebb sci-fik
    --Téma szerint csökkenõ.Egyezés esetén oldalszám szerint növekvõ
    
    select ar,to_char(kiadas_datuma,'ds'),cim,oldalszam,tema from konyvtar.konyv
    where (to_char(kiadas_datuma,'yyyy') between 1990 and 2000) or (oldalszam < 20 and tema = 'sci-fi') or
    ar between 1000 and 3000
    order by tema desc,oldalszam;
    
    select isbn,cim,to_char(kiadas_datuma,'ds')
    from konyvtar.konyv
    where (cim like 'A%' and tema in ('horror','sci-fi')) or
    (tema is null) or (months_between(sysdate,kiadas_datuma)/12) <= 10;
    
    --Azok a könyvek amelyeknek címében szerepel az a_a vagy a_á részstring.
    --Csak cím és rendezzük csökkenõ sorrendbe.
    
    select cim from konyvtar.konyv
    where cim like '%a_a%' or cim like '%a_á%';