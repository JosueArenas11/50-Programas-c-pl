% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que calcula 
%              la función totiente de Euler 
%              usando factores primos con 
%              multiplicidad para mejorar la 
%              eficiencia.
% ===============================================

% Calcula la función totiente usando los factores primos con multiplicidad para mejorar la eficiencia.
totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

% Caso base: la multiplicidad vacía devuelve 1.
totient_phi([], 1).
% Calcula el valor de la función totiente usando la fórmula φ(n) = n * Π (1 - 1/p) para cada factor primo.
totient_phi([[P, M]|T], Phi) :- 
    totient_phi(T, Phi1), 
    Phi is Phi1 * (P - 1) * P ** (M - 1).

% Ejemplo de uso:
% ?- totient_improved(28, Phi).
% Phi = 12.
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que calcula 
%              la función totiente de Euler 
%              usando factores primos con 
%              multiplicidad para mejorar la 
%              eficiencia.
% ===============================================

% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     static void Main()
%     {
%         int number = 28; // Número para calcular la función totiente
%         var factorsWithMultiplicity = PrimeFactorsMult(number);
%         int totient = TotientImproved(factorsWithMultiplicity);
%         Console.WriteLine($"La función totiente de {number} es: {totient}");
%     }

%     static List<(int factor, int multiplicity)> PrimeFactorsMult(int n)
%     {
%         var factors = new List<(int, int)>();
%         for (int factor = 2; factor <= n; factor++)
%         {
%             int count = 0;
%             while (n % factor == 0)
%             {
%                 count++;
%                 n /= factor;
%             }
%             if (count > 0)
%             {
%                 factors.Add((factor, count)); // Añade el factor y su multiplicidad
%             }
%         }
%         return factors; // Retorna la lista de factores primos con multiplicidad
%     }

%     static int TotientImproved(List<(int factor, int multiplicity)> factors)
%     {
%         double result = 1.0;
%         foreach (var (factor, multiplicity) in factors)
%         {
%             result *= (factor - 1) * Math.Pow(factor, multiplicity - 1); // Calcula φ usando la fórmula
%         }
%         return (int)result; // Retorna el resultado como un entero
%     }
% }
