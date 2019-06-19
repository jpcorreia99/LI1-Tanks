-- | Este módulo define funções comuns da Tarefa 3 do trabalho prático.
{-# OPTIONS_HADDOCK prune #-}
module Tarefa3_2018li1g088 where

import LI11819
import Data.Char
import Tarefa0_2018li1g088
import Tarefa1_2018li1g088
import Tarefa2_2018li1g088

-- * Introdução
-- | Nesta Tarefa foi-nos colocado o objetivo de comprimir o 'Estado' o mais possível sob a forma de uma string, sendo, posteriormente, possível descomprimir essa string sem que se perdesse informação.
--
--
--  Nesta tarefa o maior desafio foi o de comprimir o mapa pois diferentes métodos teriam diferentes eficácias para diferentes tipos de mapas
--


testesT3 :: [Estado]
testesT3 =  [t3_1,t3_2,t3_3,t3_4,t3_5,t3_6,t3_7,t3_8,t3_9,t3_10,t3_11,t3_11]
t3_1= (Estado (mapaInicial (30,30)) [(Jogador (1,1) C 1 1 1), (Jogador (4,4) B 1 0 0), (Jogador (7,9) E 5 2 10)] [(DisparoChoque 2 0), (DisparoLaser 1 (3,9) B), (DisparoCanhao 0 (13,19) B)])
l1 = [Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move D,Move E,Desenha,Move C,Roda,Move B,Move B,Roda,Roda,Move B,Move B,Move B,Move B,Roda,Roda,Roda,Roda,Desenha,Move C,Move C,Move D,Move E,Roda,Move B,Move B,Roda,Move C,Roda,Roda,Roda,Move B,Desenha,Move C,Move C,Move C,Move C,Move D,Move D,Move D,MudaParede,Move B,Move B,Move B,Move B,Desenha,Move C,Move C,Move C,Move C,Move D,Move D,Move D,Move D,Roda,MudaTetromino,Roda,Roda,Move B,Move D,Move D,Move D,Move D,Move B,Move B,Move B,Move B,MudaParede,Desenha,Move C,Move C]
t3_2 =(Estado (constroi l1) [(Jogador (2,1) D 2 3 4), (Jogador (4,4) B 0 19 88), (Jogador (7,9) E 22 33 44), (Jogador (2,3) D 2 3 4)] [(DisparoChoque 2 0), (DisparoLaser 1 (3,9) B), (DisparoCanhao 0 (4,4) B)])
t3_3 = (Estado (mapaInicial (35,55)) [] [])
t3_4 = (Estado (mapaInicial (99,9)) [(Jogador (1,1) B 1 1 1), (Jogador (3,3) D 2 2 2)] [DisparoCanhao 1 (5,5) B])
t3_5 = (Estado (mapaInicial (30,70)) [(Jogador (1,1) B 1 1 1), (Jogador (9,5) D 8 6 22), (Jogador (5,5) C 10 23 54)] [(DisparoCanhao 1 (10,10) B), (DisparoCanhao 2 (15,7) D)])
t3_6 = (Estado (mapaInicial (40,80)) [(Jogador (1,1) B 1 1 1), (Jogador (3,3) D 2 2 2), (Jogador (10,10) E 2 33 33), (Jogador (17,17) E 3 4 5)] [(DisparoCanhao 1 (10,10) B),(DisparoCanhao 2 (15,7) D), (DisparoCanhao 3 (20,20) B)])
t3_7 = (Estado (mapaInicial (90,14)) [(Jogador (1,1) B 1 1 1), (Jogador (3,3) D 2 2 2)] [DisparoLaser 0 (10,10) B])
t3_8 = (Estado (mapaInicial (30,70)) [(Jogador (1,1) B 1 1 1), (Jogador (9,5) D 8 6 22), (Jogador (5,5) C 10 23 54)] [(DisparoCanhao 1 (10,10) B), (DisparoLaser 1 (15,7) D)])
t3_9 = (Estado (mapaInicial (40,80)) [(Jogador (1,1) B 1 1 1), (Jogador (3,3) D 2 2 2), (Jogador (10,10) E 2 33 33), (Jogador (17,17) E 3 4 5)] [(DisparoCanhao 1 (10,10) B),(DisparoLaser 2 (15,7) D), (DisparoCanhao 3 (20,20) B)])
t3_10 = (Estado (mapaInicial (40,80)) [(Jogador (1,1) B 1 1 1), (Jogador (3,3) D 2 2 2), (Jogador (10,10) E 2 33 33), (Jogador (17,17) E 3 4 5)] [(DisparoCanhao 1 (10,10) B),(DisparoLaser 2 (15,7) D), (DisparoLaser 3 (20,20) B)])
l2 = [Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move D,Move B,Move B,Desenha,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Roda,Move D,Move C,Desenha,Move B,Move B,Move B,MudaParede,Desenha,Move D,Move D,Move D,Move D,Roda,Move C,Move C,Desenha,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Roda,Move D,Move D,Move C,Move C,Move D,Move D,Move E,Move E,Desenha,Move B,Move B,Move B,MudaParede,Desenha,Move B,Move E,Move E,Move B,Move E,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move E,Move E,Move E,MudaTetromino,Move C,Move E,Move C,Move E,Move C,Move E,Move E,Move E,Move E,Desenha,Move D,Move D,Move D,Move D,MudaParede,Move B,Move B,Move E,Move E,Move B,Move E,Move E,Move E,Move D,Move B,Desenha,Move D,Move D,Move D,Move D,Move C,Move C,Move C,Roda,Move D,Desenha,Move B,Move B,Move B,MudaParede,Move D,Move D,Move D,Move D,Move C,Move D,Move C,Move C,Move C,Move E,Move B,Desenha,Move B,Move B,Move B,Move E,Move B,Move E,Move E,Roda,Move E,Move B,Desenha,Move D,Move D,Move D,Move D,MudaParede,Move D,Desenha,Move D,Move D,Move C,Move C,Move C,Move C,Roda,Move D,Move C,Move E,Desenha,MudaParede,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move D,Move B,Desenha,MudaParede,Move D,Move D,Move D,Move D,Desenha,Move D,Move D,Move D,Move D,Move D,Move E,Roda,Desenha,MudaParede,Move B,Move B,Move B,Move B,Desenha,Move D,Move D,Move D,Move D,Move D,Move C,Move C,Move C,Move C,Move C,Roda,Move E,Move B,Desenha,Move D,Move D,Move D,MudaParede,Move D,Desenha,Move C,Roda,Move C,Move C,Move C,Move C,Move E,Desenha,Move D,Move D,Move D,MudaParede,Move D,Move D,Move D,Move D,Move E,Move E,Move C,Move C,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Move B,Desenha,MudaParede,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Move E,Desenha,Move B,Move B,Move B,Move E,Move E,Move B,Move E,MudaTetromino,Move E,Desenha,Move D,Move D,Move D,Move D,Roda,Roda,Roda,Roda,MudaParede,Move D,Move D,Move E,Move E,Desenha,Move C,Move C,Move C,Roda,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move B,Move C,Move C,Move C,Move C,Move E,Move E,Move D,Desenha,MudaParede,Move C,Move C,Move C,Move C,Move D,Desenha,Move B,Move B,Roda,Move D,Move D,Move D,Move D,Move D,Move C,Move D,Move E,Move C,Desenha,Move B,Move B,Move B,MudaParede,Move B,Move B,Desenha,Move B,Move B,Move B,Move B,Move B,Roda,Move E,Move E,Move E,Move E,Move E,Move C,Move D,Desenha,MudaParede,Move D,Move D,Move D,Move D,Move B,Move B,Move E,Move B,Desenha,Move B,Move B,MudaTetromino,Move B,Move D,Move D,Move D,Move D,Move E,Move E,Move E,Move E,Move D,Desenha,Move B,Move B,Move D,Move D,Move D,Move B,MudaParede,Move D,Move E,Move D,Move D,Move D,Move D,Move E,Move E,Move E,Move C,Move D,Desenha,Move C,Move C,Roda,Move C,Move C,Desenha,MudaParede,Move C,Move C,Move C,Move C,Move C,Move C,Move B,Desenha,Move C,Move C,Move C,Roda,Move C,Move E,Desenha,Move D,Move C,Move C,MudaParede,Move C,Move C,Move E,Desenha,Move B,Roda,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Move E,Move C,Move E,Desenha,Move B,Move B,Move B,Move B,MudaParede,Move B,Move D,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Move B,Desenha,Move B,Move B,Move B,Move B,MudaParede,Move B,Move D,Desenha,Move B,Move B,Move B,Roda,Move B,Move B,Move B,Move B,Move C,Move C,Move E,Move B,Desenha,Move E,Move E,Move E,Move E,MudaParede,Move E,Move E,Move E,Desenha,Move E,Move E,Move E,Move E,Roda,Move E,Move C,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Desenha,Move E,Move E,MudaParede,Move E,Move E,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Roda,Move E,Desenha,MudaParede,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move D,Move D,Desenha,MudaTetromino,Move C,Move C,Move C,Move C]
t3_11 = (Estado (mapaInicial (99,99)) [(Jogador (6,2) C 1 1 1), (Jogador (7,7) E 22 4 50), (Jogador (12,12) B 12 12 1)] [(DisparoChoque 2 0),(DisparoLaser 0 (6,2) D), (DisparoCanhao 1 (13,12) B)])
t3_12 = Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = D, vidasJogador = 5, lasersJogador = 0, choquesJogador = 1},Jogador {posicaoJogador = (2,64), direcaoJogador = E, vidasJogador = 5, lasersJogador = 0, choquesJogador = 0}], disparosEstado = [DisparoChoque {jogadorDisparo = 0, tempoDisparo = 2},DisparoChoque {jogadorDisparo = 1, tempoDisparo = 4},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,2), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,3), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,4), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,5), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,6), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,7), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,8), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,9), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,10), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,11), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,12), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,13), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,14), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,15), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,16), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,17), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,18), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,19), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,20), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,21), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,22), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,23), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,24), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,25), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,26), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,27), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,28), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,29), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,30), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,31), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,32), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,33), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,34), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,35), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,36), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,37), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,38), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,39), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,40), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,41), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,42), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,43), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,44), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,45), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,46), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,47), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,48), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,49), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,50), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,51), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,52), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,53), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,54), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,55), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,56), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,57), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,58), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,59), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,60), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,61), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,62), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,63), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,2), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,3), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,4), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,5), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,6), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,7), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,8), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,9), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,10), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,11), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,12), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,13), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,14), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,15), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,16), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,17), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,18), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,19), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,20), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,21), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,22), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,23), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,24), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,25), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,26), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,27), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,28), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,29), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,30), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,31), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,32), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,33), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,34), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,35), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,36), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,37), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,38), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,39), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,40), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,41), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,42), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,43), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,44), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,45), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,46), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,47), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,48), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,49), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,50), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,51), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,52), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,53), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,54), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,55), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,56), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,57), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,58), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,59), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,60), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,61), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,62), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,63), direcaoDisparo = E}]}

