;GRUPO: Vinicius Atsushi, Marina Chagas, Guilherme de Souza.


(defparameter lista())  ; Lista global que armazena os eventos cadastrados

(setq ano_zero 0)       ; Definindo calendário iniciando no ano zero

; ----------------------------------------------------------------------------------------------------------;

; evento -> dia mes ano hora descrição duração

; Definindo atributos da estrutura evento
(defstruct event 
        duracao
        descricao
        hora
        ano
        mes
        dia
        total_time
)

; ----------------------------------------------------------------------------------------------------------;

; Cadastra o novo evento em uma lista global lista()

; evento -> dia mes ano hora descrição duração

(defun new_event (dia mes ano hora descricao &optional duracao) "Cadastra novo evento"

    ; Validando entrada duração 
    (setq duracao (duration_validation duracao))

    ; Validação da data
    (if (eq (date_validation dia mes ano hora duracao descricao) nil)
        (return-from new_event nil)
    )
    
    ; Após validar, criando estrutura com os dados recebidos
    ( setq event_insert (make-event 
        :duracao duracao   
        :descricao descricao     
        :hora hora
        :ano ano
        :mes mes
        :dia dia
        :total_time (+ hora (* ano 12 30 24) (* (- mes 1) 30 24) (* (- dia 1) 24))  
        )  
    )
    
    ; Inserindo estrutura com dados na lista()
    (push event_insert lista)

    ; Ocorreu tudo certo, retorna TRUE
    (return-from new_event t)

)

; ----------------------------------------------------------------------------------------------------------;

; Printa todos os eventos listado pelos parametros de busca

(defun list_events (dia mes ano hora) "Lista os eventos usando os parametros de entrada"

    ;Se não foi passado nenhum parametro todos são nil, return nil
    (if  (and (eq ano nil) (eq mes nil) (eq dia nil) (eq hora nil)) 
        (return-from list_events nil)
    )

    ; Se todos os parametros para listar um evento forem != nil, usamos a soma de horas para calcular os eventos listados
    (if  (not (or (eq ano nil) (eq mes nil) (eq dia nil) (eq hora nil)) )
        (block all_parameters
            (list_all_parameters dia mes ano hora)
            (return-from list_events t)
        )
    )  

    (setq empty_list())

    ; Algum parametro de listagem == nil, procuramos somente os eventos pela data de inicio (desconsideramos a duração)
    (loop for x in lista do
       
        (if (or ( eq (event-ano x) ano)  (eq ano nil))              ; ano corresponde, ou o parâmetro nao foi fornecido 
            (if (or ( eq (event-mes x) mes ) (eq mes nil))          ; mes corresponde, ou o parâmetro nao foi fornecido 
                (if (or  (eq (event-dia x) dia) (eq dia nil))       ; dia corresponde, ou o parâmetro nao foi fornecido 
                    (if (or (eq (event-hora x) hora) (eq hora nil)) ; hora corresponde, ou o parâmetro nao foi fornecido 
                        (push x empty_list)
                    )
                )
            )
        )
    )

    (print_cronologic_events empty_list)
    (return-from list_events t)
)

; ----------------------------------------------------------------------------------------------------------;

; Se a chamada listar eventos tem todos os 4 parametros dia/mes/ano/hora consideramos a duração do evento
(defun list_all_parameters (dia mes ano hora) "Se nenhum parametro é nulo, são listados os eventos considerando a duração de cada um"

    (setq soma_horas (+ hora (* ano 12 30 24) (* (- mes 1) 30 24) (* (- dia 1) 24))  )  ; Soma total de horas dos eventos que queremos listar

    (setq empty_list())

    (loop for x in lista do
        (setq horas_inicio_evento (+ (event-hora x) (* (event-ano x) 12 30 24) (* (- (event-mes x) 1) 30 24) (* (- (event-dia x) 1) 24))  )
        (setq horas_fim_evento (+ horas_inicio_evento (event-duracao x)))

        ;(format t "Evento: ~S / horas inicio: ~D / horas fim: ~D" (event-descricao x) horas_inicio_evento horas_fim_evento)
        ;(terpri)
        (if (and (>= soma_horas horas_inicio_evento) (<= soma_horas horas_fim_evento))
            (push x empty_list)
        )
    )

    (print_cronologic_events empty_list)
) 

; ----------------------------------------------------------------------------------------------------------;

