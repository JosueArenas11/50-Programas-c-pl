% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que genera una 
%              tabla de verdad para una expresión lógica
%              en dos variables.
% ===============================================

% Genera una tabla de verdad para una expresión lógica en dos variables.
% A y B son las variables lógicas y Expr es la expresión lógica que se evalúa.
table(A, B, Expr) :-
    write(A), write(' '), 
    write(B), write(' '), 
    (call(Expr) -> write(true) ; write(false)), 
    nl, 
    fail.
table(_, _, _). 

% Ejemplo de uso:
% ?- table(true, false, (A, B)).
% true false false
% true true true
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que genera una 
%              tabla de verdad para una expresión lógica
%              en dos variables.
% ===============================================

% using System;

% class Program
% {
%     // Genera una tabla de verdad para una expresión lógica en dos variables.
%     static void TablaDeVerdad(Func<bool, bool, bool> expr)
%     {
%         bool[] valores = { true, false };

%         Console.WriteLine("A     B     Resultado");
%         foreach (bool a in valores)
%         {
%             foreach (bool b in valores)
%             {
%                 bool resultado = expr(a, b);
%                 Console.WriteLine($"{a}  {b}  {resultado}");
%             }
%         }
%     }

%     static void Main()
%     {
%         // Ejemplo: A AND B
%         TablaDeVerdad((a, b) => a && b);
%     }
% }