-- * Objetivos

-- ** Funções principais da Tarefa 3 (Compressão)

-- | Comprime um 'Estado' para formato textual.
--
-- A compressão será dividida em três:
-- 
--      * __Compressão do 'Mapa'__: Será usada a função 'comprime_mapa'
--
--      * __Compressão dos 'Jogador'es__: Será usada a função 'comprime_jogadores'
--
--      * __Compressao dos 'Disparo's__: Será usada a função 'comprime_disparos'


comprime :: Estado -> String
comprime (Estado mapa l_jogadores l_disparos) = comprime_mapa (Estado mapa l_jogadores l_disparos) ++ comprime_jogadores l_jogadores ++ comprime_disparos l_disparos

-- *** Funções de compressão do mapa

-- | Dado um 'Estado', comprime o seu mapa, utilizando a função ord em que o sexto dígito de um caracter corresponde ao tipo de parede enquanto os restantes correspondem ao número de vezes que esse bloco aparece
--
-- __Passos da compressão do mapa__ :
--
-- 1. Colocar no primeiro caracter a informação do nº de jogadores no dígito das centenas de milhar, o nº de linhas do mapa nas centenas e o nº de colunas nas unidades
--
-- 2. Retirar ao mapa as bordas usando a função 'mapa_borderless'
--
-- 3. Transformar o mapa numa lista de peças
--
-- 4. Transformar essa lista de peças em caracteres, usando a função 'constroi_string_pecas'
--
-- 5. Melhorar essa string que comprimiu as peças, usando a função 'melhora_string_peças'
--
--  __Exemplos de compressão das peças__: 
--
--    * \\ \100017 corresponde a 17 'Vazia'
--
--    * \\ \200111 corresponde a 111 Bloco Indestrutivel 
--
--    * \\ \400045 corresponde a 45 Vazias seguidas de um Bloco Indestrutível 
--
-- __Nota__: Cada caracter da compressão do mapa terá 6 digitos, isto será importante para depois separar a string que comprime o mapa da string que comprime os jogadores, na qual cada caracter só terá 5 dígitos, isto é feito para poupar caracteres de separação da informação


