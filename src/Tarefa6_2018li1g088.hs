-- | Este módulo define funções comuns da Tarefa 6 do trabalho prático.
--
--  __NOTA:__ Para que a documentaçâo seja gerada corretamente deve ser usado o comando haddock -h -o doc/html Tarefa6_2018li1g088
module Tarefa6_2018li1g088 where

import LI11819
import Tarefa0_2018li1g088
import Tarefa1_2018li1g088
import Tarefa2_2018li1g088
import Tarefa4_2018li1g088
-- * Introdução 
-- | Nesta tarefa foi criado um bot para competir contra os bots desenvolvidos pelos outros alunos, assim como para incorporar na Tarefa5, na opção de jogar contra bots.
-- 
-- Foi criada também uma versão mais fraca do bot para na tarefa5 se poder escolher a dificuldade do bot. 
introT6 :: String
introT6 = "String que será comentada como introdução"
-- * Objetivos
-- ** Funções principais da Tarefa 6.
-- | __Ordem de condições e funcionamento da função 'bot'__
-- 
--  __1ª condiçao:__ Se existir algum jogador vivo à distância de ser afetado por um 'DisparoChoque', o bot dispara um choque
--
--  __2ª condição:__ Se o bot já tiver disparado um choque e o jogador afetado ainda estiver vivo, chama a função 'reageChoque' que fará o bot atacar o jogador afetado pelo choque.
--
--  __3ª condição:__ Se existem blocos destrutíveis/jogadores no caminho para o qual o bot está virado, ou numa das outras três direções alternativas (informação que se obtém através das funções 'existeAlgoNoCaminho' e 'existeAlgoNoutroCaminho'), chama a função 'reageExisteAlgoCaminho'
--
--  __4ª condição:__ Caso nenhuma das condições acima se verifique, será chamada a função 'moveJogadorMaisProximo' que fará o bot mover-se em direção ao jogador mais próximo.
--
-- __Nota:__ Este será o bot de dificuldade máxima na Tarefa5
bot :: Int          -- ^ O identificador do 'Jogador' associado ao ro'bot'.
    -> Estado       -- ^ O 'Estado' para o qual o ro'bot' deve tomar uma decisão.
    -> Maybe Jogada -- ^ Uma possível 'Jogada' a efetuar pelo ro'bot'.
bot n estado@(Estado mapa lJogadores lDisparos) | estaEmDistanciaChoque n jogador estado  && (choquesJogador jogador > 0) = Just (Dispara Choque)
                                                | (existeChoque n lDisparos) && vidasJogador (jogadorAfetado jogador lJogadores) > 0  && not (estaBoqueadoIndestrutivel mapa jogador)= reageChoque jogador estado -- a reage choques recebe os dois tanques envolvidos num choqe, o primeiro é o que disparou, o segundo o afetado, para saber o segundo é preciso chamar a função jogadorAfetado
                                                | existe1 || existe2 || (not (existe1) && i1 == 1)  || (not (existe2) && i2 == 1) = reageExisteAlgoCaminho jogador estado
                                                | otherwise = moveJogadorMaisProximo jogador estado
                                                where 
                                                  jogador@(Jogador (l,c) dir vid las cho) = ((!!) lJogadores n)
                                                  (existe1,i1) = existeAlgoNoCaminho 0 jogador estado -- este 0 será um int que guardará informação, o 1 representa que encontrou blocos destrutiveisd e o 2 um player
                                                  (existe2,dirj,i2) =  existeAlgoNoutroCaminho 0 (Jogador (l,c) (roda dir) vid las cho) estado

