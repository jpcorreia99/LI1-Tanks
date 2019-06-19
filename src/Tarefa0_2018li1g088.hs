-- | Este módulo define funções genéricas sobre vetores e matrizes, que serão úteis na resolução do trabalho prático.
module Tarefa0_2018li1g088 where

import LI11819
import Data.List

-- * Funções não-recursivas.

-- | Um 'Vetor' é uma 'Posicao' em relação à origem.
type Vetor = Posicao
-- ^ <<http://oi64.tinypic.com/mhvk2x.jpg vetor>>

-- ** Funções sobre vetores

-- *** Funções gerais sobre 'Vetor'es.

-- | Soma dois 'Vetor'es.
somaVetores :: Vetor -> Vetor -> Vetor
somaVetores (x1,y1) (x2,y2) = (x1+x2,y1+y2)

-- | Subtrai dois 'Vetor'es.
subtraiVetores :: Vetor -> Vetor -> Vetor
subtraiVetores (x1,y1) (x2,y2)= (x1-x2,y1-y2)

-- | Multiplica um escalar por um 'Vetor'.
multiplicaVetor :: Int -> Vetor -> Vetor
multiplicaVetor n (x1,y1) = (n*x1, n*y1)


-- | Roda um 'Vetor' 90º no sentido dos ponteiros do relógio, alterando a sua direção sem alterar o seu comprimento (distância à origem).
--
rodaVetor :: Vetor -> Vetor
rodaVetor (l,c)= (c,-l)

-- | Espelha um 'Vetor' na horizontal (sendo o espelho o eixo vertical).
--
-- <<http://oi63.tinypic.com/jhfx94.jpg inverteVetorH>>
inverteVetorH :: Vetor -> Vetor
inverteVetorH (l,c) = (l,-c)

-- | Espelha um 'Vetor' na vertical (sendo o espelho o eixo horizontal).
--
-- <<http://oi68.tinypic.com/2n7fqxy.jpg inverteVetorV>>
inverteVetorV :: Vetor -> Vetor
inverteVetorV (l,c)= (-l,c)

-- *** Funções do trabalho sobre 'Vetor'es.

-- | Devolve um 'Vetor' unitário (de comprimento 1) com a 'Direcao' dada.
direcaoParaVetor :: Direcao -> Vetor
direcaoParaVetor C = (-1,0)
direcaoParaVetor D = (0,1)
direcaoParaVetor E = (0,-1)
direcaoParaVetor B = (1,0)

-- ** Funções sobre listas

-- *** Funções gerais sobre listas.
--
-- Funções não disponíveis no 'Prelude', mas com grande utilidade.

-- | Verifica se o indice pertence à lista.
eIndiceListaValido :: Int -> [a] -> Bool
eIndiceListaValido n x= n < length x && n>=0

-- ** Funções sobre matrizes.

-- *** Funções gerais sobre matrizes.

-- | Uma matriz é um conjunto de elementos a duas dimensões.
--
-- Em notação matemática, é geralmente representada por:
--
-- <<https://upload.wikimedia.org/wikipedia/commons/d/d8/Matriz_organizacao.png matriz>>
type Matriz a = [[a]]

-- | Calcula a dimensão de uma matriz.
--
-- __NB:__ Note que não existem matrizes de dimensão /m * 0/ ou /0 * n/, e que qualquer matriz vazia deve ter dimensão /0 * 0/.
dimensaoMatriz :: Matriz a -> Dimensao
dimensaoMatriz [] = (0,0)
dimensaoMatriz [[]] =(0,0)
dimensaoMatriz m@(h:t) 
              |length h >0 = (length m, length h)
              |otherwise = (0,0)

-- | Verifica se a posição pertence à matriz.
ePosicaoMatrizValida :: Posicao -> Matriz a -> Bool 
ePosicaoMatrizValida (x,y) m = x < l && y< c && (x >= 0 && y >= 0)
                           where (l,c) = dimensaoMatriz m

-- | Verifica se a posição está numa borda da matriz.
eBordaMatriz :: Posicao -> Matriz a -> Bool
eBordaMatriz (x,y) m = ((x == (l-1) || (x==0) || (y==0) || y == (c-1)) && (x>=0 && y>=0)) 
                        where (l,c) = dimensaoMatriz m

-- *** Funções do trabalho sobre matrizes.