comprime_mapa :: Estado -> String
comprime_mapa (Estado m l_jogadores l_disparos) =  chr (length (l_jogadores) *100000 +  fst (dimensaoMatriz m)*100 + snd (dimensaoMatriz m)) : (melhora_string_pecas(constroi_string_pecas (concat (mapa_borderless m))))

-- **** Funções auxiliares à compressão do mapa

{- | Visto no mapa ocorrer bastantes vezes o caso de após x blocos vazios ocorrer um único bloco Destrutivel ou Industrutível, registou-se com um número esses casos
--
--  * \4xxxxx corresponde a xxxxx peças vazias seguidas de um bloco Indestrutível
--
--  * \5xxxxx corresponde a xxxxx peças vazias seguidas de um bloco Destrutível
-}
melhora_string_pecas :: [Char] ->  [Char]
melhora_string_pecas [] = []
melhora_string_pecas [x] = [x]
melhora_string_pecas (x:y:t) = let p1_1 = (div (ord x) 100000)
                                   p1_2 = (mod (ord x) 100000)
                                   p2_1 = (div (ord y) 100000)
                                   p2_2 = (mod (ord y) 100000)
                                in if p1_1 == 1 && p2_2 == 1 then chr ((p2_1 + 2) *100000 + p1_2) : melhora_string_pecas t else x: melhora_string_pecas (y:t)


