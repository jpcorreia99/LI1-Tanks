-- | Este módulo define funções comuns da Tarefa 2 do trabalho prático.
{-# OPTIONS_HADDOCK prune #-}
module Tarefa2_2018li1g088 where

import LI11819
import Tarefa0_2018li1g088
import Tarefa1_2018li1g088



-- * Testes

-- | Testes unitários da Tarefa 2.
--
-- Cada teste é um triplo (/identificador do 'Jogador'/,/'Jogada' a efetuar/,/'Estado' anterior/).
testesT2 :: [(Int,Jogada,Estado)]
testesT2 = t2_1++t2_2++t2_3++t2_4++t2_5 ++ t2_6++t2_7++t2_8++t2_9++t2_10++t2_11++t2_12++t2_13++t2_14++t2_15++t2_16++t2_17++t2_18++t2_19++t2_20 ++ t2_21 ++ t2_22 ++t2_23++t2_24++t2_25++t2_26++t2_27++t2_28++ t2_29
t2_1 =[(0,(Movimenta C) ,(Estado (mapaInicial (4,4)) [Jogador (1,1) C 1 1 1] [])),(0,(Movimenta C) ,(Estado (mapaInicial (4,4)) [Jogador (1,1) C 1 1 1] [])),(0,(Movimenta D) ,(Estado (mapaInicial (4,4)) [Jogador (1,1) C 1 1 1] [])),(0,(Movimenta D) ,(Estado (mapaInicial (4,4)) [Jogador (1,1) D 1 1 1] [])),(0,(Movimenta B) ,(Estado (mapaInicial (4,4)) [Jogador (1,1) C 1 1 1] [])),(0,(Movimenta B) ,(Estado (mapaInicial (4,4)) [Jogador (1,1) B 1 1 1] [])),(0,(Movimenta E) ,(Estado (mapaInicial (4,4)) [Jogador (1,1) C 1 1 1] [])),(0,(Movimenta E) ,(Estado (mapaInicial (4,4)) [Jogador (1,1) E 1 1 1] []))]
t2_2 = [(0,(Movimenta B) ,(Estado (mapaInicial (8,8)) [Jogador (1,1) B 1 1 1] [(DisparoCanhao 0 (4,4) C)]))]
t2_3 = [(0, (Dispara Canhao) , (Estado (mapaInicial (6,6)) [(Jogador (3,3) B 1 1 1)] [])), (0, (Dispara Canhao) , (Estado (mapaInicial (6,6)) [(Jogador (3,3) E 1 1 1)] [])), (0, (Dispara Canhao) , (Estado (mapaInicial (6,6)) [(Jogador (3,3) C 1 1 1)] [])), (0, (Dispara Canhao) , (Estado (mapaInicial (6,6)) [(Jogador (3,3) D 1 1 1)] []))]
t2_4=[(0, (Dispara Laser) , (Estado (mapaInicial (6,6)) [(Jogador (2,2) C 1 1 1)] [])), (0, (Dispara Laser) , (Estado (mapaInicial (6,6)) [(Jogador (2,2) D 1 1 1)] [])), (0, (Dispara Laser) , (Estado (mapaInicial (6,6)) [(Jogador (2,2) B 1 1 1)] [])), (0, (Dispara Laser) , (Estado (mapaInicial (6,6)) [(Jogador (2,2) E 1 1 1)] []))]
t2_5 =[(0, (Dispara Choque), (Estado (mapaInicial (8,8)) [Jogador (3,3) B 1 1 1] []))]
t2_6 =[(0,(Movimenta C) ,(Estado (mapaInicial (8,8)) [Jogador (1,1) D 1 1 1] [(DisparoCanhao 0 (4,4) C)])),(0,(Movimenta D) ,(Estado (mapaInicial (8,8)) [Jogador (1,1) B 1 1 1] [(DisparoCanhao 0 (4,4) C)])),(0,(Movimenta B) ,(Estado (mapaInicial (8,8)) [Jogador (1,1) D 1 1 1] [(DisparoCanhao 0 (4,4) C)])),(0,(Movimenta E) ,(Estado (mapaInicial (8,8)) [Jogador (1,1) B 1 1 1] [(DisparoCanhao 0 (4,4) C)]))]
t2_7 = [(0,(Movimenta B) ,(Estado (mapaInicial (8,8)) [Jogador (1,1) B 0 1 1] [(DisparoCanhao 0 (4,4) C)]))]
t2_8 = [(0,(Dispara Canhao) ,(Estado (mapaInicial (8,8)) [Jogador (1,1) B 0 1 1] [(DisparoCanhao 0 (4,4) C)]))]
t2_9 = [(0,(Dispara Laser) ,(Estado (mapaInicial (8,8)) [Jogador (1,1) B 0 1 1] [(DisparoCanhao 0 (4,4) C)]))]
t2_10 = [(0,(Dispara Choque) ,(Estado (mapaInicial (8,8)) [Jogador (1,1) B 0 1 1] [(DisparoCanhao 0 (4,4) C)]))]
t2_11 = [(0, (Movimenta E), (Estado (constroi [Move C,Move E,Move E,Move C,Move C,Move E,Move E,Move D,Move B,Move C,Move C,Move C,Move E,Move E,Move E,Move D,Move D,Move B,Move B,Move D,Move B,Move D,Move C,Move E,MudaParede,Desenha,Move D,Move D,Move D]) [Jogador (6,2) E 1 1 1] []))]
t2_12 = [(0, (Movimenta D), (Estado (constroi [Move C,Move E,Move E,Move C,Move C,Move E,Move E,Move D,Move B,Move C,Move C,Move C,Move E,Move E,Move E,Move D,Move D,Move B,Move B,Move D,Move B,Move D,Move C,Move E,MudaParede,Desenha,Move D,Move D,Move D]) [Jogador (3,2) D 1 1 1] []))]
t2_13 = [(0, (Movimenta C), (Estado (constroi [Move C,Move E,Move E,Move C,Move C,Move E,Move E,Move D,Move B,Move C,Move C,Move C,Move E,Move E,Move E,Move D,Move D,Move B,Move B,Move D,Move B,Move D,Move C,Move E,MudaParede,Desenha,Move D,Move D,Move D]) [Jogador (4,7) C 1 1 1] []))]
t2_14 = [(0,(Movimenta C) ,(Estado (mapaInicial (8,8)) [(Jogador (3,1) C 1 1 1),(Jogador (1,1) D 1 1 1)] [(DisparoCanhao 0 (4,4) C)]))]
t2_15 = [(0,(Movimenta D) ,(Estado (mapaInicial (8,8)) [(Jogador (1,1) D 1 1 1),(Jogador (1,3) D 1 1 1)] [(DisparoCanhao 0 (4,4) C)]))]
t2_16 = [(0,(Movimenta B) ,(Estado (mapaInicial (8,8)) [(Jogador (1,1) B 1 1 1),(Jogador (3,1) D 1 1 1)] [(DisparoCanhao 0 (4,4) C)]))]
t2_17 = [(0,(Movimenta E) ,(Estado (mapaInicial (8,8)) [(Jogador (1,3) E 1 1 1),(Jogador (1,1) D 1 1 1)] [(DisparoCanhao 0 (4,4) C)]))]
t2_18 = [(0,(Movimenta C) ,(Estado (mapaInicial (30,30)) [(Jogador (3,5) C 1 1 1),(Jogador (5,5) B 1 1 1)] [(DisparoChoque 1 4)]))]
t2_19 = [(0,(Movimenta D) ,(Estado (mapaInicial (30,30)) [(Jogador (1,1) D 1 1 1),(Jogador (5,5) B 1 1 1)] [(DisparoChoque 1 4)]))]
t2_20 = [(0,(Movimenta C) ,(Estado (mapaInicial (30,30)) [(Jogador (3,5) C 1 1 1)] [(DisparoChoque 0 4)]))]
t2_21 = [(0 ,(Movimenta C) ,(Estado (mapaInicial (10,10))[(Jogador (3,1) C 1 1 1),(Jogador (1,1) D 0 2 2)] []))]
t2_22 = [(0 ,(Movimenta D) ,(Estado (mapaInicial (10,10))[(Jogador (1,1) D 1 1 1),(Jogador (1,3) D 0 2 2)] []))]
t2_23 = [(0 ,(Movimenta B) ,(Estado (mapaInicial (10,10))[(Jogador (1,1) B 1 1 1),(Jogador (3,1) D 0 2 2)] []))]
t2_24 = [(0 ,(Movimenta E) ,(Estado (mapaInicial (10,10))[(Jogador (1,3) E 1 1 1),(Jogador (1,1) D 0 2 2)] []))]
t2_25 = [(0,(Movimenta D), (Estado (mapaInicial(6,6)) [(Jogador (2,1) C 1 1 1)] []))]
t2_26 = [(1,(Movimenta C), (Estado (mapaInicial(20,20)) [(Jogador (2,1) C 1 1 1), (Jogador (5,5) C 3 3 3)] []))]
t2_27 = [(2,(Movimenta B), (Estado (mapaInicial(30,30)) [(Jogador (2,1) C 1 1 1), (Jogador (5,5) C 3 3 3), (Jogador (15,15) B 5 66 10)] []))]
t2_28 = [(3,(Movimenta E), (Estado (mapaInicial(40,40)) [(Jogador (2,1) C 1 1 1), (Jogador (5,5) C 3 3 3), (Jogador (15,15) B 5 66 10), (Jogador (30,30) E 2 3 4)] []))]
t2_29 = [(0,(Movimenta B), e_t2)]
m_t2 = (atualizaPosicaoMatriz (1,2) (Bloco Destrutivel) (atualizaPosicaoMatriz (1,1) (Bloco Destrutivel) (mapaInicial (15,15))))
e_t2= (Estado m_t2 [(Jogador (5,7) B 1 100 100), (Jogador (4,4) D 0 3 3), (Jogador (7,7) E 4 4 4), (Jogador (10,10) B 6 6 6)] [])

-- * Funções principais da Tarefa 2.
-- | Efetua uma jogada.
jogada :: Int -- ^ O identificador do 'Jogador' que efetua a jogada.
       -> Jogada -- ^ A 'Jogada' a efetuar.
       -> Estado -- ^ O 'Estado' anterior.
       -> Estado -- ^ O 'Estado' resultante após o jogador efetuar a jogada.

jogada n (Movimenta dir) (Estado mapa (l_jogadores) (l_disparos))
       | n > (length l_jogadores) -1 = (Estado mapa (l_jogadores) (l_disparos))
       | (vidasJogador ((!!) l_jogadores n)  > 0) = (Estado mapa (mudaIndiceLista n (muda_posicao_jogador (Movimenta dir) (Estado mapa l_jogadores l_disparos)) (l_jogadores)) l_disparos)
       | otherwise = (Estado mapa (l_jogadores) (l_disparos))

jogada n (Dispara Canhao)  (Estado mapa (l_jogadores) (l_disparos))
       | n > (length l_jogadores) -1 = (Estado mapa (l_jogadores) (l_disparos))
       | vidasJogador ((!!) l_jogadores n)  > 0 = (Estado mapa (l_jogadores) (adiciona_disparo n Canhao l_disparos ((!!) l_jogadores n))) 
       | otherwise  = (Estado mapa (l_jogadores) (l_disparos))

jogada n (Dispara Laser)  (Estado mapa (l_jogadores) (l_disparos))
       | n > (length l_jogadores) -1 = (Estado mapa (l_jogadores) (l_disparos))  
       | (vidasJogador ((!!) l_jogadores n)  > 0) && (lasersJogador ((!!) l_jogadores n) > 0) = (Estado mapa (mudaIndiceLista n (diminui_munição (Laser)) l_jogadores) (adiciona_disparo n Laser l_disparos ((!!) l_jogadores n)))
       | otherwise = (Estado mapa (l_jogadores) (l_disparos)) 

jogada n (Dispara Choque)  (Estado mapa (l_jogadores) (l_disparos)) 
       | n > (length l_jogadores) -1 = (Estado mapa (l_jogadores) (l_disparos)) 
       | (vidasJogador ((!!) l_jogadores n)  > 0) && (choquesJogador ((!!) l_jogadores n) > 0) = (Estado mapa (mudaIndiceLista n (diminui_munição (Choque)) l_jogadores) (adiciona_disparo n Choque l_disparos ((!!) l_jogadores n)))
       | otherwise = (Estado mapa (l_jogadores) (l_disparos)) 


-- | Muda a posição de um jogador, se todas as condições de movimentação se verificarem 
--
-- __NB:__  Chamam várias funções auxiliares de verificação de condições, nomeadamente:
--
--           * 'verifica_caminho_livre_mapa'
--
--           * 'verifica_caminho_livre_de_tanques'
--
--           *  'verifica_caminho_livre_de_choques'
--
--           *  'direcaoParaVetor'

muda_posicao_jogador :: Jogada  -- ^ A 'Jogada' a fazer 
                     -> Estado -- ^ O 'Estado' do jogo, será útil para passar para funções auxiliares
                     -> Jogador  -- ^ O 'Jogador' a fazer a jogada
                     -> Jogador  -- ^ O 'Jogador' resultante após se efeturar a jogada


muda_posicao_jogador  (Movimenta dir) estado@(Estado mapa l_jogadores l_disparos) jogador@(Jogador (l,c) direcao vidas laser choque) 
 | (dir == direcao) && (verifica_caminho_livre_mapa (l,c) dir mapa) && (verifica_caminho_livre_de_tanques (Movimenta dir) jogador estado) && (verifica_caminho_livre_de_choques jogador l_jogadores l_disparos)= (Jogador (somaVetores (l,c) (direcaoParaVetor dir)) dir vidas laser choque)
 | otherwise  = (Jogador (l,c) dir vidas laser choque)


-- | Adiciona um disparo, consoante a instrução
--
-- __NB:__ Chama a função 'diminui_municao' para reduzir a munição do jogador

adiciona_disparo :: Int -- ^  Identificador do 'Jogador' que disparoui
                 -> Arma -- ^ 'Arma' Disparada
                 -> [Disparo] -- ^ Lista de 'Disparo'
                 -> Jogador -- ^ 'Jogador' que disparou
                 -> [Disparo] -- ^ Lista de 'Disparo' resultante

adiciona_disparo n Canhao (l_disparos) (Jogador pos dir vid las cho) = (DisparoCanhao n (somaVetores pos (direcaoParaVetor dir)) dir) : l_disparos

adiciona_disparo n Laser (l_disparos)  (Jogador pos dir vid las cho) = (DisparoLaser n (somaVetores pos (direcaoParaVetor dir))  dir) : l_disparos 

adiciona_disparo n Choque (l_disparos)  (Jogador pos dir vid las cho) = (DisparoChoque n 5) : l_disparos 


-- * Funções auxiliares da Tarefa 2.
-- ** Funções auxiliares ao movimento

-- | Verifica se o mapa está livre numa certa direção
verifica_caminho_livre_mapa :: PosicaoGrelha 
                            -> Direcao 
                            -> Mapa
                            -> Bool
verifica_caminho_livre_mapa (l,c) C mapa = (encontraPosicaoMatriz (l-1,c) mapa == Vazia) && (encontraPosicaoMatriz (l-1,c+1) mapa == Vazia)
verifica_caminho_livre_mapa (l,c) D mapa = (encontraPosicaoMatriz (l,c+2) mapa == Vazia) && (encontraPosicaoMatriz (l+1,c+2) mapa == Vazia)
verifica_caminho_livre_mapa (l,c) B mapa = (encontraPosicaoMatriz (l+2,c) mapa == Vazia) && (encontraPosicaoMatriz (l+2,c+1) mapa == Vazia)
verifica_caminho_livre_mapa (l,c) E mapa = (encontraPosicaoMatriz (l,c-1) mapa == Vazia) && (encontraPosicaoMatriz (l+1,c-1) mapa == Vazia)

--verifica_caminho_livre_de_tanques (Movimenta B) (Jogador (5,7) B 2 3 4) (Estado (mapaInicial (20,20)) [(Jogador (5,7) B 2 3 3),(Jogador (5,7) C 0 3 4), (Jogador (7,7) B 3 4 5)] [])
--verifica_caminho_livre_de_tanques (Movimenta B) (Jogador (5,7) B 2 3 4) (Estado (mapaInicial (20,20)) [(Jogador (5,7) B 2 3 3),(Jogador (5,7) B 0 3 4), (Jogador (7,7) B 4 4 5) ] [])

-- | Verifica se na direção que o jogador se pretende mexer não há tanques vivos
verifica_caminho_livre_de_tanques :: Jogada 
                                  -> Jogador 
                                  -> Estado 
                                  -> Bool
verifica_caminho_livre_de_tanques (Movimenta dir) jogador@(Jogador (li,ci) direcao vida laser choques) (Estado mapa [] l_armas) = True 

verifica_caminho_livre_de_tanques (Movimenta dir_j) jogador@(Jogador (li,ci) direcao vida laser choques) (Estado mapa ((Jogador (l,c) dir vid las cho):t_jogadores) l_armas) 
 | (compara_coordenadas_tanques dir_j (li,ci) (l,c)) || vid == 0 = verifica_caminho_livre_de_tanques (Movimenta dir_j) jogador (Estado mapa (t_jogadores) l_armas)
 | otherwise =  False 
 
--verifica_caminho_livre_de_tanques m j e = error $ show m ++ show j ++ show e 

-- | Função de auxílio a 'verifica_caminho_livre_de_tanques' que dadas as coordenadas de dois tanques e a direção em que o tanque se quer mover, verifica se o segundo tanque ocupa as posições que o primeiro quer aceder
compara_coordenadas_tanques :: Direcao -> PosicaoGrelha -> PosicaoGrelha -> Bool
compara_coordenadas_tanques C (li,ci) (l,c) = ((li-2,ci) /= (l,c)) && ((li-2,ci-1) /= (l,c)) && ((li-2,ci+1) /= (l,c))
compara_coordenadas_tanques D (li,ci) (l,c) = ((li,ci+2) /= (l,c)) && ((li-1,ci+2) /= (l,c)) && ((li+1,ci-2) /= (l,c))
compara_coordenadas_tanques B (li,ci) (l,c) = ((li+2,ci) /= (l,c)) && ((li+2,ci-1) /= (l,c)) && ((li+2,ci+1) /= (l,c)) 
compara_coordenadas_tanques E (li,ci) (l,c) = ((li,ci-2) /= (l,c)) && ((li+1,ci-2) /= (l,c)) && ((li-1,ci-2) /= (l,c))

-- | Verifica se o tanque está a ser afetado por um choque
--
-- __NB:__ Se for o próprio jogados que disparou o choque a mover-se ele consegue fazê-lo
verifica_caminho_livre_de_choques :: Jogador
                                  -> [Jogador]
                                  -> [Disparo]
                                  -> Bool

verifica_caminho_livre_de_choques jogador l_jogadores [] = True

verifica_caminho_livre_de_choques (Jogador (l1,c1) direcao vidas laser choque) l_jogadores ((DisparoChoque n ticks):t) =
                                  let (l2,c2) = posicaoJogador((!!) l_jogadores n)
                                  in  if ticks > 0 && (l1>= l2-3) && (l1 <= l2+3) && (c1>= c2-3) && (c1<=c2+3) && ((l1 /= l2) || (c1 /= c2)) 
                                      then False
                                      else verifica_caminho_livre_de_choques (Jogador (l1,c1) direcao vidas laser choque) l_jogadores t

verifica_caminho_livre_de_choques (Jogador (l1,c1) direcao vidas laser choque) l_jogadores (_:t) = verifica_caminho_livre_de_choques (Jogador (l1,c1) direcao vidas laser choque) l_jogadores t




-- ** Funções auxiliares ao disparo

-- | Quando um jogador dispara, diminui as suas munições da arma utilizada
diminui_munição :: Arma 
                -> Jogador
                -> Jogador
diminui_munição (Laser) (Jogador pos dir vid las cho) = (Jogador pos dir vid (las-1) cho)
diminui_munição (Choque) (Jogador pos dir vid las cho) = (Jogador pos dir vid las (cho-1))