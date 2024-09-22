;extends
((template_string) @_SESSO 
    (#offset! @_SESSO 0 2 0 -2)
)

; ;extends
; ((comment) @_comment
;  (#match? @_comment "(_html|_HTML)")
;   value: (template_string
;          .((string_fragment).(template_substitution)?) @PROVA
;          .((string_fragment).(template_substitution)?)* @PROVA
;          .((string_fragment).(template_substitution)?) @PROVA
;          .
;    ) 
; )
; ;extends
; ((comment) @_comment
;  (#match? @_comment "(_html|_HTML)")
;   value: (template_string
;          .((string_fragment) (template_substitution)?)* @SESSO
;          .
;     ;(((string_fragment) (template_substitution)?))* @SESSO
;    ) 
; )
; ;extends
; ((comment) @_comment
;  (#match? @_comment "(_html|_HTML)")
;   value: (template_string
;          .((string_fragment).(template_substitution)?) @SESSO1
;          .((string_fragment).(template_substitution)?)* @SESSO1
;          .((string_fragment).(template_substitution)?) @SESSO1
;          .
;          
;     ;(((string_fragment) (template_substitution)?))* @SESSO
;    ) 
; )

