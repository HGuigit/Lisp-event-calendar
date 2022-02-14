;GRUPO: Vinicius Atsushi, Marina Chagas, Guilherme de Souza.


(defun date_validation (dia mes ano hora duracao descricao) "Validando parametros de entrada da data do novo evento"

    (if (or (> dia 30) (< dia 1) (eq (integerp dia) nil) )
        (return-from date_validation nil)
    ) 

    (if (or (> mes 12) (< mes 1) (eq (integerp mes) nil) )
        (return-from date_validation nil)
    ) 

    (if (or (< ano 0) (eq ano nil) (eq (integerp ano) nil) )
        (return-from date_validation nil)
    )

    (if (or (< hora 0) (> hora 24) (eq (integerp hora) nil) )
        (return-from date_validation nil)
    )

    (if (or (< duracao 1) (eq (integerp duracao) nil) )
        (return-from date_validation nil)
    )

    (return-from date_validation t)
)

(defun duration_validation (duracao)    "Testando se a entrada opcional -> duração teve algum valor atribuido"
    (if (eq duracao nil)
        (return-from duration_validation 1)
        (return-from duration_validation duracao)
    )
)

(defun calendar_validation (dia mes ano)    "Validando data para exibir o calendario"

    ; nil nil nil
    (if (and  (eq dia nil) (eq mes nil) (eq ano nil) )
        (return-from calendar_validation nil)
    )

    ; validando dia
    (if (eq (integerp dia) t)
        (if (or (> dia 30) (< dia 1)  )
            (return-from calendar_validation nil)
        )
        (if (not (eq dia nil))
            (return-from calendar_validation nil) 
        )
    )
  

    ; validando mes
    (if(eq (integerp mes) t) 
        (if (or (> mes 12) (< mes 1)  )
            (return-from calendar_validation nil)
        )
        (if (not (eq mes nil))
            (return-from calendar_validation nil) 
        ) 
    )
    
    ; validando ano
    (if (eq (integerp ano) t)
        (if (or (< ano 0))
            (return-from calendar_validation nil)
        )
        (if (not (eq ano nil))
            (return-from calendar_validation nil) 
        ) 
    )

    (return-from calendar_validation t)

)