-- | Função que verifica se no caminho do bot se encontra algum Jogador/Bloco Destrutivel. Os resultados variam consoante o encontrado:
--
--  Se tiver um jogador no caminho retorna __(True,2)__
--
--  Se tiver apenas blocos destrutiveis no caminho retorna __(False,1)__
--
--  Se o caminho acabar num bloco Indestrutivel sem nada antes, retorna __(False, 0)__
--
--  Quando a função encontra um bloco Destrutivel, não acaba logo porque quer avaliar se à frente tem algum jogador, sendo assim mais útil usar o laser
--
-- __Nota:__ Se na posição imediatamente à frente do bot não encontra nada, avança a posição do jogador por um bloco para testar os blocos seguintes. 
--
-- __ex:__ Se um jogador Virado para Baixo na posição (3,3) não tem nenhum bloco/jogador nas posições (4,3) e (4,4), o bot avança para a posição (4,3) para testar as posições (5,3) e (5,4). Este procedimento continua até ser encontrado um jogador ou um bloco.  
existeAlgoNoCaminho :: Int -- ^ Contador que é iniciado a 0 mas que se torna 1 se forem encontrados blocos destrutiveis e 2 se forem encontrados jogadores.
                    -> Jogador -- ^ Jogador que servirá como "sonda" para ir verificando o caminho
                    -> Estado -- ^ 'Estado' do qual se irão utilizar partes como argumento par outras funções
                    -> (Bool, Int) -- ^ Par de um boleano e um inteiro, o boleano indica se existe algum jogador no caminho, o inteiro se existe algum bloco Destrutivel (2-Jogador, 1-Bloco, 0-Nada)
existeAlgoNoCaminho i jogador@(Jogador (l,c) dir vid las cho) estado@(Estado mapa lJogadores lDisparos) | existemJogadoresCaminho (l,c) dir lJogadores = (True,2)
                                                                                                        | estaBoqueadoDestrutivel mapa jogador = existeAlgoNoCaminho 1 (Jogador (avancaPosicao dir (l,c)) dir vid las cho) estado 
                                                                                                        | estaBoqueadoIndestrutivel mapa jogador = (False,i) 
                                                                                                        | otherwise = existeAlgoNoCaminho i (Jogador (avancaPosicao dir (l,c)) dir vid las cho) estado 


-- | Esta função é chamada em dois casos
--
--  1. Caso o bot não encontre, na direção para a qual está virado, nenhum bloco destrutível ou jogador
--
--  2. Caso o bot apenas encontre, na direção para a qual está virado, blocos destrutiveis. Como tirar vidas a um jogador fornece mais pontos que destruir blocos, vale a pena verificar se noutras direções existem jogadores. 
--
-- A funnção verificará, para as outras três direções (ou seja, para as direções que o jogador não está virado), se nessas direções existem blocos destrutíveis ou jogadores. Fará isto chamando a função 'existeAlgoNoCaminho', três vezes, uma para cada direção.
--
-- Caso em alguma das direções encontre um jogador, devolve o triplo __(True, direção onde o jogador está,2)__, caso encontre apenas blocos destrutiveis devolve __(False, direção onde os blocos estão,1)__, caso não encontre nem jogadores nem blocos destrutiveis em nenhuma das 4 direções, devolve __(False,C,0)
--
-- __Nota__; Os resultados desta função serão usados na função 'reageExisteAlgoCaminho'
existeAlgoNoutroCaminho ::  Int -> Jogador -> Estado -> (Bool, Direcao, Int)
existeAlgoNoutroCaminho  n jogador@(Jogador (l,c) dir vid las cho) estado | bool1 = (bool1,dir,i1)
                                                                          | bool2 = (bool2, (roda dir),i2)
                                                                          | bool3 = (bool3, (roda (roda dir)), i3) 
                                                                          | not (bool1) && i1 == 1 = (bool1,dir,i1)
                                                                          | not (bool2) && i2 == 1 = (bool2,(roda dir),i2)
                                                                          | not (bool3) && i3 == 1 = (bool3,(roda (roda dir)),i3) 
                                                                          | otherwise = (False, C, 0)
                                                                            where 
                                                                            (bool1,i1) = existeAlgoNoCaminho n jogador estado
                                                                            (bool2,i2) = existeAlgoNoCaminho n (Jogador (l,c) (roda dir) vid las cho) estado
                                                                            (bool3,i3) = existeAlgoNoCaminho n (Jogador (l,c) (roda (roda dir)) vid las cho) estado
 
