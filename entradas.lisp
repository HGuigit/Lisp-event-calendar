
;GRUPO: Vinicius Atsushi, Marina Chagas, Guilherme de Souza.

(load "validation.lisp")
(load "funcoes.lisp")   


; ----------------------------------------------------------------------------------------------------------;

;   CADASTRAR-EVENTO
;   PARAMETROS ->  (new_event dia mes ano hora descrição duração)

(new_event 10 12 2021 15 "Aniversario da Julia" 2)

(new_event 5 1 0 12 "Aniversario do Carlos" 6) 

(new_event 19 1 0 7 "Aniversario do Manuel" 10)

(new_event 20 1 0 14 "Pós-festa Manuel" 5)

(new_event 21 1 0 14 "Pós-Pós-festa Manuel" 5)

(new_event 14 6 2030 9 "Aniversario da Elda" 7)

(new_event 14 6 2030 22 "Aniversario do Jao" 3)

(new_event 30 12 2021 23 "Virada do Ano" 2)

(new_event 1 1 2022 1 "Show de fogos de artificio São Paulo" 1)

(new_event 1 1 2022 1 "Show de fogos de artificio Rio de Janeiro" 2)

(new_event 2 6 2022 14 "Festa junina" 7)

(new_event 14 2 2022 0 "Semana de Páscoa" 168)

; ----------------------------------------------------------------------------------------------------------;

; LISTAR-EVENTOS 
; PARAMETROS -> (list_events dia mes ano hora)

;(list_events 10 12 2021 16)    ; Procurando Julia

;(list_events nil 1 0 nil)      ; Procurando Eventos do ano 0 em janeiro

;(list_events nil 6 nil nil)    ; Procurando eventos do mes de junho (independente de dia/hora/ano)

(list_events 1 1 2022 1)       ; Procurando virada do ano

;(list_events 20 2 2022 12)      ; Listando penultimo dia da Páscoa

;(list_events nil 1 nil nil)     ; Listando eventos de janeiro (ano/dia/hora qualquer)


; ----------------------------------------------------------------------------------------------------------;

; CALENDARIO
; PARAMETROS -> (Calendar dia mes ano)

;(Calendar nil nil 1900)        ; Calendario do ano 1900

(Calendar 15 2 nil)            ; Calendario dia 15/2/xxxx

;(Calendar 15 2 1420)           ; Calendario dia 15/2/1420

;(Calendar 15 nil nil)           ; Listando todos os dias 15 de um ano qualquer

; ----------------------------------------------------------------------------------------------------------;

