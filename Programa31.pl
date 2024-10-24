% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que calcula el máximo 
%              común divisor usando el algoritmo de Euclides.
% ===============================================

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Ejemplo de uso:
% ?- gcd(48, 18, G).
% G = 6.
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que calcula el máximo 
%              común divisor usando el algoritmo de Euclides.
% ===============================================

% using System;

% class Program
% {
%     static void Main()
%     {
%         int a = 48; // Primer número
%         int b = 18; // Segundo número
%         int gcdValue = Gcd(a, b);
%         Console.WriteLine($"El MCD de {a} y {b} es: {gcdValue}");
%     }

%     static int Gcd(int x, int y)
%     {
%         if (y == 0) return x; // Caso base
%         return Gcd(y, x % y); // Llamada recursiva
%     }
% }