-- | Faz corresponder uma peça a um número que servirá para simbolizar essa peça
passa_parede_int :: Peca -> Int
passa_parede_int Vazia = 1
passa_parede_int (Bloco Indestrutivel) = 2
passa_parede_int (Bloco Destrutivel) = 3


-- | Irá percorrer uma lista onde se encontram todas as peças do mapa e irá comprimi todas as peças iguais e seguidas num único dígito yxxxxx 
--
--  * __y__ - digito correspondente ao caracter, através da função passa_parede_int
--
--  * __xxxx__ - número de peças seguidas dessa peça
constroi_string_pecas :: [Peca] -> [Char]
constroi_string_pecas l = aux 1 l
                    where
                    aux i [x] = [chr (passa_parede_int(x)*100000 + i)]
                    aux i (h1:h2:t) 
                     | h1 == h2 = aux (i+1) (h2:t)
                     | otherwise = (chr (passa_parede_int (h1) *100000 + i)) : (aux 1 (h2:t))  

-- | Retira as bordas da matriz para melhor compressão

mapa_borderless :: Mapa -> Mapa
mapa_borderless m = aux (map (elimina_primeiro_ultimo_lista) m) (length m) 0
                    where
                     aux (h:t) dim_l 0 = aux t dim_l 1
                     aux (h:t) dim_l i 
                      | i == dim_l-1 = []
                      | otherwise = h : (aux t dim_l (i+1))  

-- | Dada uma lista devolve essa lista sem o primeiro e o último elemento, servirá como auxiliar ao retirar à função 'mapa_borderless'
elimina_primeiro_ultimo_lista :: [a] -> [a]
elimina_primeiro_ultimo_lista l = aux l 0
                                  where 
                                  aux [x] i = []
                                  aux (h:t) i  
                                    | i == 0 = aux t (i+1)
                                    | otherwise = h: (aux t (i+1))


