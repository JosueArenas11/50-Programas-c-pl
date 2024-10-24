% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que define operadores 
%              lógicos y genera tablas de verdad.
% ===============================================

% Definición de los operadores básicos
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.

% Genera una tabla de verdad para los operadores lógicos.
tabla_logica(Op) :-
    write('A B Resultado'), nl,
    (   member(A, [true, false]),
        member(B, [true, false]),
        (   call(Op, A, B) -> Res = true ; Res = false),
        format('~w ~w ~w~n', [A, B, Res]),
        fail
    ;   true
    ).

% Ejemplo de uso:
% ?- tabla_logica(and).
% A B Resultado
% true true true
% true false false
% false true false
% false false false
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que define operadores 
%              lógicos y genera tablas de verdad.
% ===============================================

% using System;

% class Program
% {
%     // Definición de los operadores lógicos
%     static bool And(bool a, bool b) => a && b;
%     static bool Or(bool a, bool b) => a || b;
%     static bool Nand(bool a, bool b) => !(a && b);
%     static bool Nor(bool a, bool b) => !(a || b);
%     static bool Xor(bool a, bool b) => (a && !b) || (!a && b);
%     static bool Impl(bool a, bool b) => !a || b;
%     static bool Equ(bool a, bool b) => (a && b) || (!a && !b);

%     // Genera una tabla de verdad para los operadores lógicos.
%     static void TablaLogica(Func<bool, bool, bool> op)
%     {
%         Console.WriteLine("A     B     Resultado");
%         foreach (bool a in new[] { true, false })
%         {
%             foreach (bool b in new[] { true, false })
%             {
%                 bool resultado = op(a, b);
%                 Console.WriteLine($"{a}  {b}  {resultado}");
%             }
%         }
%     }

%     static void Main()
%     {
%         // Ejemplo: tabla de verdad para AND
%         TablaLogica(And);
%     }
% }
