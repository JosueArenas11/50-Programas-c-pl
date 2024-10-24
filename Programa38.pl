% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que genera 
%              una lista de números primos en 
%              un rango dado.
% ===============================================

% Genera una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :- 
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Verifica si un número es primo.
is_prime(2).
is_prime(N) :- N > 2, \+ (between(2, sqrt(N), X), N mod X =:= 0).

% Ejemplo de uso:
% ?- prime_list(10, 30, Primes).
% Primes = [11, 13, 17, 19, 23, 29].
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que genera una 
%              lista de números primos en un 
%              rango dado.
% ===============================================

% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         int low = 10; // Límite inferior
%         int high = 30; // Límite superior
%         List<int> primes = PrimeList(low, high); // Genera la lista de números primos

%         Console.WriteLine($"Primes between {low} and {high}: {string.Join(", ", primes)}");
%     }

%     // Genera una lista de números primos en un rango dado.
%     static List<int> PrimeList(int low, int high)
%     {
%         List<int> primes = new List<int>();
%         for (int i = low; i <= high; i++)
%         {
%             if (IsPrime(i)) primes.Add(i); // Añade a la lista si es primo
%         }
%         return primes;
%     }

%     // Verifica si un número es primo.
%     static bool IsPrime(int n)
%     {
%         if (n <= 1) return false; // Números menores o iguales a 1 no son primos
%         if (n == 2) return true; // 2 es primo

%         for (int i = 2; i <= Math.Sqrt(n); i++)
%         {
%             if (n % i == 0) return false; // Divisible por otro número
%         }
%         return true;
%     }
% }