-- | Converte um 'Tetromino' (orientado para cima) numa 'Matriz' de 'Bool'.
--
-- <<http://oi68.tinypic.com/m8elc9.jpg tetrominos>>
tetrominoParaMatriz :: Tetromino -> Matriz Bool
tetrominoParaMatriz I = [[False, True, False, False],
                         [False, True, False, False],
                         [False, True, False, False],
                         [False, True, False, False]]

tetrominoParaMatriz J = [[False, True, False],
                         [False, True, False],
                         [True, True, False]]

tetrominoParaMatriz L = [[False, True, False],
                         [False, True, False],
                         [False, True, True]]

tetrominoParaMatriz O = [[True, True],
                        [True, True]]

tetrominoParaMatriz S = [[False, True, True],
                         [True, True, False],
                         [False, False, False]]

tetrominoParaMatriz T = [[False, False, False],
                         [True, True, True],
                         [False, True, False]]


tetrominoParaMatriz Z = [[True, True, False],
                         [False, True, True],
                         [False, False, False]]



-- * Funções recursivas.

-- ** Funções sobre listas.
-- | Devolve o elemento num dado índice de uma lista.
encontraIndiceLista :: Int -> [a] -> a
encontraIndiceLista 0 (h:t) = h
encontraIndiceLista x (h:t)= encontraIndiceLista (x-1) t

-- | Modifica um elemento num dado índice.
-- __NB:__ Devolve a própria lista se o elemento não existir.
atualizaIndiceLista :: Int -> a -> [a] -> [a]
atualizaIndiceLista 0 x (h:t) = x : t 
atualizaIndiceLista  n x (h:t)= [h] ++ atualizaIndiceLista (n-1) x t
atualizaIndiceLista n x [] = []
-- | Aplica uma função apenas ao elemento da lista correspondente ao índice dado
mudaIndiceLista :: Int -> (a -> a) -> [a] -> [a]
mudaIndiceLista i f [] = []
mudaIndiceLista 0 f (h:t) = (f h) : t
mudaIndiceLista i f (h:t) =  h : mudaIndiceLista (i-1) f t  

-- ** Funções sobre matrizes.

-- | Roda uma 'Matriz' 90º no sentido dos ponteiros do relógio.
--
-- <<http://oi68.tinypic.com/21deluw.jpg rodaMatriz>>
rodaMatriz :: Matriz a -> Matriz a
rodaMatriz [] = []
rodaMatriz m =  transpose (inverteMatrizV m)

-- | Inverte uma 'Matriz' na horizontal.
--
-- <<http://oi64.tinypic.com/iwhm5u.jpg inverteMatrizH>>
inverteMatrizH :: Matriz a -> Matriz a
inverteMatrizH [] = []
inverteMatrizH ([]:t) = ([]:t)
inverteMatrizH m@((h:t):c) =  if length (h:t) >0 then reverse (h:t) : inverteMatrizH c else ((h:t):c)


-- | Inverte uma 'Matriz' na vertical.
--
-- <<http://oi64.tinypic.com/11l563p.jpg inverteMatrizV>>
inverteMatrizV :: Matriz a -> Matriz a
inverteMatrizV [] = []
inverteMatrizV (h:t)= inverteMatrizV t ++ [h]

-- | Cria uma nova 'Matriz' com o mesmo elemento.
criaMatriz :: Dimensao -> a -> Matriz a 
criaMatriz (0,0) n = []
criaMatriz (0,_) n = []
criaMatriz (x,y) n = [replicate y n] ++ criaMatriz (x-1,y) n

-- | Devolve o elemento numa dada 'Posicao' de uma 'Matriz'.
encontraPosicaoMatriz :: Posicao -> Matriz a -> a
encontraPosicaoMatriz (0,0) (h:t) = head h
encontraPosicaoMatriz (0,y) ((h:t):c) = encontraPosicaoMatriz (0,y-1) [t] 
encontraPosicaoMatriz (x,y) ((h:t):c) = encontraPosicaoMatriz (x-1,y) c 

-- | Modifica um elemento numa dada 'Posicao'
--
-- __NB:__ Devolve a própria 'Matriz' se o elemento não existir.
atualizaPosicaoMatriz :: Posicao -> a -> Matriz a -> Matriz a
atualizaPosicaoMatriz (0,y) n ((h:t):c) = atualizaIndiceLista (y) n (h:t) :c
atualizaPosicaoMatriz (x,y) n ((h:t):c) =  (h:t) : atualizaPosicaoMatriz (x-1,y) n c 
