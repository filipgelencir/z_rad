drop database if exists tester;
create database tester;
use tester;

create table injektor(
    sifra int not null primary key auto_increment,
    kataloski_br varchar(30) not null,
    diza varchar(20),
    proizvodac varchar(10),
    tip varchar(6),
    bak_brt decimal(2,1),
    vozilo varchar(15),
    ispitne_vr int 
);

create table ispitne_vr(
    sifra int not null primary key auto_increment,
    vri_povrat_max decimal(4,1),
    vri_povrat_min decimal(4,1),
    vri_glavna_max decimal(4,1),
    vri_glavna_min decimal(4,1),
    vri_srednja_max decimal(4,1),
    vri_srednja_min decimal(4,1),
    vri_ler_max decimal(4,1),
    vri_ler_min decimal(4,1),
    vri_predubrizgavanje_max decimal(4,1),
    vri_predubrizgavnjae_min decimal(4,1)

);
create table rezultat(
    sifra int not null primary key auto_increment,
    ispitivanje int,
    povrat decimal(4,1) ,
    glavna decimal(4,1),
    srednja decimal(4,1) ,
    ler decimal(4,1) ,
    predubrizgavanje decimal(4,1) 
   
    
);
create table kupac(
    sifra int not null primary key auto_increment,
    ime varchar(15) not null,
    prezime varchar(15)
    

);
create table ispitivanje(
    sifra int not null primary key auto_increment,
    injektor int not null,
    kupac int ,
    datum datetime
  
    
    
    
);
create table rezultat_ispitivanje(
    sifra int not null primary key auto_increment,
    rezultat int not null,
    ispitivanje int not null
    
);


alter table injektor add foreign key (ispitne_vr) references ispitne_vr(sifra);
alter table ispitivanje add foreign key(kupac) references kupac(sifra);
alter table rezultat_ispitivanje add foreign key(rezultat) references rezultat(sifra);
alter table rezultat_ispitivanje add foreign key(ispitivanje) references ispitivanje(sifra);
alter table ispitivanje add foreign key (kupac) references kupac(sifra);
alter table ispitivanje add foreign key (injektor) references injektor(sifra);


