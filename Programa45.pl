% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol 
%              binario completamente equilibrado con N nodos.
% ===============================================

% Un árbol completamente equilibrado tiene subárboles 
% cuya diferencia de tamaño es como máximo 1.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1, 
    divide(N1, N2, N3), 
    cbal_tree(N2, L), 
    cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2, 
    N2 is N - N1.

% Ejemplo de uso:
% ?- cbal_tree(7, Tree).
% Tree = t('x', t('x', t('x', nil, nil), t('x', nil, nil)), 
%              t('x', t('x', nil, nil), t('x', nil, nil))).
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que construye un árbol 
%              binario completamente equilibrado con N nodos.
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
%         int nodos = 7; // Número de nodos
%         Nodo raiz = ConstruirArbolEquilibrado(nodos);
%         // Aquí puedes implementar la lógica para imprimir el árbol.
%     }

%     static Nodo ConstruirArbolEquilibrado(int n)
%     {
%         if (n == 0) return null;

%         Nodo nuevoNodo = new Nodo('x');
%         int nodosIzquierda = n / 2;
%         int nodosDerecha = n - nodosIzquierda - 1;

%         nuevoNodo.Izquierda = ConstruirArbolEquilibrado(nodosIzquierda);
%         nuevoNodo.Derecha = ConstruirArbolEquilibrado(nodosDerecha);

%         return nuevoNodo;
%     }
% }