-- *** Funções de compressão de jogadores

-- | A informação de cada jogador será comprimida em dois caracteres:
--
--   * O primeiro contém  a 'direcaoJogador', assim como 'lasersJogador' e 'choquesJogador'
--
--   * O segundo contém a 'posicaoJogador' e as 'vidasJogador'
--
--  __Nota__: Para comprimir os três valores num só caracter será usada a função 'comprime_tres_valores'
--
--  __Nota__: O primeiro caracter dos dois que comprimem a informnação de um jogador terá 5 dígitos, o que ajudará na separação da string, posteriormente.

comprime_jogadores :: [Jogador] -> String
comprime_jogadores [] = []
comprime_jogadores ((Jogador (l,c) dir vid las cho):t) = (comprime_tres_valores (passa_direcao_int dir) las cho) :  (comprime_tres_valores vid l c)   : comprime_jogadores t

-- | Dados três valores devolve um dígito em que nas dezenas de milhar está contida uma informação, nas centenas outra e nas unidades outra
comprime_tres_valores :: Int -- ^ Int correspondente à 'Direcao' ou 'vidasJogador'
                      -> Int -- ^ 'lasersJogador' ou as linhas das coordenadas
                      -> Int -- ^ 'choquesJogador' ou as colunas das coordenadas
                      -> Char -- ^ 'Char' que nos seus dígitos contém as infromações dadas
comprime_tres_valores z x y = chr (z*10000 + x*100 + y)


-- *** Funções de compressão de disparos

-- | Comprime uma lista de disparos em string, o caracter 'DisparoLaser' ou um 'DisparoCanhao' terá 6 digitos enquanto o 'DisparoChoque' terá 3
-- 
--  * No caso do Canhao e do Laser
--
--  prop> \kxyyzz 
--
--  __k__:   numero dado pela função 'passa_jogador_disparo_int' que indica qual o jogador que disparou assim como o tipo de disparo
--
--  __x__:  número correspondente à direção dado por 'passa_direcao_int'
--
--  __yyxx__: y  coordenadas do disparo
--
--  * No caso do Choque
--
--  prop> \xy 
--
--  __x__: numero do jogador
--
--  __y__:  número de ticks


comprime_disparos :: [Disparo] -> String
comprime_disparos [] = []
comprime_disparos ((DisparoCanhao j (l,c) d):t) = junta_disparo_string (DisparoCanhao j (l,c) d) ++ comprime_disparos t
comprime_disparos ((DisparoLaser j (l,c) d):t) = junta_disparo_string (DisparoLaser j (l,c) d) ++ comprime_disparos t
comprime_disparos ((DisparoChoque j tick):t) = junta_disparo_string (DisparoChoque j tick) ++ comprime_disparos t


-- **** Funções auxiliares à compressão de disparos

-- | Função que fará a transcrição de um disparo para um caracter
--
-- __Nota:__ Usará a função 'passa_jogador_disparo_int' e a função 'passa_direcao_int'  
junta_disparo_string :: Disparo -> String
junta_disparo_string (DisparoCanhao j (l,c) d) =  [chr (passa_jogador_disparo_int (DisparoCanhao j (l,c) d)+ passa_direcao_int d*10000+ l*100+c)]
junta_disparo_string (DisparoLaser j (l,c) d) =  [chr (passa_jogador_disparo_int (DisparoLaser j (l,c) d)+ passa_direcao_int d*10000+ l*100+c)]
junta_disparo_string (DisparoChoque j t) = [chr (j* 10 + t)]

-- | Função que dado um jogador e um disparo, visto só haver 2*3=8 possibilidades, comprime-as num só digito , (as centenas de milhar). que será adicionado ao resto da informação para formar um caracter. 
passa_jogador_disparo_int :: Disparo -> Int
passa_jogador_disparo_int (DisparoCanhao 0 p d) = 100000
passa_jogador_disparo_int (DisparoCanhao 1 p d) = 200000
passa_jogador_disparo_int (DisparoCanhao 2 p d) = 300000
passa_jogador_disparo_int (DisparoCanhao 3 p d) = 400000
passa_jogador_disparo_int (DisparoLaser  0 p d) = 500000
passa_jogador_disparo_int (DisparoLaser  1 p d) = 600000
passa_jogador_disparo_int (DisparoLaser  2 p d) = 700000
passa_jogador_disparo_int (DisparoLaser  3 p d) = 800000

