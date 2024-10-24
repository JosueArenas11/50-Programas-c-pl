% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol 
%              binario equilibrado en altura con una altura dada.
% ===============================================

% Construye un árbol binario equilibrado en altura con una altura dada.
% Un árbol equilibrado en altura tiene subárboles cuya diferencia de altura es como máximo 1.
hbal_tree(0, nil).
hbal_tree(H, t('x', L, R)) :- H > 0, H1 is H - 1, H2 is H1 - 1, hbal_tree(H1, L), hbal_tree(H2, R).

% Ejemplo de uso:
% ?- hbal_tree(3, T).
% T = t('x', t('x', t('x', nil, nil), nil), t('x', nil, t('x', nil, nil))).
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que construye un árbol 
%              binario equilibrado en altura con una altura dada.
% ===============================================

% using System;

% class Nodo
% {
%     public char Valor { get; set; }
%     public Nodo Izquierda { get; set; }
%     public Nodo Derecha { get; set; }

%     public Nodo(char valor)
%     {
%         Valor = valor;
%         Izquierda = null;
%         Derecha = null;
%     }
% }

% class Program
% {
%     static void Main()
%     {
%         int altura = 3; // Altura del árbol
%         Nodo raiz = HbalTree(altura);
%         // Aquí puedes implementar un recorrido del árbol para mostrarlo.
%     }

%     static Nodo HbalTree(int H)
%     {
%         if (H == 0) return null; // Caso base: altura 0 devuelve nil
%         Nodo nodo = new Nodo('x'); // Crear un nuevo nodo
%         nodo.Izquierda = HbalTree(H - 1); // Subárbol izquierdo
%         nodo.Derecha = HbalTree(H - 2); // Subárbol derecho
%         return nodo;
%     }
% }
