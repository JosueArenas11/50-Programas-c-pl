% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que encuentra 
%              dos números primos que sumen un 
%              número par dado según la conjetura 
%              de Goldbach.
% ===============================================

% Encuentra dos números primos que sumen un número par dado según la conjetura de Goldbach.
goldbach(N, [P1, P2]) :- 
    N > 2, 
    N mod 2 =:= 0, 
    prime_list(2, N, Primes), 
    member(P1, Primes), 
    P2 is N - P1, 
    is_prime(P2).

% Verifica si un número es primo.
is_prime(2).
is_prime(N) :- N > 2, \+ (between(2, sqrt(N), X), N mod X =:= 0).

% Genera una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :- 
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Ejemplo de uso:
% ?- goldbach(28, [P1, P2]).
% P1 = 5, P2 = 23.
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que encuentra dos 
%              números primos que sumen un número 
%              par dado según la conjetura de 
%              Goldbach.
% ===============================================

% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         int number = 28; // Número par dado
%         var (p1, p2) = Goldbach(number); // Encuentra los dos primos

%         Console.WriteLine($"Los números primos que suman {number} son: {p1} y {p2}");
%     }

%     // Encuentra dos números primos que sumen un número par dado.
%     static (int, int) Goldbach(int n)
%     {
%         if (n <= 2 || n % 2 != 0)
%             throw new ArgumentException("El número debe ser un número par mayor que 2.");

%         List<int> primes = PrimeList(2, n); // Genera la lista de primos
%         foreach (int p1 in primes)
%         {
%             int p2 = n - p1; // Calcula el segundo primo
%             if (IsPrime(p2)) return (p1, p2); // Retorna si ambos son primos
%         }

%         throw new Exception("No se encontraron dos primos que sumen el número.");
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
% }