-- | Função encarregue de reagir caso exista algum bloco/jogador numa das 4 direções em relação ao jogador
--
-- Para saber, em primeiro lugar, se existe algum bloco/jogador, chama as funções 'existeAlgoNoCaminho' e 'existeAlgoNoutroCaminho'
--
-- Caso a função 'existeAlgoNoCaminho' indique que existe um jogador no caminho, o bot dispara
--
-- Se a função 'existeAlgoNoCaminho' indica que apenas há blocos destrutíveis, mas a função 'existeAlgoNoutroCaminho' indica que há algum jogador noutra direção, mas na mesma linha/coluna, o jogador vira-se para essa coluna.
--
-- Caso a função 'existeAlgoNoCaminho' indique que não há nada e a função 'existeAlgoNoutroCaminho' indique que há blocos, vira-se nessa direção
--
-- Caso nenhuma das funções indique a existência de jogadores/blocos, o bot não faz nada
--
-- __Nota:__ Ao testar outras direções, usa a função 'roda', definida na tarefa1 para alterar a direção
reageExisteAlgoCaminho :: Jogador -> Estado -> Maybe Jogada
reageExisteAlgoCaminho jogador@(Jogador (l,c) dir vid las cho) estado | existe1 && i1 == 2 && las > 0 = Just (Dispara Laser)
                                                                      | existe1 = Just (Dispara Canhao)
                                                                      | existe2 = Just (Movimenta dirj)
                                                                      | not (existe1) && i1 == 1 = Just (Dispara Canhao)
                                                                      | not (existe2) && i2 == 1 = Just (Movimenta dirj)
                                                                      | otherwise = Nothing
                                                                       where 
                                                                       (existe1,i1) = existeAlgoNoCaminho 0 jogador estado -- este 0 será um int que guardará informação, o 1 representa que encontrou blocos destrutiveisd e o 2 um player
                                                                       (existe2,dirj,i2) = existeAlgoNoutroCaminho 0 (Jogador (l,c) (roda dir) vid las cho) estado

-- ** Funções secundárias do bot

-- | Dado o mapa e o bot, verifica se à frente do bot está um blocoIndestrutivel que lhe está a bloquear o caminho
--
-- __Nota:__ Será chamada pela função 'existeAlgoNoCaminho' várias vezes até ser encontrada uma parede indestrutivel (o que faz parar a pesquisa pois não interessa o que está para além da parede indestrtivel) ou um jogador. É chamda também a função 'blocosVizinhos' que devolve quais os blocos à frente do jogador
estaBoqueadoDestrutivel :: Mapa -> Jogador -> Bool
estaBoqueadoDestrutivel m (Jogador (l,c) dir vid las cho) | b1 == (Bloco Destrutivel) || b2 == (Bloco Destrutivel) = True
                                                          | otherwise = False
                                                           where 
                                                          (b1,b2) = blocosVizinhos m (l,c) dir
-- | Dado o mapa e o bot, verifica se à frente do bot está um blocoIndestrutivel que lhe está a bloquear o caminho
--
-- __Nota:__ Será chamada pela função 'existeAlgoNoCaminho' várias vezes até ser encontrada uma parede. É chamda também a função 'blocosVizinhos' que devolve quais os blocos à frente do jogador.
estaBoqueadoIndestrutivel :: Mapa -> Jogador -> Bool
estaBoqueadoIndestrutivel m (Jogador (l,c) dir vid las cho) | b1 == (Bloco Indestrutivel) || b2 == (Bloco Indestrutivel) = True
                                                            | otherwise = False
                                                            where 
                                                           (b1,b2) = blocosVizinhos m (l,c) dir

-- | Dadas as coordenadas e direção para a qual o bot está virado, indica se à frente do bot existe algum jogador
--
--  Usará a função 'posicoesAVerificarJogadores' para saber quais as coordenadas a verificar 
--
-- __Nota:__ Esta função será chamada várias vezes pela função 'existeAlgoNoCaminho' para verificar se na posição à frente do bot existe um jogador
existemJogadoresCaminho :: PosicaoGrelha -> Direcao -> [Jogador] -> Bool
existemJogadoresCaminho _ _ [] = False
existemJogadoresCaminho (l,c) dir ((Jogador (lj,cj) dirj vid las cho):t) = (((lj,cj) == (l1,c1)  || (lj,cj) == (l2,c2)  || (lj,cj) == (l3,c3)) && vid > 0) || existemJogadoresCaminho (l,c) dir t
                                                                         where ((l1,c1),(l2,c2),(l3,c3)) = posicoesAVerificarJogadores (l,c) dir


