require 'date'

p 'v: 0.01'

App::Update.create(
  version: '0.01',
  release_date: DateTime.strptime('03/12/22', '%d/%m/%y'),
  description: 'O desenvolvimento do sistema começou! Originado de um protótipo funcional desenvolvido em ambiente no-code e com objetivo de ser o trabalho de conclusão de curso de seu criador, a versão web está a caminho!',
  added_features: '- Ruby on Rails | Framework Backend definido como padrão do projeto.- Tailwind e Flowbite | Adicionado bibliotecas de estilização para o projeto.',
  removed_features: '',
  bugs_fixed: ''
)

p 'v: 0.02'

App::Update.create(
  version: '0.02',
  release_date: DateTime.strptime('04/12/22', '%d/%m/%y'),
  description: '',
  added_features: '- Layout Base | Configuração das telas base e do menu de navegação do sistema.- Criação dos Modelos | Criação dos principais objetos do sistema. Diretrizes geradas a partir do Diagrama de Classes elaborado previamente.- Importação da Base de Dados | Criação dos arquivos de importação com dados do protótipo funcional elaborado anteriormente.',
  removed_features: '- Integração com Google Workspace | Devido à alteração de framework, a interação com serviços do Google precisou ser removido.',
  bugs_fixed: ''
)

p 'v: 0.03'

App::Update.create(
  version: '0.03',
  release_date: DateTime.strptime('30/01/23', '%d/%m/%y'),
  description: 'Este patch de atualizações é considerado relevante. Nele, as principais telas de listagem de dados de diversos modelos da aplicação foram implementados, influenciando o comportamento de toda aplicação.',
  added_features: '- Componentes Tailwind | Definição das principais classes de estilização da aplicação.- Tela de Detalhes | Elaborado uma nova tela independênte e diferente do formulário para renderização dos registros do sistema.- Menu de Filtros | Adicionado uma sidebar lateral com objetivo de ser utilizada como menu de filtros do modelo em evidência.- Botões de Navegação | Adicionado botões de navegação que permitem o usuário cancelar a operação, retornando para tela inicial do modelo ou para tela anterior, caso exista.',
  removed_features: '',
  bugs_fixed: ''
)

p 'v: 0.04'

App::Update.create(
  version: '0.04',
  release_date: DateTime.strptime('31/01/23', '%d/%m/%y'),
  description: '',
  added_features: '- Critérios de Pesquisa (Cidades) | Agora o sistema permite realizar filtros das cidades com base em seus respectivos estados e cidades que tenham instituições vinculadas.- Critérios de Pesquisa (Prospecções) | Agora o sistema permite realizar filtros das prospecções com base em seus respectivos status.',
  removed_features: '',
  bugs_fixed: '- Tabela de Cidades | Agora o sistema armazena apenas as cidades registradas pelos usuários, não mais um banco de dados com todas as cidades do PR e SC.'
)

p 'v: 0.05'

App::Update.create(
  version: '0.05',
  release_date: DateTime.strptime('01/02/23', '%d/%m/%y'),
  description: '',
  added_features: '- Relação de Cursos Atualizada | A relação de curso das principais instituições estão presentes no sistema. (opcional)- Formatação Condicional para Atendimentos | Agora o sistema exibe icones e cores personalizadas para cada tipo de atendimento.',
  removed_features: '',
  bugs_fixed: '- Atendimentos vinculados a Turmas | Agora o critério para registrar um atendimento passa a ser obrigatoriamente uma Turma, e não mais um aluno.'
)

p 'v: 0.06'

App::Update.create(
  version: '0.06',
  release_date: DateTime.strptime('14/02/23', '%d/%m/%y'),
  description: '',
  added_features: '- Critério de Filtros (Alunos) | Agora o sistema permite realizar filtros dos Alunos com base em seus respectivos nomes ou emails.',
  removed_features: '- Importação de Alunos | A tabela de alunos importados a partir protótipo funcional foram removidos da plataforma.',
  bugs_fixed: '- Alunos do Atendimento | Corrigido um problema que impedia a adição de alunos ao atendimento.- Melhorias no Layout | Diversas melhorias no design da aplicação.'
)

p 'v: 0.07'

App::Update.create(
  version: '0.07',
  release_date: DateTime.strptime('19/02/23', '%d/%m/%y'),
  description: '',
  added_features: '- Suporte a Imagens | Agora é possível vincular uma imagem a cada Instituição. Esta função ainda esta em testes e esta disponível apenas de forma local.- Importação Atualizadas | As logos das principais instituições foram adicionadas ao projeto e vinculadas ao arquivo de importação (opcional).- Página Comercial | Agora o sistema permite visualizar informações baseado nos status das negociações e seus respectivos representantes.',
  removed_features: '',
  bugs_fixed: '- Melhorias no Layout | Diversas melhorias no design da aplicação.'
)

