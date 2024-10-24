% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que encuentra 
%              las composiciones de Goldbach para 
%              todos los números pares dentro de un rango.
% ===============================================

% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Verifica si un número es primo.
%     static bool EsPrimo(int n)
%     {
%         if (n < 2) return false;
%         for (int i = 2; i * i <= n; i++)
%             if (n % i == 0) return false;
%         return true;
%     }

%     // Encuentra dos primos que suman un número par dado (Goldbach).
%     static List<(int, int)> GoldbachList(int low, int high)
%     {
%         var resultados = new List<(int, int)>();

%         for (int n = low; n <= high; n += 2) // Solo pares.
%         {
%             for (int p1 = 2; p1 <= n / 2; p1++)
%             {
%                 int p2 = n - p1;
%                 if (EsPrimo(p1) && EsPrimo(p2))
%                 {
%                     resultados.Add((p1, p2));
%                     break; // Encontramos una composición válida.
%                 }
%             }
%         }

%         return resultados;
%     }

%     static void Main()
%     {
%         int low = 4, high = 30; // Rango de ejemplo.
%         var composiciones = GoldbachList(low, high);

%         Console.WriteLine($"Composiciones de Goldbach entre {low} y {high}:);
%         foreach (var (p1, p2) in composiciones)
%         {
%             Console.WriteLine($"{p1} + {p2});
%         }
%     }
% }

% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que encuentra 
%              las composiciones de Goldbach para 
%              todos los números pares dentro de un rango.
% ===============================================

% Verifica si un número es primo.
es_primo(2).
es_primo(N) :-
    N > 2,
    \+ (between(2, N1, X), N1 is N - 1, N mod X =:= 0).

% Encuentra dos primos que suman un número par dado.
goldbach(N, [P1, P2]) :-
    between(2, N, P1),
    P2 is N - P1,
    es_primo(P1),
    es_primo(P2).

% Encuentra las composiciones de Goldbach para los números pares en un rango.
goldbach_list(Low, High, L) :-
    findall([N, P1, P2], 
            (between(Low, High, N), N mod 2 =:= 0, goldbach(N, [P1, P2])), 
            L).

% Ejemplo de uso:
% ?- goldbach_list(4, 30, L).
% L = [[4, 2, 2], [6, 3, 3], [8, 3, 5], ...].

