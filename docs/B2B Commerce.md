Guide - https://developer.salesforce.com/docs/commerce/salesforce-commerce/guide/b2b-b2c-comm-dev-guide.html

---
### [[Get Started with B2B Commerce|B2B Commerce Fundamentals e Arquitetura]]
O B2B Commerce permite criar lojas B2B dinâmicas e atraentes, que aumentam o engajamento do comprador e impulsionam as vendas. Ele funciona como um armazém digital onde as prateleiras virtuais estão sempre abastecidas. O B2B Commerce é perfeito para o ecossistema da Salesforce. Cada loja inclui o mesmo desempenho, segurança e escalabilidade de todas as tecnologias padrão da Salesforce Platform.

A Salesforce Commerce Platform é aberta e extensível. Seus requisitos mínimos de configuração e a  camada de programação declarativa significam que os administradores e os operadores comerciais podem realizar rapidamente as tarefas de desenvolvimento e configuração e da loja.

#### Web Stack com velocidade
O aplicativo ***Commerce*** é executado no *Lightning Web Stack*, que administra o tempoo de execução da Web e o serviçõ de dados, e oferece componentes reutilizáveis baseados na Web. Isso significa que você pode acessar o mesmo modelo de dados declarativo e extensível, e o **AgentExchange*** para aplicativos e parceiros.
![[WebStack.png]]
*O **Lightning Web Runtime (LWR)*** é uma estrutura de aplicativo somente para o LWC projetada a ser rápida e personalizada.

##### Conjunto completo de API
Além disso, a plataforma oferece um conjunto abrangente de APIs e ferramentas de desenvolvimento que simplificam o processo de criação e implantação de aplicativos. Com os modelos de páginas totalmente funcionais do B2B Commerce, os desenvolvedores podem usar essas ferramentas oara criar inferfaces personalizadas, fluxos de trabalho e integrações que aprimoram a experiência geral do cliente e impulsionam o crescimento do negócio.

Os desenvolvedores estão encantadas com o fato do aplicativo do Commerce ter sido criado com base em experiências modernas no padrão da Web.

-  **Produtividade aprimorada com padrões da Web:** Uso de uma linguagem moderna da Web: ES5+, elementos personalizados, classes, módulos e importações.  
    
- **Aberto, transparente e portátil:** Uso de blocos de construção modulares para codificar as experiências desejadas com suas ferramentas preferidas na mesma plataforma.  
    
- **Criado para ser usado em escala empresarial:** Adoção da arquitetura que o Salesforce usa para dimensionar o Lightning, Comunidades e Dispositivos móveis há anos.

#### O modelo de dados do Commerce
O modelo de dados do Commerce conecta os objetos da loja B2B. Os relacionamentos de objetos padrão são compatíveis com uma experiência completa de loja B2B.

- **Catálogo (Catalog):** O catálogo é a coleção completa de produtos oferecidos na loja.  
    
- **Categoria (Category):** Um agrupamento lógico de produtos. Crie várias categorias para uma hierarquia navegável.  
    
- **Política de direitos (Entitlement Policy):** O “segurança” do cliente B2B que gerencia o acesso a produtos e preços.  
    
- **Produto (Product):** Os produtos que estão disponíveis para os clientes.  
    
- **Catálogo de preços (Price Book):** O preço negociado para compradores.  
    
- **Conta do comprador (Buyer Account):** Os dados de B2B que representam um comprador específico.  
    
- **Grupo de compradores (Buyer Group):** Um agrupamento de compradores B2B que compartilham características comuns.

##### O Objeto Store (Loja)
O objeto (Store) Loja, representa o site. É o objeto central do Commerce que oferece maxima flexibilidade para os requisitos comerciais.

As lojas (sites) B2B usam uma abordagem baseada em componente e modelo para a experiência de compra front-end. Os operadores comerciais do Commerce usam os modelos e os componentes Lightning Web Runtime (LWR) para exibir produtos, organizar informações para compradores e processar pedidos para sua loja.

