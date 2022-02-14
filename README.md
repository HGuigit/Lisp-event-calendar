# GRUPO: Vinicius Atsushi, Marina Chagas, Guilherme de Souza.

# Documento com descrição dos parametros de execução dos códigos

O código "entradas.lisp" será o arquivo.lisp a ser executado.
Para executar as chamadas de função neste código, são carregados os outros códigos: validation.lisp e funcoes.lisp

// ------------------------------------------------------------------------------------------------------------------------------------------//

Para cadastrar um novo evento, utilizamos a função new_event

Seus parametros são:

    (new_event <dia> <mes> <ano> <hora> <"descrição"> <duracao>)

O unico parametro opcional da função new_event é a duração (na ausência de duração, por padrão duração = 1h)
Essa função utiliza os parametros de entrada para criar uma nova struct(estrutura) a ser inserida em uma lista global de eventos cadastrados (lista())

-> Retorna t se o evento foi cadastrado com sucesso
-> Retorna nil se tiver parametros inválidos/Não conseguir cadastrar

// ------------------------------------------------------------------------------------------------------------------------------------------//

Para listar eventos que ocorrem em uma determinada data, utilizamos a função:

    (list_events <dia> <mes> <ano> <hora>)

Caso a data para listar eventos tenha todos os parametros é considerado a duração dos eventos na hora de listar.
Exemplo:

(list_events 1 1 2022 1)       ; Procurando virada do ano de 2022 - 2023 ->> listando eventos que ocorrem 1 de janeiro de 2022, 1 da manha

Caso contrário, listamos somente os eventos que dão "match" com os parametros passados, exemplo:

(list_events nil 6 nil nil)    ; Procurando eventos do mes de junho

-> Retorna t se os parametros estiverem ok (independente de achar algum evento ou não)
-> Retorna nil caso contrário

// ------------------------------------------------------------------------------------------------------------------------------------------//

Para ver o calendario de uma data especifica:

    (Calendar <dia> <mes> <ano>)

-> Parametros inválidos retorno = nil 
-> Caso contrário, retorno = t 

// ------------------------------------------------------------------------------------------------------------------------------------------//