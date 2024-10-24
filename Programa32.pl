% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina si 
%              dos números son coprimos utilizando el 
%              máximo común divisor.
% ===============================================

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Ejemplo de uso:
% ?- coprime(15, 28).
% true.
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que determina si 
%              dos números son coprimos utilizando el 
%              máximo común divisor.
% ===============================================

% using System;

% class Program
% {
%     static void Main()
%     {
%         int a = 15; // Primer número
%         int b = 28; // Segundo número
%         bool areCoprime = AreCoprime(a, b);
%         Console.WriteLine($"{a} y {b} son coprimos: {areCoprime}");
%     }

%     static bool AreCoprime(int x, int y)
%     {
%         return Gcd(x, y) == 1; // Verifica si el MCD es 1
%     }

%     static int Gcd(int x, int y)
%     {
%         if (y == 0) return x; // Caso base
%         return Gcd(y, x % y); // Llamada recursiva
%     }
% }