-- | Função que dada uma direção  devolve um int correspondente
passa_direcao_int :: Direcao -> Int
passa_direcao_int C = 1
passa_direcao_int D = 2
passa_direcao_int B = 3
passa_direcao_int E = 4



-- ** Funções principais da Tarefa 3 (Descompressão)

-- | Descomprime uma 'String' para um 'Estado.
--
-- A descompressão será dividida em três:
-- 
--      * __Desompressão do 'Mapa'__: Será usada a função 'desccomprime_mapa'
--
--      * __Descompressão dos 'Jogador'es__: Será usada a função 'desccomprime_jogadores'
--
--      * __Descompressão dos 'Disparo's__: Será usada a função 'descomprime_disparos'
--
-- __Nota__:  A String será partida nas 3 string correspondentes a cada componente do estado usando a função 'parte_string' duas vezes. A primeira para separar a string correspondente ao mapa do resto, a segunda vez para separar a string dos jogadores da dos disparos 
descomprime :: String -> Estado
descomprime s = let (str_mapa, str_resto) = parte_string s
                    (str_jogadores, str_disparos) = parte_string_jogadores_disparos (head str_mapa) str_resto
                in (Estado (descomprime_mapa str_mapa) (descomprime_jogadores str_jogadores) (descomprime_disparos str_disparos))



-- *** Funções auxiliares à separação de strings
-- | Função que separa a string do mapa da restante
--
--  Como sabemos que todos os caracteres da string que comprime o mapa têm 6 digitos e que o primeiro caracter do jogador terá 5, podemos separar a string ao encontrar um caracter com 5 dígitos, ficando assim com uma string correspondente ào mapa e outra correspondente a toda a infromação restante (jogadores e disparos).
parte_string :: String -> (String, String)
parte_string s = aux ([],[]) (s)
                 where
                  aux x [] = x
                  aux (x,y) (h:t)
                   | length (show (ord h)) == 5 = (x,(h:t))
                   | otherwise = aux (x++[h],y) t

-- | Função que separa a string dos jogadores da dos disparos
--
-- O primeiro caracter da string que corresponde ao estado comprimido contém, no dígito das centenas de milhar, o número de Jogadores existentes no estado.
--
-- Sendo assim, e sabendo que a informação de cada jogador se encontra em dois caracteres, basta retirar à string que corresponde aos jogadores e disparos (resultante da função 'parte_string') x caracteres, em que x corresponde ao dobro dos jogadores do Estado.
--
-- A Função devolve assim a string separada em duas, usando o take e o drop, em que a primeira será a string dos jogadores e a segunda a string dos disparos.
parte_string_jogadores_disparos :: Char -> String -> (String,String)
parte_string_jogadores_disparos c [] = ([], [])
parte_string_jogadores_disparos c s = (take (( div (ord c) 100000 )*2) s, drop ((div (ord c) 100000)*2) s)

-- *** Funções de  descompressão do mapa

-- | Função que reúne todas as outras funções de descompilação do mapa e que faz a ponte entre todas elas
--
-- __Nota:__ O primeiro caracter da string contém informação sobre as dimensões do mapa e o número de jogadores e como tal é ignorado na descompressão das peças.
--
-- __Passos da descompressão__:
--
--  1. Reverter a simplificação dos caracteres, usando a função 'reverte_simplificacao'
--    __EX:__ \\ \400007 passa a \\ \100007 \\ \200001
--
--  2. Converter essa string de caracteres em peças, usando a função 'converte_string_pecas', tendo, como resultado, uma lista de Peças
--
--  3. Retirar, do primeiro caracter da string, as dimensões do mapa, usando a função 'string_para_dimensoes'
--
--  4. Tendo as dimensões do mapa e tendo uma lista de peças, reconstroi-se o mapa sem bordas, usando a função 'separa_lista_pecas'
-- 
--  5. Por fim, adicionam-se as bordas ao mapa, usando a função 'reconstroi_mapa'