-- | Verifica se existe algum jogador que está suficientemente perto para ser afetado por um choque
--
-- Para o fazer, utiliza a função estaProximo que verifica se há algum jogador vivo a distância de 3 ou menos do nosso bot.
estaEmDistanciaChoque :: Int -> Jogador -> Estado -> Bool
estaEmDistanciaChoque  i (Jogador (l,c) dir vid las cho) (Estado mapa lJogadores lDisparos) = if not (existeChoque i lDisparos) then estaProximo (l,c) lJogadores else False 
                                                                                               where
                                                                                            estaProximo :: PosicaoGrelha -> [Jogador] -> Bool
                                                                                            estaProximo _ []  = False
                                                                                            estaProximo (l,c) ((Jogador (lj,cj) dir vid las cho):t)  = if (vid > 0 && (l,c) /= (lj,cj) && (elem lj [(l-3)..(l+3)]) && (elem cj [(c-3) .. (c+3)])) then True else estaProximo (l,c) t 

-- | Dado o indíce do bot, verifica se éste tem um 'DisparoChoque' ativo
existeChoque :: Int -- ^ índice do bot
             -> [Disparo] -- Lista dos disparos
             -> Bool -- ^ Boleano que indica se o bot disparou um 'DisparoChoque' 
existeChoque i [] = False
existeChoque i ((DisparoChoque j ticks):t) = i == j && (ticks > 0) || existeChoque i t
existeChoque i (_:t) = existeChoque i t



-- | Após lhe ser dada as coordenadas do jogador mais próximo ao nosso bot, devolve uma jogada no sentido de se movimentar para mais perto dele.
--
--  Chama a função 'encontraJogadorMainProximo' para saber quais as coordenadas do jogador que queremos atacar 
--
-- Chama também a função 'estaBloqueadoIndestrutivel'. Se o bot estiver virado para uma parede esta função dará o valor True, mas nós queremos apenas agir se o bot não estiver contra uma parede. Por essa razão aplicamos o operador not() à função 'estaBloqueadoIndestrutivel'
moveJogadorMaisProximo :: Jogador -> Estado -> Maybe Jogada
moveJogadorMaisProximo jogador@(Jogador (l,c) dir vid las cho) (Estado mapa lJogadores lDisparos) | l1 < l && not (estaBoqueadoIndestrutivel mapa ((Jogador (l,c) C vid las cho))) = Just (Movimenta C)
                                                                                                  | l1 > l && not (estaBoqueadoIndestrutivel mapa ((Jogador (l,c) B vid las cho))) = Just (Movimenta B)
                                                                                                  | c1 < c && not (estaBoqueadoIndestrutivel mapa ((Jogador (l,c) E vid las cho))) = Just (Movimenta E)
                                                                                                  | c1 > c && not (estaBoqueadoIndestrutivel mapa ((Jogador (l,c) D vid las cho))) = Just (Movimenta D)
                                                                                                  | otherwise = Just (Movimenta C)  
                                                                                                  where (l1,c1) = encontraJogadorMaisProximo jogador lJogadores

-- | Devolve as coordenadas do jogador vivo mais próximo ao nosso jogador
-- 
-- __Nota__: O segundo argumento para a função auxiliar é iniciado a (500,500) porque assim temos a certeza que haverá sempre algum jogador com um valor de coordenadas menor
encontraJogadorMaisProximo :: Jogador -> [Jogador] ->  (PosicaoGrelha)
encontraJogadorMaisProximo jogador@(Jogador (l,c) dir vid las cho) lJogadores = aux (l,c) (500,500) lJogadores
                                                                               where 
                                                                                 aux (l,c) (lj,cj) [] = (lj,cj)
                                                                                 aux (l,c) (lj,cj) ((Jogador (l1,c1) dir vid las cho):t) | (l,c) == (l1,c1) = aux (l,c) (lj,cj) t
                                                                                                                                                                      |  (sqrt (fromIntegral (l-lj)^2 + fromIntegral (c-cj)^2) > sqrt (fromIntegral(l-l1)^2 + fromIntegral(c-c1)^2))&& vid > 0 = aux (l,c) (l1,c1) t 
                                                                                                                                                                      | otherwise = aux (l,c) (lj,cj) t