; Ordena e chama o print dos eventos em ordem cronológica
(defun print_cronologic_events (events_list) "Printa os eventos em ordem cronológica da lista recebida como parametro"

    (setq lista_ordenada (sort events_list #'maior_tempo))

    (loop for evento in lista_ordenada do
        (print_event evento)
    )   
)

; Função que retorna qual das structs tem o menor tempo. (cronologicamente qual acontece antes)
(defun maior_tempo (n1 n2)  "Retorna o maior elemento entre os 2 parametros"
    (< (event-total_time n1) (event-total_time n2))
)

; ----------------------------------------------------------------------------------------------------------;

; Printa as informações dos eventos chamados por essa função

(defun print_event (current_event)  "Printa cada uma das informações do evento na struct recebida como parametro"

    (terpri)
    (format t "Evento: ~S" (event-descricao current_event))
    (terpri)
    (format t "Dia: ~D" (event-dia current_event))
    (terpri)
    (convert_month (event-mes current_event))
    (terpri)
    (format t "Ano: ~D" (event-ano current_event))
    (terpri)
    (format t "Hora: ~Dh" (event-hora current_event))
    (terpri)
    (format t "Duracao: ~Dh" (event-duracao current_event))
    (terpri)
    
)

; ----------------------------------------------------------------------------------------------------------;

; Faz o print do Mês por extenso

(defun convert_month (month)    "Converte o mês em decimal para nome por extenso"

    (if (eq month 1)
        (format t "Mes: Janeiro (~D)" month)
    )

    (if (eq month 2)
        (format t "Mes: Fevereiro (~D)" month)
    )

    (if (eq month 3)
        (format t "Mes: Março (~D)" month)
    )

    (if (eq month 4)
        (format t "Mes: Abril (~D)" month)
    )

    (if (eq month 5)
        (format t "Mes: Maio (~D)" month)
    )

    (if (eq month 6)
        (format t "Mes: Junho (~D)" month)
    )

    (if (eq month 7)
        (format t "Mes: Julho (~D)" month)
    )

    (if (eq month 8)
        (format t "Mes: Agosto (~D)" month)
    )

    (if (eq month 9)
        (format t "Mes: Setembro (~D)" month)
    )
    
    (if (eq month 10)
        (format t "Mes: Outubro (~D)" month)
    )
    (if (eq month 11)
        (format t "Mes: Novembro (~D)" month)
    )
    (if (eq month 12)
        (format t "Mes: Dezembro (~D)" month)
    )

)

; ----------------------------------------------------------------------------------------------------------;

(defun Calendar (dia mes ano)   "Exibe o calendário, Varia a informação exibida na falta de algum parametro"

    ; Testando entradas válidas
    (if (eq (calendar_validation dia mes ano) nil)
        (return-from Calendar nil)
    )

    ; DIA nil nil
    (if (eq ano nil)
        (if (eq (integerp dia) t)
            (if (eq mes nil)
                (loop for i from 1 to 12 do 
                    (terpri)
                    (format t "~D/~D/xxxx" dia i)
                    (terpri)
                )
            )
        )
    )

    ; nil nil ANO
    (if (eq (integerp ano) t)
        (if (eq mes nil)
            (if (eq dia nil)
                (loop for i from 1 to 12 do
                    (terpri) 
                    (convert_month i)
                    (print "     1  2  3  4  5  6")
                    (print "  7  8  9 10 11 12 13")
                    (print " 14 15 16 17 18 19 20")
                    (print " 21 22 23 24 25 26 27")
                    (print " 28 29 30            ")
                    (terpri)
                )
            )
        )
    ) 
    
    ; nil MES nil
    (if (eq (integerp mes) t) 
        (if (eq ano nil)
            (if (eq dia nil)
                (block nil_mes_nil     
                    (terpri) 
                    (convert_month mes)
                    (print "     1  2  3  4  5  6")
                    (print "  7  8  9 10 11 12 13")
                    (print " 14 15 16 17 18 19 20")
                    (print " 21 22 23 24 25 26 27")
                    (print " 28 29 30            ")
                    (terpri)
                )  
            )
        )
    )
    
    ; DIA MES nil 
    (if (eq (integerp mes) t) 
        (if (eq ano nil)
            (if (eq (integerp dia) t) 
                (block dia_mes_nil    
                    (terpri) 
                    (format t "Dia: ~D / Mês: ~D / Ano: xxxx" dia mes)
                    (print "     1  2  3  4  5  6")
                    (print "  7  8  9 10 11 12 13")
                    (print " 14 15 16 17 18 19 20")
                    (print " 21 22 23 24 25 26 27")
                    (print " 28 29 30            ")
                    (terpri)
                )
            )
        )
    )
                    


    ; nil MES ANO
    (if (integerp mes ) 
        (if (integerp ano )
            (if (eq dia nil)
                (block nil_mes_ano
                    (terpri) 
                    (format t "Mês: ~D / Ano: ~D" mes ano)
                    (print "     1  2  3  4  5  6")
                    (print "  7  8  9 10 11 12 13")
                    (print " 14 15 16 17 18 19 20")
                    (print " 21 22 23 24 25 26 27")
                    (print " 28 29 30            ")
                    (terpri)
                )
            )
        )
    )


    ; DIA nil ANO 
    (if (eq (integerp ano) t)
        (if (eq (integerp dia) t)
            (if (eq mes nil)
                (loop for i from 1 to 12 do 
                    (terpri)
                    (format t "~D/~D/~D   " dia i ano)
                    (terpri)
                )
            )
        )
    )

    ; DIA MES ANO 
    (if (integerp dia)
        (if (integerp mes)
            (if (integerp ano)
                (block dia_mes_ano 
                    (terpri) 
                    (format t "~D/~D/~D" dia mes ano)
                    (print "     1  2  3  4  5  6")
                    (print "  7  8  9 10 11 12 13")
                    (print " 14 15 16 17 18 19 20")
                    (print " 21 22 23 24 25 26 27")
                    (print " 28 29 30            ")
                    (terpri)
                )
            )  
        )
    )

    (return-from Calendar t)

) 

; ----------------------------------------------------------------------------------------------------------;