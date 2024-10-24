% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que encuentra 
%              los factores primos de un número 
%              entero positivo.
% ===============================================

% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% Ejemplo de uso:
% ?- prime_factors(28, L).
% L = [2, 2, 7].
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que encuentra 
%              los factores primos de un número 
%              entero positivo.
% ===============================================

% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         int number = 28; // Número para encontrar los factores primos
%         List<int> factors = PrimeFactors(number);
%         Console.WriteLine($"Los factores primos de {number} son: {string.Join(", ", factors)}");
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
% }
