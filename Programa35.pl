% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              los factores primos de un número 
%              entero positivo junto con su 
%              multiplicidad.
% ===============================================

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).

% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% Codifica la lista de factores primos en pares (N, X) donde N es la cantidad y X es el factor primo.
encode(L, R) :- pack(L, P), transform(P, R).

transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :-
    length([X|Xs], N),
    transform(Ys, Zs).

% Ejemplo de uso:
% ?- prime_factors_mult(28, L).
% L = [[2, 2], [1, 7]].
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que determina 
%              los factores primos de un número 
%              entero positivo junto con su 
%              multiplicidad.
% ===============================================

% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     static void Main()
%     {
%         int number = 28; // Número para encontrar los factores primos
%         var factors = PrimeFactors(number);
%         var factorsWithMultiplicity = Encode(factors);
%         Console.WriteLine($"Los factores primos de {number} con multiplicidad son: {string.Join(", ", factorsWithMultiplicity)}");
%     }

%     static List<int> PrimeFactors(int n)
%     {
%         var factors = new List<int>();
%         for (int factor = 2; factor <= n; factor++)
%         {
%             while (n % factor == 0)
%             {
%                 factors.Add(factor); // Añade el factor a la lista
%                 n /= factor; // Divide el número por el factor
%             }
%         }
%         return factors; // Retorna la lista de factores primos
%     }

%     static List<(int count, int factor)> Encode(List<int> factors)
%     {
%         var result = new List<(int, int)>();
%         var grouped = factors.GroupBy(x => x);
%         foreach (var group in grouped)
%         {
%             result.Add((group.Count(), group.Key)); // Añade la multiplicidad y el factor
%         }
%         return result; // Retorna la lista de factores con multiplicidad
%     }
% }