-- | Chama  função 'jogadorAfetado' para conseguir saber informação acerca do jogador que está a ser atingido pelo choque.
--
--  De seguida compara as coordenadas. 
--
--  __Se os jogadores não estiverem "alinhados"__ (ou seja, o bot não consegue acertar no joga caso dispare), o bot move-se em direção ao jogador.
-- 
--  __Se, por outro lado, os jogadores já estiverem alinhados__ (algo que se verifica usando a função 'compara_coordenadas_tanques'), o jogador dispara.
reageChoque :: Jogador -> Estado-> Maybe Jogada
reageChoque jogador1@(Jogador (l1,c1) dir1 vid1 las1 cho1) (Estado mapa lJogadores lDisparos) | ((not (compara_coordenadas_tanques dir1  (l1,c1) (l2,c2))) || not (compara_coordenadas_tanques dir1  (avancaPosicao dir1 (l1,c1)) (l2,c2)))  = Just (Dispara Canhao) -- usar a avança disparo para verificar o seguinte também
                                                                                              | l1 > (l2+1) = Just (Movimenta C)
                                                                                              | l1 < (l2-1) = Just (Movimenta B)
                                                                                              | c1 < c2 = Just (Movimenta D)
                                                                                              | c1 > c2 = Just (Movimenta E)
                                                                                              | otherwise = Nothing -- caso em que o mata e
                                                                                              where 
                                                                                              (Jogador (l2,c2) dir2 vid2 las2 cho2) = jogadorAfetado jogador1 lJogadores 

-- | Dado um jogador (o nosso bot), que sabemos que está a usar um 'DisparoChoque' e a lista de jogadores, devolve o jogador que está a ser afetado pelo choque.
--
-- Para saber qual o jogador que está a ser afetado, basta ver se as coordenadas do jogador que estamos a testar agora se encontram num intervalo de 3 linhas para cima/baixo ou 3 colunas para a direita/esquerda do nosso bot, pois é essa a àrea de ação do choque.
--
-- Ignora as coordenadas do próprio bot e também ignora jogadores que já morreram
--
-- __Nota:__ O caso Jogador [] serve para a função não falhar quando o jogador que o bot estava a atacar morre
jogadorAfetado :: Jogador -> [Jogador] -> Jogador
jogadorAfetado jogador [] = jogador
jogadorAfetado (Jogador (l,c) dir vid las cho) ((Jogador (lj,cj) dirj vidj lasj choj):t) = if (vid > 0 && (l,c) /= (lj,cj) && (elem lj [(l-3)..(l+3)]) && (elem cj [(c-3) .. (c+3)])) then (Jogador (lj,cj) dirj vidj lasj choj) else jogadorAfetado (Jogador (l,c) dir vid las cho) t  

-- | Sabendo que o bot está a utilizar um choque, esta função dita qual a ação a fazer para conseguir atingir o jogador que está a ser afetado pelo choque.
--

-- | Devolve as duas peças que se encontram à frente do tanque. Isto será a base para a verificação de muitas funções, incluindo a 'estaBoqueadoIndestrutivel' e a 'estaBoqueadoDestrutivel'
blocosVizinhos :: Mapa -> PosicaoGrelha -> Direcao -> (Peca,Peca) 
blocosVizinhos m (l,c) C = ((encontraPosicaoMatriz (l-1,c) m),(encontraPosicaoMatriz (l-1,c+1) m))
blocosVizinhos m (l,c) D = ((encontraPosicaoMatriz (l,c+2) m),(encontraPosicaoMatriz (l+1,c+2) m))
blocosVizinhos m (l,c) B = ((encontraPosicaoMatriz (l+2,c) m),(encontraPosicaoMatriz (l+2,c+1) m))
blocosVizinhos m (l,c) E = ((encontraPosicaoMatriz (l,c-1) m),(encontraPosicaoMatriz (l+1,c-1) m))

 
-- | Dada uma direção e uma coordenada devolve a coordenada seguinte                                              
avancaPosicao :: Direcao -> PosicaoGrelha -> PosicaoGrelha
avancaPosicao C (l,c) = (l-1,c)
avancaPosicao D (l,c) = (l,c+1)
avancaPosicao B (l,c) = (l+1,c)
avancaPosicao E (l,c) = (l,c-1)

-- ** Bots de outras dificuldades
-- | Versão do bot mas de dificuldade fácil
--
-- Foi retirada a utilização de choqes e a função 'reageExisteAlgoCaminho' foi alterada para uma versão mais fraca, a 'reageExisteAlgoCaminhoFacil'
botFacil :: Int          -- ^ O identificador do 'Jogador' associado ao ro'bot'.
         -> Estado       -- ^ O 'Estado' para o qual o ro'bot' deve tomar uma decisão.
         -> Maybe Jogada -- ^ Uma possível 'Jogada' a efetuar pelo ro'bot'.
