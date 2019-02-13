class Item {
  final String title;
  final String description;
  final String imagePath;
  final String url;
  final String date;

  Item({
    this.title,
    this.description,
    this.imagePath,
    this.url,
    this.date='',
  });
}

final sampleItems = <Item>[
  new Item(
    title: 'O corneto de Kinder Bueno chegou a Portugal',
    description: 'Chegou no início de 2018 a vários países da Europa, mas até ao momento não havia ideia de quando é que poderia estar à venda em Portugal. Agora temos a notícia que vai deixar muita gente a salivar: o corneto de Kinder Bueno chegou a vários supermercados portugueses. A versão gelada do conhecido chocolate de avelã não veio sozinha: há mais três novidades para provar.'
        '\n\nO Kinder Bueno Ice Cream Cone junta um disco de chocolate com avelã, pedaços de chocolate e um gelado de avelã no interior. Está disponível nos hiper e supermercados em packs de quatro unidades — os preços começam nos 4,99€.'
        '\n\nTambém em packs, e na área os congelados, encontra o novo Kinder Ice Cream Sandwich (4,99€). É indicado para crianças e está à venda em caixas de seis doses. É preparado com um gelado de leite e duas bolachas de cinco cereais.'
        '\n\nAo cartaz da Olá, chegou o Kinder Joy Ice Cream. É um versão do Kinder Soy, um gelado para comer à colher (2,50€). Nos vários cafés e pastelarias do País também poderá pedir o novo Kinder Bueno Ice Cream Bar. Custa 1,50€, é idêntico ao Caramel & Nuts, mas no interior do gelado foi acrescentado creme de avelã. Estes dois apenas ficam à venda a partir de março.',
    imagePath: 'assets/kinder.jpg',
    url: 'https://nit.pt/buzzfood/gourmet-e-vinhos/corneto-kinder-bueno-chegou-portugal',
    date: '06/02/2019',
  ),
  new Item(
    title: 'Airbnb também quer entrar no setor dos transportes',
    description: 'O alojamento pode deixar de ser o único setor de atividade da Airbnb. A plataforma de arrendamento temporário quer entrar na área dos transportes e para isso contratou o antigo diretor da Delta Airlines e Virgin América. Calma que o objetivo não é criar uma nova companhia aérea, pelo menos por enquanto.'
        '\n\nSegundo a revista online de tecnologia, a “Tech Crunch”, Fred Reid foi chamado para criar dentro da Airbnb uma área dedicada aos transportes. Estão várias hipóteses a ser estudadas, como, por exemplo, parcerias com outras empresas do setor do turismo, tudo para facilitar a deslocação dos vários clientes que procuram a empresa.'
        '\n\n“Queremos explorar várias ideias e parcerias que possam facilitar o transporte”, explica Brian Chesky CEO da Airbnb à “Tech Crunch”. A criação de uma plataforma para venda de bilhetes online é algo que também não está entre as propostas da empresa.'
        '\n\n“Há ainda várias oportunidades para explorar e melhorar a experiência de transporte para todos”, continua.'
        '\n\nA Airbnb foi criada em 2008 e está presente em todo o mundo com arrendamento por curtos períodos. A nova aposta nos transportes ainda é algo muito vago, mas certa é a intenção da empresa em entrar na área e criar novas acessibilidades.',
    imagePath: 'assets/airbnb.jpg',
    url: 'https://nit.pt/out-of-town/airbnb-quer-entrar-no-setor-dos-transportes',
    date: '10/02/2019',
  ),
  new Item(
    title: 'Bruxelas avisa: turismo em Portugal está a roubar casas aos mais pobres',
    description: 'Segundo um novo relatório sobre Portugal, citado pelo “JN“, Bruxelas está preocupada com a situação do aumento imparável nos preços das casas e com as suas consequências. A comissão está sobretudo atenta ao efeito que a explosão de procura de habitação teve em casas para preços acessíveis para grupos “socialmente vulneráveis”.'
        '\n\nNo entanto, os especialistas europeus acreditam que o boom imobiliário, se existiu, pode estar a acabar. A produção de casas continua a recuperar, mas é de esperar um abrandamento da procura dos investidores estrangeiros, avisam.'
        '\n\nSegundo dados revelados no passado dia 31 de janeiro, pelo Instituto Nacional de Estatísticas (INE), o preço das casas em Portugal aumentou para 984€ por metro quadrado no terceiro trimestre do ano passado. É uma subida de 7,9% face ao mesmo período do ano anterior.'
        '\n\nLisboa e o Porto voltam a ser as regiões com maiores subidas, superiores a 20%. A capital registou o maior crescimento dos preços, com o metro quadrado na capital a chegar em média aos 2877 euros.',
    imagePath: 'assets/lisboa.jpg',
    url: 'https://nit.pt/out-of-town/back-in-town/bruxelas-avisa-turismo-em-portugal-esta-a-roubar-casas-aos-mais-pobres',
    date: '08/02/2019',
  ),
  new Item(
    title: 'Viver numa cidade sem carros: Espanha fez o teste e o sucesso é enorme',
    description: 'Já imaginou viver numa cidade sem carros? Sem poluição, engarrafamentos, sem buzinas ou motores? Sem ter de olhar para todos os lados quando anda na rua, contornar veículos para se conseguir movimentar, agarrar os miúdos com força para não fugirem para a estrada? Em Pontevedra, uma cidade de 83 mil habitantes na Galiza, no noroeste de Espanha, é mesmo isso que acontece depois de um autarca ousado ter expulsado todos os carros do centro histórico.'
        '\n\nÉ um caso de sucesso tão grande que outras cidades o querem seguir. Em Pontevedra, livre de veículos no centro desde 2000, a poluição baixou. O turismo cresceu e a população também: em contraciclo com as quedas de natalidade em Espanha, ali existem agora mais pessoas e mais crianças. A explicação é simples: há casais a mudarem-se para lá para constituírem famílias. Querem ter filhos onde eles possam brincar na rua, explicam a vários meios locais.'
        '\n\nSe quiser visitar esta cidade espanhola sem levar o seu carro, naturalmente, encontra várias opções de autocarros, comboios e carpooling a partir de Lisboa e do Porto. São três e sete horas de viagem, respetivamente.',
    imagePath: 'assets/cidade.jpg',
    url: 'https://nit.pt/out-of-town/back-in-town/viver-numa-cidade-sem-carros-espanha-fez-o-teste-e-o-sucesso-e-enorme',
    date: '07/02/2019',
  ),
  new Item(
    title: 'RTP1 vai ter um programa semanal de música ao vivo',
    description: 'A partir de abril, a RTP1 vai ter um novo programa semanal de música ao vivo. Chama-se “Eléctrico” e foi anunciado esta terça-feira, 5 de fevereiro. O programa será gravado no Capitólio, em Lisboa.'
        '\n\n“Usamos a plateia e colocamos duas bandas em frente a frente. Não há palcos, não há cadeiras e nada está escondido”, explicou o radialista Henrique Amaro à “Lusa”, citada pela “Sapo 24“.'
        '\n\nNo total, estão programados 12 episódios. Cada um vai ter atuações de duas bandas ou músicos. Márcia e Frankie Chavez; Conan Osíris e Stereossauro; Sara Tavares e Selma Uamusse; David Fonseca e Joana Espadinha; Samuel Úria e B Fachada; Capitão Fausto e Luís Severo; Mundo Segundo & Sam The Kid e Dino D’Santiago; e Dead Combo e Linda Martini são algumas das duplas já confirmadas.'
        '\n\nDurante cerca de uma hora, cada artista poderá tocar cinco temas. No entanto, uma música terá sempre “um convidado, que pode ser quem está no palco à frente ou outro”.',
    imagePath: 'assets/rtp.jpg',
    url: 'https://nit.pt/coolt/televisao/rtp1-vai-ter-um-programa-semanal-com-musica-ao-vivo',
    date: '06/02/2019',
  ),
  new Item(
    title: 'Este shopping só vende peças em segunda mão — e é um sucesso mundial',
    description: 'Para seguir a última tendência da moda não é obrigatório comprar roupas novas, saídas recentemente das fábricas. A teoria é comprovada pelo centro comercial ReTuna Recicling Gallery que fica na pequena cidade de Eskilstuna, na Suécia. É o primeiro centro comercial do mundo a vender apenas produtos reciclados e objetos reparados.'
        '\n\nO shopping fica a cerca de uma hora e meia de Estocolmo, abriu em agosto de 2015 e tem uma localização estratégica. Fica mesmo ao lado do centro de reciclagem da cidade.'
        '\n\nO crescimento do shopping tem sido exponencial. No primeiro ano de funcionamento vendeu cerca de 242 mil euros em produtos. Em 2017, este número subiu para 990 mil euros. No ano seguinte, o número duplicou e centro comercial lucrou quase dois milhões de euros em vendas.'
        '\n\nOs clientes e a comunidade local são incentivados a doar tudo o que já não usam ou não querem. Roupas, móveis, computadores, brinquedos e materiais de construção e jardinagem são alguns dos produtos doados.'
        '\n\nAlém disso, o ReTuna pretende melhorar a experiência de comprar artigos em segunda mão ao eliminar a necessidade de procurar boas peças em lojas vintage ou feiras espalhadas pela cidade e nas lojas online.'
        '\n\nHá muito tempo a Suécia ergue a bandeira da sustentabilidade. Mais de 99 por cento do lixo doméstico comum daquele país é reciclado (50 por cento é queimado para se transformar em energia). Separar e depositar o lixo no local correto faz parte da rotina dos suecos desde os anos 80.',
    imagePath: 'assets/shopping.jpg',
    url: 'https://nit.pt/vanity/lojas-e-marcas/este-shopping-so-vende-pecas-em-segunda-mao-e-e-um-sucesso-mundial',
    date: '07/02/2019',
  ),
  new Item(
    title: 'A mais incrível biblioteca do mundo tem estantes até ao teto e um milhão de livros',
    description: 'É o que se chama de um dois em um: inaugurada no final de 2017, a Biblioteca Tianjin Binhai, na China, uma das maiores de sempre, atrai tanto amantes da literatura como da arquitetura, sendo um exemplo sublime de ambas. Os turistas e moradores também a adoram, e em pouco mais de um ano, mais de três milhões de pessoas já a foram conhecer.'
        '\n\nNa cidade costeira de Tianjin, no norte da China, surgiu a ideia de construir um megalómano monumento aos livros, ao conhecimento e à arquitetura. Tudo isto estrategicamente pensado para ser mais um foco impulsionador do centro cultural do distrito de Binhai, em Tianjin, uma metrópole costeira na China que está em franco desenvolvimento nos últimos anos.'
        '\n\nCom mais de 33 mil metros quadrados, são precisos vários dias para percorrer as estantes todas e seriam precisos anos para ler todos os seus livros, porém não se deixe enganar: com tanto espaço para encher, alguns livros são falsos, meramente decorativos, o que não impede que haja uma oferta de mais de 200 mil obras da literatura — reais.'
        '\n\nA biblioteca abriu em outubro de 2017 e na primeira semana após a inauguração, aproximadamente 10.000 pessoas por dia chegaram a visita-la, criando enormes filas do lado de fora.',
    imagePath: 'assets/biblioteca.jpg',
    url: 'https://nit.pt/out-of-town/viagens/a-mais-incrivel-biblioteca-do-mundo-tem-estantes-ate-ao-teto-e-um-milhao-de-livros',
    date: '17/01/2019',
  ),
  new Item(
    title: 'O farol mais visitado do ano é o mais alto do País e tem uma história com séculos',
    description: 'É na praia da Barra, em Ílhavo, que se encontra o farol que mais visitas teve em Portugal no ano que agora terminou. Segundo a Autoridade Marítima Nacional, o Farol da Barra, ou de Aveiro como também é conhecido, recebeu mais de 15 mil visitantes no ano que marcou o seu 125.º aniversário.'
        '\n\nDe acordo com os dados da Autoridade Marítima, citados pelo “Notícias de Aveiro”, os 28 faróis portugueses abertos ao público no continente e ilhas receberam, no total, 101.613 visitantes em 2018, o que traduz um novo recorde.'
        '\n\nE a estrutura na praia da Barra, em Ílhavo, teve sozinha 15.561 visitantes num ano, tornando-a na mais procurada.'
        '\n\nDe acordo com a câmara de Ílhavo, todas as quartas-feiras à tarde qualquer pessoa consegue visitar o Farol da Barra, tendo três subidas por tarde, no período entre as 13h30 e as 16h30 (no inverno); e das 14 às 17 horas, no verão. Para o público em geral não é preciso marcação: basta aparecer.'
        '\n\nA única ressalva é que tem de subir uma grande escadaria: são 288 graus, até ao topo. Mas uma vez lá em cima, tem uma vista indescritível.'
        '\n\nÀ data da sua construção foi o sexto maior do mundo, em alvenaria de pedra, continuando a ser atualmente o segundo maior da Europa e o 26.º mais alto do mundo. No total, a torre tem 62 metros de altura e 66 acima do nível médio das águas do mar.',
    imagePath: 'assets/farol.jpg',
    url: 'https://nit.pt/out-of-town/farol-visitado-do-pais-2018',
    date: '14/01/2019',
  ),
  new Item(
    title: 'Pão, cereais, bolachas e batatas fritas vão ter menos sal até 2021',
    description: 'Segundo a legislação de 2009, o teor máximo de sal por cada 100 gramas de pão está fixado nos 1,4 gramas. Até 2021, a Direção Geral da Saúde (DGS) quer reduzir esse valor para um grama. O organismo tem vindo a reunir-se com indústria alimentar nas últimas semanas e há mais produtos que podem vir a ter menos cloreto de sódio durante os próximos anos.'
        '\n\nAs tostas, os cereais de pequeno-almoço, o queijo, sopas, biscoitos, bolachas e batatas fritas também estão entre as propostas da DGS. Segundo o site “Sapo”, já estão a ser criados protocolos com várias entidades da indústria alimentar para reduzir os valores durante os próximos anos.'
        '\n\nPara a Organização Mundial de Saúde, os portugueses estão a consumir em média mais do dobro da dose de sal recomendada, que é de cinco gramas por dia. A isto estão associadas doenças como hipertensão e AVC, uma das principais causas de morte no País.',
    imagePath: 'assets/pao.jpg',
    url: 'https://nit.pt/fit/saude/pao-cereais-bolachas-batatas-fritas-vao-ter-menos-sal-ate-2021',
    date: '30/01/2019',
  ),
  new Item(
    title: 'Novo estudo: pode queimar até 140 calorias se tomar banho desta forma',
    description: 'Chegou a notícia que todos os preguiçosos esperavam: é possível queimar calorias enquanto relaxa no banho. De acordo com um estudo realizado pelas Universidades Nottingham Trent e Loughborough, no Reino Unido, o truque está em tomar um banho quente de imersão.'
        '\n\nAs conclusões, publicadas em janeiro no “Journal of Applied Physiology”, revelam que basta ficar imerso numa banheira com água a 39 graus, durante uma hora. O teste foi feito com pessoas acima do peso ideal.'
        '\n\nComo é que se conseguem queimar tantas calorias? “Os vasos sanguíneos dilatam-se para tentar transferir parte do calor do sangue para a atmosfera circundante. Essa mudança, então, tem impacto na pressão sanguínea. Por isso, para manter a pressão estável, a frequência cardíaca também aumenta”, explica Steve Faulkner, da Universidade Nottingham Trent. Resultado: os batimentos aceleram e o gasto calórico aumenta.'
        '\n\nPara sermos mais precisos, é possível queimar 140 calorias durante 60 minutos — o equivalente a meia hora de caminhada.'
        '\n\nO estudo revelou, ainda, que este tipo de banho ajuda a manter níveis saudáveis ​​de açúcar no sangue e ainda melhora a qualidade do sono.'
        '\n\nMas os investigadores deixam um aviso: o banho quente de imersão não funciona como um atalho ou substituto do exercício físico. Ele vai trazer apenas alguns dos seus benefícios, devendo ser visto como um complemento.',
    imagePath: 'assets/banho.jpg',
    url: 'https://nit.pt/fit/saude/novo-estudo-se-tomar-banho-assim-pode-queimar-140-calorias',
    date: '08/02/2019',
  ),
  new Item(
    title: 'Pingo Doce passa a vender cotonetes de papel — e reduz plástico em 25 mil quilos',
    description: 'É mais um passo na luta contra os plásticos e por um ambiente mais saudável. Uma das principais cadeias de supermercados em Portugal, o Pingo Doce, anunciou que vai deixar de comercializar cotonetes em plástico. Estes foram substituídos por cotonetes de bastão em papel, o que vai reduzir em cerca de 25 mil quilos, por ano, a utilização de plástico da marca.'
        '\n\nA cadeia explica que o novo produto, que já está à venda nas lojas, pretende contribuir para a redução da poluição marítima. Mais precisamente, a iniciativa insere-se na estratégia de responsabilidade social do Pingo Doce, neste caso do programa ‘Amar o Mar’, com várias iniciativas em prol da preservação dos oceanos.'
        '\n\nEm janeiro, e também inserida neste programa, o Pingo Doce iniciou a substituição, em várias lojas, dos sacos de plástico vendidos para o transporte das compras por um saco feito com, pelo menos, 80% de plástico reciclado.'
        '\n\nAlém da redução direta do uso de plásticos não recicláveis, com estas medidas a marca pretende sensibilizar os clientes para a importância da separação e reutilização dos produtos do dia a dia.',
    imagePath: 'assets/pingo.jpg',
    url: 'https://nit.pt/buzzfood/gourmet-e-vinhos/pingo-doce-adopta-cotonetes-papel-reduz-plastico-25-mil-quilos',
    date: '05/02/2019',
  ),
  new Item(
    title: 'A maior ponte pedonal suspensa do mundo está a nascer em Arouca',
    description: 'Foi há pouco mais de dois meses que os Passadiços do Paiva foram distinguidos com o prémio de Melhor Atração de Turismo de Aventura do Mundo. Os World Travel Awards, conhecidos como os Óscares do turismo, reconheceram pela segunda vez este incrível percurso em Portugal.'
        '\n\nAgora, o município de Arouca veio confirmar o que já tinha sido prometido há dois anos: a construção da maior ponte pedonal suspensa do mundo, na mesma região.'
        '\n\nSegundo a Câmara de Arouca, a estrutura já está a ser erguida mas, no final do mês de janeiro, ganhou um novo impulso. Isto porque foi aprovada a candidatura da autarquia a fundos comunitários para financiar a ponte suspensa sobre o Rio Paiva.'
        '\n\nA gigante estrutura — terá 516 metros de comprimento, a uma altura de 175 metros do solo —  será co-financiada em quase metade do valor total do investimento pelo programa PROVERE, do FEDER. O custo da obra é de cerca de 1,8 milhões de euros.'
        '\n\nA ponte pedonal suspensa sobre o rio Paiva deverá abrir ao público ainda este ano. Descrita como “assustadoramente bela”, pela autarquia, fica nas imediações da Cascata das Aguieiras e da Garganta do Paiva. A estrutura será segurada por cabos e o pavimento é feito de gradil metálico, com uma largura de cerca de 1,20 metros.',
    imagePath: 'assets/arouca.jpg',
    url: 'https://nit.pt/out-of-town/back-in-town/a-maior-ponte-pedonal-suspensa-do-mundo-esta-nascer-em-arouca',
    date: '05/02/2019',
  ),
  new Item(
    title: 'EUA estão congelados: Trump já implorou pelo regresso do aquecimento global',
    description: 'Enquanto o presidente norte-americano continua a jurar que as alterações climáticas não passam de um mito urbano, a maior parte dos EUA vive dias complicados devido a um inverno extremo, como não há registos. Várias cidades, sobretudo do Midwest e da Costa Leste, estão a passar por uma vaga de frio onde as temperaturas são próximas — ou podem até ser mais baixas — do que as da Antártica. Quase 75% do território vai ter temperaturas negativas nos próximos dias.'
        '\n\nChicago, a maior cidade do Illinois e uma das mais populosas dos EUA, é das mais afetadas por esta vaga de frio siberiana, a que as autoridades chamam de “vórtice polar”.'
        '\n\nAs previsões dizem que os valores podem baixar aos -30 graus Celsius. Mas devido aos ventos frios, estes valores aproximam-se mais, em termos de sensação térmica, dos -48 graus.'
        '\n\nCaso a previsão se materialize, será a menor temperatura da cidade americana desde que as autoridades começaram a medir e manter registos.'
        '\n\nSão mais de 212 milhões de pessoas afetadas, o que levou o presidente Donald Trump, na segunda-feira, a intervir oficialmente no Twitter. Na noite de segunda-feira, o presidente twittou : “No belo Midwest, as temperaturas do vento estão a chegar aos menos 60 graus, o maior frio já registado. Nos próximos dias, as pessoas não podem sair de casa nem por minutos. O que diabo está a acontecer com o Aquecimento Global? Por favor, volta rápido, precisamos de ti!”',
    imagePath: 'assets/chicago.jpg',
    url: 'https://nit.pt/out-of-town/viagens/eua-estao-congelados-com-temperaturas-abaixo-da-antartica-as-imagens-sao-surreais',
    date: '30/01/2019',
  ),
  new Item(
    title: 'Lisboa e Madeira podem ficar ligados por um ferry',
    description: 'Depois do regresso dos ferry entre Funchal e Portimão, pode estar agora a chegar a ligação entre a Madeira e Lisboa. A intenção foi anunciada a 12 de janeiro, pela ministra do Mar, Ana Paula Vitorino, durante a abertura da II Convenção dos Estados Gerais PS-Madeira, na capital madeirense.'
        '\n\nSegundo o jornal “Público”, a administração do Porto de Lisboa está a estudar uma localização para que seja colocada uma rampa de acesso para automóveis. O projeto ia ser apresentado no final de janeiro, mas até agora não houve novidades. Por enquanto não se sabe qual será frequência, nem quando vão começar a ser feitas as primeiras ligações.'
        '\n\nO transporte por ferry entre a Madeira e o Portugal Continental esteve parado nos últimos anos. No verão de 2018 a ligação foi retomada entre o Funchal e Portimão, no Algarve. Apenas foram realizadas 12 viagens. O percurso demorou perto de 23 horas e os valores variaram entre os 29€ os 80€, sempre com desconto para os residentes na Ilha.'
        '\n\nA ministra do Mar está na Madeira para participar na inauguração do radar meteorológico do Porto Santo.',
    imagePath: 'assets/ferry.jpg',
    url: 'https://nit.pt/out-of-town/lisboa-e-madeira-podem-ficar-ligados-por-um-ferry',
    date: '13/01/2019',
  ),
  new Item(
    title: 'As novas bonecas da Barbie têm deficiências físicas',
    description: 'A Mattel está cada vez mais inclusiva. Depois de ter lançado uma coleção de Barbies com diferentes tipos de corpos e cores de pele, anunciou esta terça-feira, 12 de fevereiro, duas novas bonecas com deficiências físicas.'
        '\n\nAs propostas, que só vão estar à venda em Portugal a partir de junho, incluem uma Barbie em cadeira de rodas e outra com uma prótese numa das pernas. Por enquanto, ainda não foram revelados os preços.'
        '\n\nCriada em 1959, é uma das mais famosas do mundo para os miúdos. Neste momento, existem mais de 200 bonecas, todas elas com profissões diferentes. Para festejar o 60.ª aniversário, a Mattel lançou estes dois modelos, que pertencem à “Fashionistas” — uma linha mais realista e inclusiva.'
        '\n\nEste ano, a empresa americana quer lançar também outras bonecas, com novos tipos de corpo. As futuras Barbies terão uma cintura menos delineada, um busto menor, braços mais definidos e uma nova textura de cabelo. ',
    imagePath: 'assets/barbie.jpg',
    url: 'https://nit.pt/vanity/lojas-e-marcas/as-novas-bonecas-da-barbie-tem-deficiencias-fisicas',
    date: '12/02/2019',
  ),
];