descomprime_mapa :: String -> Mapa
descomprime_mapa s = reconstroi_mapa (separa_lista_pecas (string_para_dimensoes s) (converte_string_pecas (reverte_simplificacao(drop 1 s))))

-- **** Funções de auxílio à descompressão do mapas

-- | Função a que é fornecido o resultado da função 'separa_lista_pecas', que será o equivalente à matriz sem bordas e adiciona-lhe as bordas, para que a matriz do mapa fique completa
reconstroi_mapa :: [[Peca]] ->  Mapa
reconstroi_mapa [] = []
reconstroi_mapa (h:t) = ((replicate (length h+2) (Bloco Indestrutivel)) : aux (h:t)) ++ [(replicate (length h+2) (Bloco Indestrutivel))]
                              where 
                              aux [] = []
                              aux (h:t) = ([(Bloco Indestrutivel)] ++ h ++ [(Bloco Indestrutivel)] ): aux (t)


-- | Reverte a simplificação feita pela função 'melhora_string_pecas'
--
-- prop> '\400055' = "\100055\200001"
reverte_simplificacao :: [Char] -> String
reverte_simplificacao [] = []
reverte_simplificacao (h:t) = let n1 = div (ord h) 100000
                                  n2 = mod (ord h) 100000
                              in if n1 == 4 || n1 == 5 then (chr (100000 + n2)) : chr ((n1-2) * 100000 +1) : reverte_simplificacao t else h: reverte_simplificacao t

-- | Função que, dadas as dimensões do mapa, parte uma lista de peças em várias listas com as dimensões corretas, devolvendo a matriz do mapa sem as bordas
separa_lista_pecas:: Posicao -> [Peca] -> [[Peca]]
separa_lista_pecas _ [] = []
separa_lista_pecas (x,y) l  = take (y-2) l : separa_lista_pecas (x,y) (drop (y-2) l)


-- | Função que retorna a dimensão do mapa, que está codificada nos primeiros 4 dígitos do primeiro caracter
--
-- prop> '\205439' = (54,39)
string_para_dimensoes :: String -> Posicao
string_para_dimensoes (h:t) = let num = (ord h) - (div (ord h) 10000) * 100000
                              in (div num 100, mod num 100)

-- | Função que passará a string para uma lista de peças
--
-- __Nota:__ Utiliza a função 'converte_char_peca' para processar cada caracter
converte_string_pecas :: String -> [Peca]
converte_string_pecas [] = []
converte_string_pecas (h:t) =  converte_char_peca h ++ converte_string_pecas t

-- | Função que passa um caracter para a lista de peças correspondente
--
-- prop> '\200002' = [Bloco Indestrutivel, Bloco Indestrutivel]                   
converte_char_peca:: Char -> [Peca]
converte_char_peca c = let num = ord c
               in replicate (mod num 100000) (passa_int_parede (div num 100000))

-- | Função que, quando lhe é dado o 6º digito de um caracter, retorna que peça esse digito significava
passa_int_parede :: Int -> Peca 
passa_int_parede 1 = Vazia
passa_int_parede 2 = Bloco Indestrutivel
passa_int_parede 3 = Bloco Destrutivel

-------------------------------------------------
-- *** Funções de descompressão de jogadores
-- | Função que descomprime a informação relativa aos jogadores
--
-- __Nota:__ Em cada um dos dois caracteres que codificam um jogador, há três informações, que a função 'descomprime_tres_valores' irá fornecer a esta função
--
-- prop> \20304\20201 = (Jogador (2,1) D 2 3 4 )
descomprime_jogadores :: String -> [Jogador]
descomprime_jogadores [] = [] 
descomprime_jogadores s = let c1 = ((!!) s 0)
                              c2 = ((!!) s 1)
                              (dir,las,cho) = descomprime_tres_valores c1
                              (vid,l,c) = descomprime_tres_valores c2
                              direcao = passa_int_direcao dir
                          in  (Jogador (l,c) direcao vid las cho) :  descomprime_jogadores (drop 2 s)