p 'v: 0.08'

App::Update.create(
  version: '0.08',
  release_date: DateTime.strptime('22/02/23', '%d/%m/%y'),
  description: '',
  added_features: '- Gerenciamento de Empresas | Agora é possível gerenciar empresas concorrente para gerar estatísticas de mercado.- Menu Configurações | As empresas ficarão listadas no menu de Configurações, junto com as demais configurações da aplicação.',
  removed_features: '- Barra de Rolagem | Layout adaptado para um display fixo. A rolagem continua funcionando, porém, com a barra de rolagem oculta.',
  bugs_fixed: '- Melhorias no Layout | Diversas melhorias no design da aplicação.'
)

p 'v: 1.00'

App::Update.create(
  version: '1.00',
  release_date: DateTime.strptime('24/02/23', '%d/%m/%y'),
  description: 'Esta atualização é relevante, pois adiciona diversos recursos e implanta alguns recursos que estavam em testes.',
  added_features: '- Portal de Acesso | Telas de login foram adicionadas para restringir o acesso à informação.- Suporte a Imagens AWS | Agora o sistema possui integração com Amazon Web Services para permitir o upload de imagens de forma pública.- SQLite3 to PostgreSQL | Substituição do banco de dados para implantação em produção.- Deploy on Heroku | A primeira versão da aplicação em ambiente de produção foi realizada.- Tradução de Notificações | As principais notificações foram traduzidas para pt-BR.',
  removed_features: '- Suporte a Imagens Local | O upload de imagens foi direcionado exclusivamente para os serviços da AWS S3.',
  bugs_fixed: '- Filtros Vazios | Corrigido problema que impedia o filtro de informações com critérios vazios.- Melhorias no Layout | Diversas melhorias no design da aplicação.'
)

p 'v: 1.01'

App::Update.create(
  version: '1.01',
  release_date: DateTime.strptime('28/02/23', '%d/%m/%y'),
  description: 'Atualização importante que traz novas funcionalidades e altera o comportamento de algumas telas do sistema.',
  added_features: '- Hotwire e Stimulus | Tecnologias adicionadas para tornar formulários dinâmicos. Com isto, as opções disponíveis para seleção são filtradas com base nos critérios estabelecidos populando o menu de opções com opções filtradas.',
  removed_features: '- Exibição Geral | Para um melhor desempenho, a tela inicial de cada menu passa a ser condicionada a um filtro condicional. Desta forma, os dados são carregados mediante o filtro, melhorando significativamente o desempenho da aplicação.',
  bugs_fixed: '- Cidades | Atualizado relação de Cidades e Estados do Brasil. Devido a erros ortográficos da biblioteca anterior, alguns recursos não eram filtrados corretamente.'
)

p 'v: 1.02'

App::Update.create(
  version: '1.02',
  release_date: DateTime.strptime('02/03/23', '%d/%m/%y'),
  description: '',
  added_features: '- Paginação | Algumas telas como Atendimentos, Cidades, Alunos e Representantes passam a listar os dados de forma paginada.- Acesso Guiado | Algumas telas passam a exibir instruções do que precisa ser cadastrado para facilitar o uso da aplicação com uma base de dados limpa.',
  removed_features: '',
  bugs_fixed: '- Ajustes de Layout | Layout corrigido para adicionar recursos da paginação de forma dinâmica.'
)

p 'v: 1.03'

App::Update.create(
  version: '1.03',
  release_date: DateTime.strptime('10/03/23', '%d/%m/%y'),
  description: '',
  added_features: '- Integração com Docker | Agora a aplicação passa a ser hospedada em contêineres gerenciados pelo Docker. Isto possibilita a expansão do projeto com outros desenvolvedores e a escalabilidade da aplicação.',
  removed_features: '',
  bugs_fixed: '- Variáveis de Ambiente | Definido arquivo modelo para realizar as configurações da aplicação no ambiente Docker / Heroku.'
)

p 'v: 1.04'

App::Update.create(
  version: '1.04',
  release_date: DateTime.strptime('31/03/23', '%d/%m/%y'),
  description: '',
  added_features: '- Testes de Unidade | Escrito uma série de testes para tornar a aplicação mais estável com base em seus contextos.',
  removed_features: '',
  bugs_fixed: '- Tarefas da Aplicação | Separado as tarefas que importavam dados e geravam dados fictícios.'
)

p 'v: 1.05'

App::Update.create(
  version: '1.05',
  release_date: DateTime.strptime('06/04/23', '%d/%m/%y'),
  description: '',
  added_features: '- Testes de Sistema | Implementado uma série de testes em relação às visualizações disponíveis. Estes testes garantem que as informações, links, filtros e notificações serão renderizadas corretamente.',
  removed_features: '',
  bugs_fixed: '- Testes de Unidade | Revisão de alguns testes que apresentaram problemas devido a memória disponível no ambiente Docker.- Atualização de Layout | Uma série de alterações foi feita para que os testes de visualizações fossem bem sucedidos.'
)

