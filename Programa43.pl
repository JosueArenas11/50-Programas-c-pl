% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que genera el 
%              código Gray de N bits.
% ===============================================

% La secuencia de código Gray es una secuencia binaria en la que
% dos valores consecutivos difieren en solo un bit.

gray(1, ['0', '1']).
gray(N, C) :- 
    N > 1, 
    N1 is N - 1, 
    gray(N1, C1), 
    maplist(atom_concat('0'), C1, C0), 
    reverse(C1, C1R), 
    maplist(atom_concat('1'), C1R, C1G), 
    append(C0, C1G, C).

% Ejemplo de uso:
% ?- gray(3, C).
% C = ['000', '001', '011', '010', '110', '111', '101', '100'].
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que genera el 
%              código Gray de N bits.
% ===============================================

% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Genera el código Gray de N bits.
%     static List<string> GrayCode(int n)
%     {
%         if (n == 1)
%             return new List<string> { "0", "1" };

%         var previous = GrayCode(n - 1);
%         var result = new List<string>();

%         // Añadir '0' al prefijo de la primera mitad
%         foreach (var code in previous)
%         {
%             result.Add("0" + code);
%         }

%         // Añadir '1' al prefijo de la segunda mitad en orden inverso
%         for (int i = previous.Count - 1; i >= 0; i--)
%         {
%             result.Add("1" + previous[i]);
%         }

%         return result;
%     }

%     static void Main()
%     {
%         int n = 3; // Número de bits
%         var grayCodes = GrayCode(n);

%         foreach (var code in grayCodes)
%         {
%             Console.WriteLine(code);
%         }
%     }
% }