-- | Função que de um caracter retirará três informações relativas a um jogador
--
-- Irá fazendo isto, passsando o caracter par aum valor numérico, usando a função ord, e ,a partir daí, vai dividindo-o sucessivamente para retirar certas partes do número
descomprime_tres_valores :: Char -> (Int,Int,Int)
descomprime_tres_valores x = let c = ord x
                                 n1 = div c 10000
                                 n2 = c -(n1 * 10000)
                                 n3 = div n2 100
                                 n4 = mod n2 100
                              in (n1,n3, n4)

-------------------------------------
-- *** Funções de descompressão de disparos
--
-- | Função que verifica se o caracter está a conter informação sobre um laser/canhão ousobre um choque e que age de acordo
--
-- __Nota:__ Um caracter que codifique um canhao/laser terá mais de 3 dígitos, oq eu não se verifica para um choque que só contém duas infromações
descomprime_disparos:: String -> [Disparo]
descomprime_disparos[] = []
descomprime_disparos s 
 | ord ((!!) s 0) > 1000 =  descomprime_disparo ((!!) s 0)  : descomprime_disparos (drop 1 s)
 | otherwise = (DisparoChoque (div (ord ((!!) s 0)) 10) (mod (ord ((!!) s 0)) 10)) :  descomprime_disparos (drop 1 s) 
 
-- | Os disparos de canhão têm uma identificação em que o sexto dígito é 4 enquanto um laser tem um número igual a 5, logo a função interpretará o caracter consoante esse número
--
-- __Nota:__ Chama a função 'retorna_info'
descomprime_disparo :: Char -> Disparo
descomprime_disparo x = let (j,d,l,c) = retorna_info x
                        in if div (ord x) 100000 < 5 then (DisparoCanhao j (l,c) d) else (DisparoLaser j (l,c) d)

-- | Dado um caracter, retira informação relativa ao jogador que disparou, a direção e as coordenadas
--
-- Assim como na 'descomprime_tres_valores', também esta função usará as propriedades númericas do caracter após ter sido passado para numero
retorna_info :: Char -> (Int, Direcao, Int, Int)
retorna_info x = let a = ord x
                     n1 = (div a 100000)
                     n2 = a- n1*100000
                     n3 = a -n1*100000 - ((div n2 10000) * 10000)
                     j = passa_jogador_disparo n1
                     d = passa_int_direcao (div n2 10000)
                     l = div n3 100
                     c = mod n3 100
                     in (j,d,l,c)


-- | Passa um inteiro para a direção que estava a codificar
passa_int_direcao :: Int -> Direcao
passa_int_direcao 1 = C
passa_int_direcao 2 = D
passa_int_direcao 3 = B
passa_int_direcao 4 = E

-- | Passa um inteiro para o inteiro correspondente ao jogador que está a simbolizar
--
-- __Nota__: Os valores vão de 1 a 8 porque, quando se fez a compressão dos disparos, convencionou-se que os jogadores de 0-3 que disparassem Canhoes ficariam com os números 1-4 e os jogadores que disparassem Lasers ficariam com 5-8
passa_jogador_disparo :: Int-> Int
passa_jogador_disparo 1 = 0
passa_jogador_disparo 2 = 1
passa_jogador_disparo 3 = 2
passa_jogador_disparo 4 = 3
passa_jogador_disparo 5 = 0
passa_jogador_disparo 6 = 1
passa_jogador_disparo 7 = 2
passa_jogador_disparo 8 = 3

-- * Discussão e conclusão
--
-- | Certamente foi uma tarefa interessante, obrigando o aluno o aluno tanto a escrever código efetivo e de qualidade como a esforçar-se para encontrar soluções originais.
--
--  O esforço, assim como a criatividade nos métodos de compressão, culminaram numa taxa de compressão média de 98,90%
--
--  Em retrospetiva, julgamos os resultados obtidos bastante satisfatórios.

conclusao:: String
conclusao = "Esta string apenas se encontra aqui para que seja possível escrever a conclusão"

               

