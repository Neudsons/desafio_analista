SELECT UCASE(U.NOME), 
INSERT( INSERT( INSERT( U.CPF, 10, 0, '-' ), 7, 0, '.' ), 4, 0, '.' ) AS CPF,
C.Cargo,
O.Orgao,
S.SISTEMA FROM
USUARIO AS U
INNER JOIN USUARIO_HAS_SISTEMA US
ON U.idUsuario = US.Usuario_idUsuario
INNER JOIN SISTEMA S
ON S.idSistema = US.Sistema_idSistema
INNER JOIN CARGO C
ON U.Cargo_idCargo = C.idCargo
INNER JOIN Orgao O
ON U.Orgao_idOrgao = O.idOrgao