botFacil n estado@(Estado mapa lJogadores lDisparos)  | existe1 || existe2 || (not (existe1) && i1 == 1)  || (not (existe2) && i2 == 1) = reageExisteAlgoCaminhoBotFacil jogador estado
                                                      | otherwise = moveJogadorMaisProximo jogador estado
                                                      where 
                                                        jogador@(Jogador (l,c) dir vid las cho) = ((!!) lJogadores n)
                                                        (existe1,i1) = existeAlgoNoCaminho 0 jogador estado -- este 0 será um int que guardará informação, o 1 representa que encontrou blocos destrutiveisd e o 2 um player
                                                        (existe2,dirj,i2) =  existeAlgoNoutroCaminho 0 (Jogador (l,c) (roda dir) vid las cho) estado
-- | Versão mais fraca da função 'reageExisteAlgoCaminho'
--
-- Nesta versão os Lasers não são utilizados e o bot não prioritiza atacar os jogadores em relação aos blocos
reageExisteAlgoCaminhoBotFacil :: Jogador -> Estado -> Maybe Jogada
reageExisteAlgoCaminhoBotFacil jogador@(Jogador (l,c) dir vid las cho) estado | existe1 = Just (Dispara Canhao)
                                                                              | not (existe1) && i1 == 1 = Just (Dispara Canhao)
                                                                              | existe2 = Just (Movimenta dirj)
                                                                              | not (existe2) && i2 == 1 = Just (Movimenta dirj)
                                                                              | otherwise = Nothing
                                                                               where 
                                                                               (existe1,i1) = existeAlgoNoCaminho 0 jogador estado -- este 0 será um int que guardará informação, o 1 representa que encontrou blocos destrutiveisd e o 2 um player
                                                                               (existe2,dirj,i2) = existeAlgoNoutroCaminho 0 (Jogador (l,c) (roda dir) vid las cho) estado
-- | Versão do bot de média dificuldade
--
-- | Embora este bot também não use os 'DisparoChoque', já utiliza a função 'reageExisteAlgoCaminho', o que significa que irá utilizar 'DisparoLaser' e prioritizar atingir jogadores em relação a blovos
botMedio :: Int          -- ^ O identificador do 'Jogador' associado ao ro'bot'.
         -> Estado       -- ^ O 'Estado' para o qual o ro'bot' deve tomar uma decisão.
         -> Maybe Jogada -- ^ Uma possível 'Jogada' a efetuar pelo ro'bot'.
botMedio n estado@(Estado mapa lJogadores lDisparos) | existe1 || existe2 || (not (existe1) && i1 == 1)  || (not (existe2) && i2 == 1) = reageExisteAlgoCaminho jogador estado
                                                     | otherwise = moveJogadorMaisProximo jogador estado
                                                     where 
                                                       jogador@(Jogador (l,c) dir vid las cho) = ((!!) lJogadores n)
                                                       (existe1,i1) = existeAlgoNoCaminho 0 jogador estado -- este 0 será um int que guardará informação, o 1 representa que encontrou blocos destrutiveisd e o 2 um player
                                                       (existe2,dirj,i2) =  existeAlgoNoutroCaminho 0 (Jogador (l,c) (roda dir) vid las cho) estado
-- * Discussão e Conclusão
-- | Assim como na Tarefa3 e na Tarefa5, a liberdade de desenvolver o bot ao gosto do aluno foi um grande motor de motivação nesta parte final do trabalho.
--
-- Julgamos que o os vários bots desenvolvidos se adaptam à dificuldade que é suposto representarem e que enriquecem a experiência de jogo.

conclusaoT6 :: String
conclusaoT6 = "String que irá ser comentada para que a conclusão apareça na documentação"
-- * Considerações finais e Agradecimentos.
-- | Em retrospetiva, consideramos toda a experiência envolvendo a cadeiras neste primeiro semestre extremamente satisfatória
--
-- A possibilidade de colocar os conhecimentos adquiridos na cadeira de programação funcional em prática revelou-se extremamente cativente e sentimos que nos fez evoluir como estudantes e futuros engenheiros.
--
-- Deixamos os nosss agradecimentos a todos os professores da cadeira de Laboratórios de Informática I, especialmente ao Professor Hugo Pacheco, pela sua dedicação e sempre presente paciência para ajudar os alunos.
--
-- Sinceramente,
-- 
-- João Correia
--
-- Pedro Bastos 
agradecimentos:: String
agradecimentos = "agradecimentos"