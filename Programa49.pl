% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que genera todos los árboles 
%              binarios simétricos y completamente equilibrados con 
%              N nodos.
% ===============================================

% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
% Utiliza el paradigma de generar y probar para encontrar todos los árboles que cumplen 
% ambas propiedades.
sym_cbal_trees(N, Ts) :- findall(T, (cbal_tree(N, T), symmetric(T)), Ts).

% Función para construir un árbol completamente equilibrado (cbal_tree) y verificar su simetría.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- N > 0, N1 is N - 1, divide(N1, N2, N3), cbal_tree(N2, L), cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- N1 is N // 2, N2 is N - N1.

% Ejemplo de uso:
% ?- sym_cbal_trees(4, Ts).
% Ts = [t('x', t('x', t('x', nil, nil), nil), t('x', nil, t('x', nil, nil))) | ...].
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que genera todos los árboles 
%              binarios simétricos y completamente equilibrados con 
%              N nodos.
% ===============================================

% using System;
% using System.Collections.Generic;

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
%         int N = 4; // Número de nodos
%         List<Nodo> arboles = new List<Nodo>();
%         SymCbalTrees(N, arboles);
%         // Aquí puedes imprimir o usar los árboles generados
%     }

%     static void SymCbalTrees(int N, List<Nodo> arboles)
%     {
%         List<Nodo> cbalTrees = new List<Nodo>();
%         CbalTrees(N, cbalTrees);
%         foreach (var tree in cbalTrees)
%         {
%             if (EsSimetrico(tree))
%             {
%                 arboles.Add(tree);
%             }
%         }
%     }

%     static void CbalTrees(int N, List<Nodo> arboles)
%     {
%         if (N == 0)
%         {
%             arboles.Add(null);
%             return;
%         }
%         for (int i = 0; i <= N; i++)
%         {
%             int left = i;
%             int right = N - 1 - i;
%             foreach (var leftTree in CbalTreesRec(left))
%             {
%                 foreach (var rightTree in CbalTreesRec(right))
%                 {
%                     arboles.Add(new Nodo('x') { Izquierda = leftTree, Derecha = rightTree });
%                 }
%             }
%         }
%     }

%     static List<Nodo> CbalTreesRec(int N)
%     {
%         List<Nodo> arboles = new List<Nodo>();
%         CbalTrees(N, arboles);
%         return arboles;
%     }

%     static bool EsSimetrico(Nodo nodo)
%     {
%         return nodo == null || EsEspejo(nodo.Izquierda, nodo.Derecha);
%     }

%     static bool EsEspejo(Nodo a, Nodo b)
%     {
%         if (a == null && b == null) return true;
%         if (a == null || b == null) return false;
%         return a.Valor == b.Valor && EsEspejo(a.Izquierda, b.Derecha) && EsEspejo(a.Derecha, b.Izquierda);
%     }
% }
