Select 'NumL', 'NumB','Data', 'Preco', 'HPart', 'HCheg', 'Reserva', 'Cliente', 'Funcionario', 'PerOrigem', 'PerDestino','PrecoR'
UNION ALL
Select `NumL`,`NumB`, `Data`, `Preco`, `HPart`, `HCheg`, `Reserva`, `Cliente`, `Funcionario`, `PerOrigem`, `PerDestino`,`PrecoR` From Bilhete
Into outFile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/bilhete.csv'
Fields Enclosed by '"' Terminated By ',' Escaped By ''
Lines Terminated By '\r\n';

Select 'Nome', 'NISS', 'Rua', 'CodPost', 'Ender'
UNION ALL
Select  `Nome`,`NISS`, `Rua`, `CodPost`, `Ender` From Cliente
Into outFile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/cliente.csv'
Fields Enclosed by '"' Terminated By ',' Escaped By ''
Lines Terminated By '\r\n';

Select 'Funcionario','NComb'
UNION ALL
Select `Funcionario`,`NComb` From Comboio
Into outFile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/comboio.csv'
Fields Enclosed by '"' Terminated By ',' Escaped By ''
Lines Terminated By '\r\n';

Select  'Cliente','Contacto'
UNION ALL
Select `Cliente`,`Contacto` From Contacto
Into outFile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/contacto.csv'
Fields Enclosed by '"' Terminated By ',' Escaped By ''
Lines Terminated By '\r\n';

Select 'Nome','NFunc','NCC', 'Funcao'
UNION ALL
Select `Nome`,`NFunc`, `NCC`, `Funcao` From Funcionario
Into outFile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/funcionario.csv'
Fields Enclosed by '"' Terminated By ',' Escaped By ''
Lines Terminated By '\r\n';

Select 'Comboio','Numero'
UNION ALL
Select `Comboio`,`Numero` From Lugar
Into outFile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/lugar.csv'
Fields Enclosed by '"' Terminated By ',' Escaped By ''
Lines Terminated By '\r\n';

Select 'Destino','Origem', 'Linha'
UNION ALL
Select `Destino`,`Origem`, `Linha` From Percurso
Into outFile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/percurso.csv'
Fields Enclosed by '"' Terminated By ',' Escaped By ''
Lines Terminated By '\r\n';

Select 'Origem','Comboio', 'Destino'
UNION ALL
Select `Origem`,`Comboio`, `Destino` From PercursoComboio
Into outFile 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/percursoComboio.csv'
Fields Enclosed by '"' Terminated By ',' Escaped By ''
Lines Terminated By '\r\n';