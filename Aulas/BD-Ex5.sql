--a
select Matricula
from taxi 
where modelo like '%Mercedes%'

--b
Select Nome
From motorista, turno, taxi
where motorista.Nbi = turno.Nbi and modelo like '%Mercedes%' and turno.Matricula = taxi.Matricula

--c 
Select Telefone
From telefone, motorista, pedido, turno
where pedido.Nif = 600700800900 and motorista.Nbi = telefone.Nbi and pedido.Matricula = turno.Matricula and  motorista.Nbi = turno.Nbi 

--d
select Modelo
from motorista, taxi, turno
where motorista.Nome = 'Anibal Silva' and taxi.Matricula = turno.Matricula and motorista.Nbi = turno.Nbi

--e
select motorista.Nome
from motorista, pedido, cliente1, turno
where cliente1.Nome not in ('José Silva') and pedido.Nif = cliente1.Nif and pedido.Matricula = turno.Matricula and motorista.Nbi = turno.Nbi

--f
select Nome
from motorista, taxi, turno
where taxi.Modelo not like '%Mercedes%' and taxi.Matricula = turno.Matricula and turno.Nbi = motorista.Nbi

--g
select Nome
from motorista
where not exists
( (select Matricula
   from taxi)
 except
(select Matricula
 from turno
 where turno.Nbi = motorista.Nbi)
) 

--h
select Nome, count(serviço)
from motorista, turno, serviço
where turno.Matricula = serviço.Matricula and turno.Nbi = motorista.Nbi
group by motorista.Nome

--i
select Nome, sum(valor)
from motorista, turno, serviço
where turno.Matricula = serviço.Matricula and turno.Nbi = motorista.Nbi
group by motorista.Nome

--j
select Nome, max(valor)
from motorista, turno, serviço
where turno.Matricula = serviço.Matricula and turno.Nbi = motorista.Nbi
group by motorista.Nome

--k
select taxi.Matricula, Modelo, sum((-KmInicio) + KmFim)
from taxi, turno
where turno.Matricula = taxi.Matricula
group by Modelo, taxi.Matricula

--l
select avg((DataInicio - DataPedido))
from pedido

--m
select Nome, count(pedido)
from cliente1, pedido
where cliente1.Nif = pedido.Nif
group by Nome

--n 
with x as(select taxi.Matricula, taxi.Modelo, sum((serviço.Kms)/(valor)) 
from taxi, serviço
where taxi.Matricula = serviço.Matricula
group by taxi.Matricula, taxi.Modelo)

select taxi.Matricula, taxi.Modelo, max(sum)
from x, taxi, serviço
where taxi.Matricula = serviço.Matricula
group by taxi.Matricula, taxi.Modelo

--o
select Nome, sum(((-KmInicio) + KmFim) - serviço.Kms)
from motorista, turno, serviço
where motorista.Nbi = turno.Nbi and serviço.Matricula = turno.Matricula
group by Nome

--p
select Nome, sum ((serviço.Kms)/(serviço.DataFim-serviço.DataInicio))
from motorista, serviço, turno
where motorista.Nbi = turno.Nbi and serviço.Matricula = turno.Matricula
group by Nome
