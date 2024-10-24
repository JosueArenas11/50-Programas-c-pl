% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 19 de octubre de 2024
% Descripción: Programa en Prolog que verifica si 
%              un número entero dado es primo. 
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class Program
% {
%     // Función que verifica si un número es primo.
%     static bool EsPrimo(int n)
%     {
%         if (n < 2) return false; // Los números menores a 2 no son primos.
%         if (n == 2 || n == 3) return true; // 2 y 3 son primos.

%         if (n % 2 == 0) return false; // Elimina pares mayores a 2.

%         // Comprueba factores impares desde 3 hasta sqrt(n).
%         for (int i = 3; i * i <= n; i += 2)
%         {
%             if (n % i == 0) return false; // Si tiene factor, no es primo.
%         }
%         return true; // Si no tiene factores, es primo.
%     }

%     static void Main()
%     {
%         Console.WriteLine("Es primo 7? " + EsPrimo(7)); // True
%         Console.WriteLine("Es primo 10? " + EsPrimo(10)); // False
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado is_prime/1 que verifica si un número dado es primo.

is_prime(2). % 2 es primo.
is_prime(3). % 3 es primo.

is_prime(P) :- 
    P > 3,              % El número debe ser mayor que 3.
    P mod 2 =\= 0,      % No puede ser par (excepto 2).
    \\+ has_factor(P, 3). % No debe tener factores impares.

% Predicado has_factor/2 que verifica si un número tiene factores.
has_factor(N, L) :- 
    N mod L =:= 0. % Si N es divisible por L, tiene factor.

has_factor(N, L) :- 
    L * L < N,       % Solo comprobamos hasta la raíz cuadrada de N.
    L2 is L + 2,     % Incrementamos por 2 (para comprobar solo impares).
    has_factor(N, L2). % Llamada recursiva con el siguiente impar.

% Ejemplo de uso:
% ?- is_prime(7).
% true.

% ?- is_prime(10).
% false.
% ----------------------------------------------
