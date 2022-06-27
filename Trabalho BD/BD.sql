Create table motorista (
   Nome varchar (25),
   NcartaCond char (5),
   DataNasc varchar (9),
   Nbi integer primary key
   
);

insert into motorista values ('Manuel Duarte', 'L-123', '14/1/76', 1234);
insert into motorista values ('Fernando Nobre', 'L-124', '14/1/77', 1235);
insert into motorista values ('Anibal Silva', 'L-125', '14/1/78', 1236);
insert into motorista values ('Francisco Lopes', 'L-126', '14/1/79', 1237);



Create table telefone (
   Nbi integer primary key,
   Telefone varchar (50),
   Foreign key (Nbi) references motorista on delete restrict
);

insert into telefone values (1234, '266262626, 939393939');
insert into telefone values (1235, '266262627, 939393940');
insert into telefone values (1236, '266262628, 939393941');
insert into telefone values (1237, '266262629');

Create table modelo (
   Marca varchar (30),
   Modelo varchar (30),
   Nlugares integer,
   Consumo varchar (30),
   Primary key (Marca,Modelo)
   
   
);

insert into modelo values ('Renault', 'Espace', 7, '71 aos 100');
insert into modelo values ('Mercedes', 'CLK', 7, '91 aos 100');
insert into modelo values ('Honda', 'Civic', 5, '51 aos 100');
insert into modelo values ('Mercedes', 'Classe S', 5, '6.51 aos 100');


Create table taxi (
   Modelo varchar (35),
   Ano integer,
   Kms integer,
   Matricula char (8) primary key
   
   
);

insert into taxi values ('Renault Espace', 2015, 123098, '22-AA-22');
insert into taxi values ('Mercedes CLK', 2014, 234554, '21-AA-22');
insert into taxi values ('Honda Civic', 2012, 89764, '20-AA-22');
insert into taxi values ('Mercedes Classe S', 2015, 79744, '19-AA-22');

Create table serviço (
   DataInicio TIMESTAMP NULL,
   DataFim TIMESTAMP NULL,
   Kms integer,
   Valor float,
   Matricula char (8),
   CoordGPSInic varchar (30),
   CoordGPSFim varchar (30),
   
   
       
   Foreign key (Matricula) references taxi on delete restrict
);

insert into serviço values (NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into serviço values ('2/1/2016 8:12', '2/1/2016 8:32', 12, 5.25, '19-AA-22', '0,75', '0,76');
insert into serviço values ('2/1/2016 8:43', '2/1/2016 8:52', 7, 3.25, '19-AA-22', '1,77', '1,77');
insert into serviço values ('2/1/2016 8:53', '2/1/2016 9:59', 98, 53.25, '19-AA-22', '2,78', '150,21');
insert into serviço values ('2/1/2016 10:13', '2/1/2016 10:29', 18, 19.25, '19-AA-22', '3,89', '33,50');
insert into serviço values ('2/1/2016 11:10', '2/1/2016 11:39', 23, 22.25, '19-AA-22', '5,47', '48,02');
insert into serviço values ('2/1/2016 12:00', '2/1/2016 13:39', 21, 42.25, '19-AA-22', '3,22', '103,44');
insert into serviço values ('2/1/2016 15:20', '2/1/2016 15:39', 9, 12.25, '19-AA-22', '6,55', '7,89');

Create table turno (
   DataInicio TIMESTAMP,
   DataFim  TIMESTAMP,
   KmInicio integer,
   KmFim integer,  
   Matricula char (8),
   Nbi integer,
   
   Foreign key (Matricula) references taxi on delete restrict,
   Foreign key (Nbi) references motorista on delete restrict,
   Primary key (DataInicio, Nbi)
   
   
);

insert into turno values ('2/1/2016 8:00', '2/1/2016 17:00', 79744, 79944, '19-AA-22', 1234);
insert into turno values ('2/1/2016 8:00', '2/1/2016 17:00', 89764, 89964, '20-AA-22', 1235);
insert into turno values ('3/1/2016 8:00', '3/1/2016 17:00', 234554, 234954, '21-AA-22', 1236);
insert into turno values ('3/1/2016 8:00', '3/1/2016 17:00', 123098, 123498, '22-AA-22', 1237);

Create table cliente1 (
   Nome varchar (25),
   Morada varchar (35),
   CódigoPostal varchar (30),
   Nif BIGINT primary key
);

insert into cliente1 values ('José Silva', 'Rua Antonio Silva 23', '7100-434 Évora', 600700800900);
insert into cliente1 values ('Francisco Passos', 'Rua Manuel Passos 12', '7000-131 Évora', 600700800901);
insert into cliente1 values ('Pedro Sousa', 'Rua Joaquim Sousa 21', '7500-313 Évora', 600700800902);

Create table pedido (
   Nif BIGINT,
   MoradaInicio varchar (35),
   CódigoPostalInicio varchar (30),
   DataPedido TIMESTAMP,
   Matricula char (8),
   DataInicio TIMESTAMP,
   
   Foreign key (Matricula) references taxi on delete restrict,
   Foreign key (Nif) references cliente1 on delete restrict,
   Primary key (Nif, DataPedido) 
);

insert into pedido values (600700800900, 'Rua Silva Pais 33', '7120-212 Évora', '2/1/2016 9:00', '19-AA-22', '2/1/2016 8:43');
insert into pedido values (600700800901, 'Rua de Portel 18', '7005-397 Évora', '2/1/2016 9:15', '20-AA-22', '2/1/2016 9:37');
insert into pedido values (600700800902, 'Rua Pais Silva 35', '7005-747 Évora', '2/1/2016 11:30', '21-AA-22', '2/1/2016 12:03');
insert into pedido values (600700800901, 'Rua das Nogueiras 12', '7120-314 Évora', '3/1/2016 10:02', '21-AA-22', '3/1/2016 10:11');
insert into pedido values (600700800902, 'Rua de Évora 31', '7545-124 Évora', '3/1/2016 11:21', '19-AA-22', '3/1/2016 12:00');
insert into pedido values (600700800900, 'Rua Manuel Abreu 27', '7654-456 Évora', '3/1/2016 15:15', '20-AA-22', '3/1/2016 15:30');
