% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que calcula la 
%              función totiente de Euler, que cuenta 
%              cuántos números menores que M son 
%              coprimos con M.
% ===============================================

% Calcula la función totiente de Euler, que cuenta cuántos números menores que M son coprimos con M.
totient(1, 1).
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- K > 0, coprime(M, K), Acc1 is Acc + 1, K1 is K - 1, totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- K > 0, \+ coprime(M, K), K1 is K - 1, totient_acc(M, K1, Acc, Phi).

% Ejemplo de uso:
% ?- totient(9, Phi).
% Phi = 6.
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que calcula la 
%              función totiente de Euler, que cuenta 
%              cuántos números menores que M son 
%              coprimos con M.
% ===============================================

% using System;

% class Program
% {
%     static void Main()
%     {
%         int m = 9; // Número para calcular la función totiente
%         int phi = Totient(m);
%         Console.WriteLine($"La función totiente de Euler φ({m}) es: {phi}");
%     }

%     static int Totient(int m)
%     {
%         if (m <= 1) return 1; // Caso base
%         return TotientAcc(m, m, 0); // Llamada a la función auxiliar
%     }

%     static int TotientAcc(int m, int k, int acc)
%     {
%         if (k == 0) return acc; // Caso base de acumulación
%         if (AreCoprime(m, k)) // Verifica si son coprimos
%             return TotientAcc(m, k - 1, acc + 1); // Aumenta el acumulador
%         return TotientAcc(m, k - 1, acc); // Llama sin aumentar el acumulador
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
