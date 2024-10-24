% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que compara
%              dos métodos para calcular la 
%              función totiente de Euler.
% ===============================================

% Compara los dos métodos para calcular la función totiente.
compare_totient(N) :- 
    totient(N, Phi1), 
    totient_improved(N, Phi2), 
    write('Phi (método básico): '), write(Phi1), nl, 
    write('Phi (método mejorado): '), write(Phi2), nl.

% Ejemplo de uso:
% ?- compare_totient(28).
% Phi (método básico): 12
% Phi (método mejorado): 12
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que compara 
%              dos métodos para calcular la 
%              función totiente de Euler.
% ===============================================

% using System;

% class Program
% {
%     static void Main()
%     {
%         int number = 28; // Número para calcular la función totiente
%         int phiBasic = Totient(number); // Método básico
%         int phiImproved = TotientImproved(PrimeFactorsMult(number)); // Método mejorado

%         Console.WriteLine($"Phi (método básico): {phiBasic}");
%         Console.WriteLine($"Phi (método mejorado): {phiImproved}");
%     }

%     // Implementación del método básico para calcular la función totiente
%     static int Totient(int n)
%     {
%         int result = 1;
%         for (int i = 2; i < n; i++)
%         {
%             if (Gcd(n, i) == 1) result++; // Incrementa el resultado si i es coprimo con n
%         }
%         return result;
%     }

%     // Método para calcular el máximo común divisor (GCD)
%     static int Gcd(int a, int b)
%     {
%         while (b != 0)
%         {
%             int temp = b;
%             b = a % b;
%             a = temp;
%         }
%         return a;
%     }

%     // Reutilización de los métodos existentes
%     static List<(int factor, int multiplicity)> PrimeFactorsMult(int n) { /* Implementación como antes */ }
%     static int TotientImproved(List<(int factor, int multiplicity)> factors) { /* Implementación como antes */ }
% }