![[DataModel.png]]
###### [[Product and Catalog Data Model|Catálogo (Catalog)]]
Catálogos são o objeto organizacional que permite oferecer produtos em uma loja. Cada loja B2B tem um catálogo específico de produtos. 
![[ProductCatalogModel.png]]

| ![[ProductCatalogModel.png]] | ![[CataalogDataModel.png]] |
| ---------------------------- | -------------------------- |

###### [Categorias (Category)](https://help.salesforce.com/s/articleView?id=commerce.comm_categories_intro.htm&type=5)
As categorias desempenham um papel crucial na organização e apresentação de produtos aos clientes. No modelo de dados do aplicativo Commerce, o objeto Category (Categoria) representa categorias e subcategorias. Esse objeto controla como os clientes pesquisam um produto.

As categorias têm uma estrutura hierárquica que normalmente representa um relacionamento pai-filho. Um único catálogo inclui categorias e subcategorias de até cinco níveis. Use a estrutura em forma de árvore para criar agrupamentos de produtos que facilitam a navegação dos clientes e a localização de produtos semelhantes ou que pertencem a uma categoria específica.

![[catalogoDePrecos.png]]

###### [Produtos (Product2)](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_product2.htm?q=PriceBook2)
O objeto Produto lista cada um dos produtos em forma de um registro. O registro do produto contém dados como descrições do produto, especificações e links para mídia do produto que ajudam os clientes a tomar decisões fundamentadas. Cada produto tem seu próprio número de identificação da Unidade de manutenção de estoque (SKU).

###### [Catálogos de preços  (Pricebook2)](https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_pricebook2.htm?q=PriceBook2)
O objeto Catálogo de preços gerencia e organiza os preços dos produtos. Ele desempenha um papel crucial na determinação dos preços unitários de produtos ou serviços. É necessário um catálogo de preços para exibir preços de oportunidades, cotações e pedidos.

O modelo de dados aceita um catálogo de preços padrão juntamente com catálogos de preços personalizados vinculados a grupos de compradores. Você também pode configurar um catálogo de preços com preços riscados que destaca preços reduzidos para clientes -> [[Price Book Data Limits|Limites do Pricebook2]].

![[ProductToCategory.png]]

###### Compradores e grupos de compradores (Buyer & Buyer Groups)
- **[Comprador ( Buyer )](https://help.salesforce.com/s/articleView?id=commerce.comm_person_buyer_accounts.htm&type=5)** - Um comprador é uma pessoa ou um contato associado a uma empresa ou organização que compra produtos ou serviços. Os compradores recebem funções, responsabilidades e permissões relacionadas ao processo de compra. Um comprador pode ser associado a uma conta específica ou a um grupo de compradores.
- **[Grupo de compradores ( Buyer Group )](https://help.salesforce.com/s/articleView?id=commerce.comm_buyer_groups.htm&type=5)** - Um grupo de compradores é uma coleção de compradores individuais ou atributos em comuns. Os grupos de compradores geralmente sçao organizados com base em fatores como o tipo de empresa, setor ou preferências de compra.

![[BuyerGroupDataModel.png]]

###### [Políticas de direitos (Entitlement Policy)](https://help.salesforce.com/s/articleView?id=commerce.comm_entitlement_policies_intro.htm&type=5)
Uma Política de direitos é um objeto que aplica condições específicas para o acesso do comprador a determinados produtos e preços. Os grupos de compradores são vinculados às políticas de direitos.  

Por exemplo, uma política de direitos pode especificar que um grupo de compradores ou determinado nível ou com um nível de assinatura específica tem direito a acessar produtos ou serviços premium.

![[Policy.png]]

| **Modelos de página do Commerce** |                              |
| --------------------------------- | ---------------------------- |
| Início                            | Confirmação do pedido        |
| Carrinho                          | Pesquisa do pedido           |
| Categoria                         | Detalhes do resumo do pedido |
| Checkout                          | Lista de resumo do pedido    |
| Login                             | Processamento de pagamentos  |
| Minha Lista                       | Pesquisa de produtos         |
| Meu perfil                        | Remessas divididas           |