p 'v: 1.06'

App::Update.create(
  version: '1.06',
  release_date: DateTime.strptime('18/04/23', '%d/%m/%y'),
  description: '',
  added_features: '',
  removed_features: '',
  bugs_fixed: '- Testes (Unidade e Sistema) | Revisão de todos os testes da aplicação.- Atualização de Layout | Uma série de alterações foi feita para que os testes de visualizações fossem bem sucedidos.'
)

p 'v: 1.07'

App::Update.create(
  version: '1.07',
  release_date: DateTime.strptime('02/05/23', '%d/%m/%y'),
  description: '',
  added_features: '- Integração Contínua (CI) | Configuração do repositório para que a aplicação realize a integração contínua de novas atualizações.- Implantação Contínua (CD) | Configuração do repositório para que a aplicação realize o deploy automático após as atualizações serem bem sucedidas. Desta forma, as novas atualizações são colocadas em produção apenas após os testes passarem.',
  removed_features: '',
  bugs_fixed: '- Workflows | Uma série de ajustes foi realizado nas configurações nos ambientes Docker/Heroku/GitHub para viabilizar o processo de CI/CD.'
)

p 'v: 1.08'

App::Update.create(
  version: '1.08',
  release_date: DateTime.strptime('17/05/23', '%d/%m/%y'),
  description: '',
  added_features: '',
  removed_features: '',
  bugs_fixed: '- Testes | Resetado banco de dados da aplicação, deixando apenas dados coerêntes para demonstração da mesma.'
)

p 'v: 1.09'

App::Update.create(
  version: '1.09',
  release_date: DateTime.strptime('24/05/23', '%d/%m/%y'),
  description: '',
  added_features: '- Documentação | Escrita documentação do repositório com detalhes sobre a instalação do projeto.',
  removed_features: '',
  bugs_fixed: ''
)

p 'v: 1.10'

App::Update.create(
  version: '1.10',
  release_date: DateTime.strptime('07/06/23', '%d/%m/%y'),
  description: '',
  added_features: '- Responsividade | Adicionado recursos de responsividade a aplicação.',
  removed_features: '- Testes | Os testes foram temporariamente desabilitados para integrar a versão responsiva a aplicação.',
  bugs_fixed: '- Layouts | Diversas alterações foram realizadas nos templates da aplicação para torná-la responsiva.'
)

p 'v: 1.11'

App::Update.create(
  version: '1.11',
  release_date: DateTime.strptime('08/06/23', '%d/%m/%y'),
  description: 'Considerada a primeira versão estável da aplicação, nosso produto está apto para ser comercializado.',
  added_features: '',
  removed_features: '',
  bugs_fixed: '- Refatoração | Para tornar a manutenção do código mais eficiente, uma série de refatoração de código foi realizada.'
)

p 'v: 1.12'

App::Update.create(
  version: '1.12',
  release_date: DateTime.strptime('10/07/23', '%d/%m/%y'),
  description: '',
  added_features: '- Site | A aplicação agora possui um site de apresentação para tornar a comunicação com novos clientes mais assertiva.',
  removed_features: '',
  bugs_fixed: ''
)

p 'v: 1.13'

App::Update.create(
  version: '1.13',
  release_date: DateTime.strptime('16/07/23', '%d/%m/%y'),
  description: '',
  added_features: '- Atualizações do Site | Adição das principais informações do site para demonstração dos serviços oferecidos.- Alteração do Nome | O projeto deixa de se chamar \'Mapeamento Comercial\' e assume o nome de \'FORMAgestor\'.- Registro do Domínio | Aquisição do domínio para hospedação da aplicação demonstração.',
  removed_features: '',
  bugs_fixed: ''
)

p 'v: 1.14'

App::Update.create(
  version: '1.14',
  release_date: DateTime.strptime('19/07/23', '%d/%m/%y'),
  description: '',
  added_features: '- Branding | Definido elementos de branding e identidade visual da marca e produto.- Mailers | Adicionado formulários de contato e de newsletter com emails automatizados.',
  removed_features: '',
  bugs_fixed: '- Newsletter | Corrigido comportamento inadequado para cancelar inscrição da Newsletter.'
)

p 'v: 1.15'

App::Update.create(
  version: '1.15',
  release_date: DateTime.strptime('21/07/23', '%d/%m/%y'),
  description: '',
  added_features: '- Integração Site/App | Nesta atualização o repositório do site passa a hospedar uma cópia da aplicação para fins de demonstração.- Servidores Dedicados | Para futuros clientes, a aplicação será implantada em servidores dedicados, garantindo a integridade dos dados de forma individual e reservada.',
  removed_features: '',
  bugs_fixed: ''
)
