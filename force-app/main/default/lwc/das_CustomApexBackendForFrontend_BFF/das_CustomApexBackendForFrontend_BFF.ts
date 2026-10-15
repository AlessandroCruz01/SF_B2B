//* Data Access Strategy - (Priority 3) Custom Apex Backend For Frontend (BFF)
//? Custom Apex Backend For Frontend (BFF) é um padrão de arquitetura de software que envolve a criação de um backend personalizado para atender às necessidades específicas de um frontend. Em resumo, o BFF é a classe Apex (@AuraEnabled) que o seu LWC chama
//? Regra: se existe ConnectApi para aquilo, use ConnectApi. SOQL só para o que o ConnectApi não cobre.

import { LightningElement } from 'lwc';

export default class Das_CustomApexBackendForFrontend_BFF extends LightningElement {}
